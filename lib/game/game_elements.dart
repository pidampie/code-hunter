import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'code_hunter_game.dart';

class Fireball extends PositionComponent
    with HasGameReference<CodeHunterGame>, CollisionCallbacks {
  final int direction;
  final double speed = 350.0;

  Fireball({required super.position, required this.direction})
    : super(size: Vector2(8, 8), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(CircleHitbox());
    add(
      CircleComponent(
        radius: 4,
        paint: Paint()..color = const Color(0xFFFF5722),
      ),
    );
    add(
      CircleComponent(
        radius: 2,
        paint: Paint()..color = const Color(0xFFFFEB3B),
        position: Vector2(2, 2),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x += direction * speed * dt;
    if (position.x < game.cameraComponent.viewfinder.position.x - 300 ||
        position.x > game.cameraComponent.viewfinder.position.x + 300) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is EnemyComponent) {
      game.triggerQuiz(other);
      removeFromParent();
    } else if (other is GroundBlock) {
      removeFromParent();
    }
  }
}

class EnemyComponent extends PositionComponent
    with HasGameReference<CodeHunterGame>, CollisionCallbacks {
  final int questionIndex;

  EnemyComponent({required super.position, required this.questionIndex})
    : super(size: Vector2(16, 16), anchor: Anchor.bottomCenter);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox(size: Vector2(16, 16)));
    try {
      final sprite = await game.loadSprite('enemy/slime_1.png');
      add(SpriteComponent(sprite: sprite, size: size));
    } catch (_) {
      add(
        RectangleComponent(size: size, paint: Paint()..color = Colors.black87),
      );
    }
  }

  // FUNGSI INI WAJIB ADA AGAR TIDAK ERROR DI GAME SCREEN
  void onDefeated() {
    removeFromParent();
  }
}

class CoinItem extends PositionComponent
    with HasGameReference<CodeHunterGame>, CollisionCallbacks {
  CoinItem({required super.position})
    : super(size: Vector2(16, 16), anchor: Anchor.center);
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(CircleHitbox()..collisionType = CollisionType.passive);
    try {
      final sprite = await game.loadSprite('items/coin_1.png');
      add(SpriteComponent(sprite: sprite, size: size));
    } catch (_) {}
  }
}

class GemItem extends PositionComponent
    with HasGameReference<CodeHunterGame>, CollisionCallbacks {
  GemItem({required super.position})
    : super(size: Vector2(16, 16), anchor: Anchor.center);
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(CircleHitbox()..collisionType = CollisionType.passive);
    try {
      final sprite = await game.loadSprite('items/gem.png');
      add(SpriteComponent(sprite: sprite, size: size));
    } catch (_) {}
  }
}

class HeartItem extends PositionComponent
    with HasGameReference<CodeHunterGame>, CollisionCallbacks {
  HeartItem({required super.position})
    : super(size: Vector2(16, 16), anchor: Anchor.center);
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(CircleHitbox()..collisionType = CollisionType.passive);
    try {
      final sprite = await game.loadSprite('items/heart.png');
      add(SpriteComponent(sprite: sprite, size: size));
    } catch (_) {}
  }
}

class CloudData {
  double x, y, scale, speed;
  CloudData(this.x, this.y, this.scale, this.speed);
}

class CloudsBackground extends PositionComponent
    with HasGameReference<CodeHunterGame> {
  final List<CloudData> _clouds = [
    CloudData(20, 40, 0.6, 10),
    CloudData(150, 80, 1.0, 20),
    CloudData(300, 30, 0.8, 15),
    CloudData(450, 90, 1.2, 25),
    CloudData(600, 50, 0.7, 12),
  ];

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.65)
      ..style = PaintingStyle.fill;

    for (final c in _clouds) {
      canvas.save();
      canvas.translate(c.x, c.y);
      canvas.scale(c.scale);
      canvas.drawCircle(const Offset(0, 0), 16, paint);
      canvas.drawCircle(const Offset(16, -10), 24, paint);
      canvas.drawCircle(const Offset(32, 0), 16, paint);
      canvas.restore();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    final viewWidth = game.cameraComponent.viewport.virtualSize.x;
    for (final c in _clouds) {
      c.x -= c.speed * dt;
      if (c.x < -100) {
        c.x = viewWidth + 50;
        c.y = 20.0 + (60.0 * (c.speed % 2));
      }
    }
  }
}
