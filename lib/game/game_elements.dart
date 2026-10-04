import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'code_hunter_game.dart';

// 1. Awan transparan di langit
class CloudsBackground extends PositionComponent {
  final List<Vector2> _cloudPositions = [
    Vector2(30, 20),
    Vector2(160, 40),
    Vector2(300, 15),
    Vector2(460, 35),
    Vector2(620, 25),
  ];

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.35)
      ..style = PaintingStyle.fill;

    for (final pos in _cloudPositions) {
      canvas.drawCircle(Offset(pos.x, pos.y), 24, paint);
      canvas.drawCircle(Offset(pos.x + 20, pos.y - 8), 30, paint);
      canvas.drawCircle(Offset(pos.x + 42, pos.y), 22, paint);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(pos.x - 12, pos.y, 66, 22),
          const Radius.circular(11),
        ),
        paint,
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    for (final pos in _cloudPositions) {
      pos.x -= 6 * dt;
      if (pos.x < -100) pos.x = 800;
    }
  }
}

// 2. Musuh Slime (Menapak di tanah/platform dan patroli)
class EnemyComponent extends PositionComponent
    with HasGameReference<FlameGame>, CollisionCallbacks {
  final int questionIndex;
  final double patrolRange;
  late double _startX;
  int _direction = 1;
  final double speed = 35.0;
  SpriteComponent? spriteComponent;

  EnemyComponent({
    required Vector2 position,
    required this.questionIndex,
    this.patrolRange = 35.0,
  }) : super(
         position: position,
         size: Vector2(24, 24),
         anchor: Anchor.bottomCenter,
       );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _startX = position.x;
    add(RectangleHitbox());

    try {
      final sprite = await game.loadSprite('enemy/slime_1.png');
      spriteComponent = SpriteComponent(sprite: sprite, size: size);
      add(spriteComponent!);
    } catch (_) {
      add(
        RectangleComponent(
          size: size,
          paint: Paint()..color = Colors.redAccent,
        ),
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x += _direction * speed * dt;

    if ((position.x - _startX).abs() >= patrolRange) {
      _direction *= -1;
      flipHorizontally();
    }
  }

  void onDefeated() {
    removeFromParent();
  }
}

// 3. Koin Poin (Aset gambar asli dari folder items)
class CoinItem extends PositionComponent
    with HasGameReference<FlameGame>, CollisionCallbacks {
  CoinItem({required Vector2 position})
    : super(position: position, size: Vector2(16, 16), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(CircleHitbox()..collisionType = CollisionType.passive);

    try {
      final sprite = await game.loadSprite('items/coin.png');
      add(SpriteComponent(sprite: sprite, size: size));
    } catch (_) {
      try {
        final sprite = await game.loadSprite('items/coin_1.png');
        add(SpriteComponent(sprite: sprite, size: size));
      } catch (_) {
        // Fallback koin emas jika nama file berbeda
        add(
          CircleComponent(
            radius: 8,
            paint: Paint()..color = const Color(0xFFFFD700),
          ),
        );
      }
    }
  }
}
