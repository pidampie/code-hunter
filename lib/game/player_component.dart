import 'dart:ui';

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
        size: Vector2(26, 34),
        anchor: Anchor.bottomCenter,
      );

  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 150.0;
  final double gravity = 750.0;
  // Lompatan dinaikkan agar sanggup mencapai platform tanah paling atas
  final double jumpForce = -350.0;
  bool isOnGround = false;
  double horizontalInput = 0.0;

  SpriteComponent? spriteComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox(size: Vector2(20, 32), position: Vector2(3, 2)));

    try {
      final sprite = await game.loadSprite('player/char_1.png');
      spriteComponent = SpriteComponent(sprite: sprite, size: size);
      add(spriteComponent!);
    } catch (_) {
      add(
        RectangleComponent(
          size: size,
          paint: Paint()..color = const Color(0xFF2ECC71),
        ),
      );
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalInput = 0.0;
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
        keysPressed.contains(LogicalKeyboardKey.keyA)) {
      horizontalInput -= 1.0;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
        keysPressed.contains(LogicalKeyboardKey.keyD)) {
      horizontalInput += 1.0;
    }
    if ((keysPressed.contains(LogicalKeyboardKey.space) ||
            keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
            keysPressed.contains(LogicalKeyboardKey.keyW)) &&
        isOnGround) {
      velocity.y = jumpForce;
      isOnGround = false;
    }
    return true;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Terapkan gravitasi hanya jika melompat/di udara
    if (!isOnGround) {
      velocity.y += gravity * dt;
    } else {
      velocity.y = 0;
    }

    velocity.x = horizontalInput * moveSpeed;
    position += velocity * dt;

    if (horizontalInput < 0 && !isFlippedHorizontally) {
      flipHorizontally();
    } else if (horizontalInput > 0 && isFlippedHorizontally) {
      flipHorizontally();
    }

    // Jika jatuh ke jurang paling bawah
    if (position.y > 450) {
      game.loseLife();
      respawn();
    }
  }

  void respawn() {
    position = initialPos.clone();
    velocity.setZero();
    isOnGround = false;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // Mendarat presisi di atas lantai/platform tanpa getaran
    if (other is GroundBlock) {
      if (velocity.y >= 0 && position.y <= other.position.y + 10) {
        position.y = other.position.y + 0.1;
        velocity.y = 0;
        isOnGround = true;
      }
    }

    // Menginjak jeruji putih (duri) -> kurangi nyawa
    if (other is TrapBlock) {
      game.loseLife();
      respawn();
    }

    // Menabrak slime -> buka soal kuis
    if (other is EnemyComponent) {
      game.triggerQuiz(other);
      position.x -= (horizontalInput != 0 ? horizontalInput : 1.0) * 16;
    }

    // Mengambil koin poin
    if (other is CoinItem) {
      game.addScore(20);
      other.removeFromParent();
    }

    // Sampai garis finish
    if (other is GoalBlock) {
      other.onReached();
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is GroundBlock) {
      isOnGround = false;
    }
  }
}
