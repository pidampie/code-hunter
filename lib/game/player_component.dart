import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'code_hunter_game.dart';
import 'game_elements.dart';

class PlayerComponent extends PositionComponent
    with HasGameReference<CodeHunterGame>, KeyboardHandler, CollisionCallbacks {
  final Vector2 initialPos;
  PlayerComponent({required this.initialPos})
    : super(
        position: initialPos,
        size: Vector2(24, 32),
        anchor: Anchor.bottomCenter,
      );

  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 130.0;
  final double gravity = 900.0;
  final double jumpForce = -360.0;

  bool isOnGround = false;
  double horizontalInput = 0.0;
  int facingDirection = 1;
  double shootCooldown = 0.0;

  bool isHurt = false;
  double hurtTimer = 0.0;
  SpriteComponent? spriteComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox(size: Vector2(10, 28), position: Vector2(7, 4)));
    try {
      final sprite = await game.loadSprite('player/char_1.png');
      spriteComponent = SpriteComponent(sprite: sprite, size: size);
      add(spriteComponent!);
    } catch (_) {
      add(RectangleComponent(size: size, paint: Paint()..color = Colors.white));
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalInput = 0.0;
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
        keysPressed.contains(LogicalKeyboardKey.keyA)) {
      horizontalInput -= 1.0;
      facingDirection = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
        keysPressed.contains(LogicalKeyboardKey.keyD)) {
      horizontalInput += 1.0;
      facingDirection = 1;
    }
    if ((keysPressed.contains(LogicalKeyboardKey.space) ||
            keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
            keysPressed.contains(LogicalKeyboardKey.keyW)) &&
        isOnGround) {
      velocity.y = jumpForce;
      isOnGround = false;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyF) && shootCooldown <= 0) {
      final fireball = Fireball(
        position: Vector2(position.x + (facingDirection * 12), position.y - 8),
        direction: facingDirection,
      );
      game.gameWorld.add(fireball);
      shootCooldown = 0.4;
    }
    return true;
  }

  // FUNGSI INI WAJIB ADA AGAR TIDAK ERROR DI GAME SCREEN
  void takeDamage() {
    if (!isHurt) {
      game.loseLife();
      isHurt = true;
      hurtTimer = 1.5;
      velocity.y = -200;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (shootCooldown > 0) shootCooldown -= dt;

    if (isHurt) {
      hurtTimer -= dt;
      if (spriteComponent != null)
        spriteComponent!.opacity = (hurtTimer * 10).toInt() % 2 == 0
            ? 0.3
            : 1.0;
      if (hurtTimer <= 0) {
        isHurt = false;
        if (spriteComponent != null) spriteComponent!.opacity = 1.0;
      }
    }

    if (!isOnGround)
      velocity.y += gravity * dt;
    else
      velocity.y = 0;

    velocity.x = horizontalInput * moveSpeed;
    position += velocity * dt;

    if (position.x < size.x / 2) position.x = size.x / 2;
    if (position.x > game.mapWidth - (size.x / 2))
      position.x = game.mapWidth - (size.x / 2);

    if (horizontalInput < 0 && !isFlippedHorizontally)
      flipHorizontally();
    else if (horizontalInput > 0 && isFlippedHorizontally)
      flipHorizontally();

    if (position.y >
        game.cameraComponent.viewfinder.visibleWorldRect.bottom + 50) {
      game.loseLife();
      position = initialPos.clone();
      velocity.setZero();
    }
    isOnGround = false;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is GroundBlock) {
      final kakiPemain = position.y;
      final atasTanah = other.position.y;
      final tengahPemain = position.x;
      final kiriTanah = other.position.x;
      final kananTanah = other.position.x + other.size.x;

      if (velocity.y >= 0 &&
          kakiPemain <= atasTanah + 12 &&
          kakiPemain > atasTanah - 4) {
        if (tengahPemain > kiriTanah - 8 && tengahPemain < kananTanah + 8) {
          position.y = atasTanah;
          velocity.y = 0;
          isOnGround = true;
        }
      }
    }

    if (other is TrapBlock || other is EnemyComponent) {
      takeDamage();
    }
    if (other is CoinItem) {
      game.addScore(10);
      other.removeFromParent();
    }
    if (other is GemItem) {
      game.addScore(50);
      other.removeFromParent();
    }
    if (other is HeartItem) {
      game.addLife(1);
      other.removeFromParent();
    }
  }
}
