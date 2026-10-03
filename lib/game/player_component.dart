import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import 'code_hunter_game.dart';

class PlayerComponent extends SpriteComponent
    with HasGameReference<CodeHunterGame>, KeyboardHandler, CollisionCallbacks {
  PlayerComponent({required super.position})
    : super(size: Vector2(32, 32), anchor: Anchor.center);

  // Fisika Platformer Sederhana
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 160.0;
  final double gravity = 800.0;
  final double jumpForce = -300.0;
  bool isOnGround = false;
  double horizontalInput = 0.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Mengambil sprite karakter Canva dari assets/images/player/
    sprite = await game.loadSprite('player/player_idle.png');
    add(RectangleHitbox());
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
            keysPressed.contains(LogicalKeyboardKey.arrowUp)) &&
        isOnGround) {
      velocity.y = jumpForce;
      isOnGround = false;
    }
    return true;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Kecepatan horizontal
    velocity.x = horizontalInput * moveSpeed;

    // Terapkan Gravitasi
    velocity.y += gravity * dt;

    // Perbarui posisi
    position += velocity * dt;

    // Balik hadap karakter (Flip)
    if (horizontalInput < 0 && !isFlippedHorizontally) {
      flipHorizontally();
    } else if (horizontalInput > 0 && isFlippedHorizontally) {
      flipHorizontally();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // Tabrakan dengan Tanah
    if (other is GroundBlock) {
      if (velocity.y > 0 && position.y < other.position.y + 10) {
        isOnGround = true;
        velocity.y = 0;
        position.y = other.position.y - (size.y / 2);
      }
    }

    // Tabrakan dengan Duri / Trap
    if (other is TrapBlock) {
      // Reset ke posisi awal jika terkena duri
      position = Vector2(100, 100);
      velocity.setZero();
    }
  }
}
