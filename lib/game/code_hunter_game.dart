import 'dart:ui';

import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game_elements.dart';
import 'player_component.dart';

class NormalizedAssetBundle extends PlatformAssetBundle {
  @override
  Future<ByteData> load(String key) {
    final parts = key.split('/');
    final resolved = <String>[];
    for (final part in parts) {
      if (part == '..') {
        if (resolved.isNotEmpty) resolved.removeLast();
      } else if (part != '.' && part.isNotEmpty) {
        resolved.add(part);
      }
    }
    return super.load(resolved.join('/'));
  }
}

class CodeHunterGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  final String levelName;
  final VoidCallback? onLevelCompleted;
  final void Function(EnemyComponent enemy)? onQuizEncounter;
  final VoidCallback? onGameOver;

  CodeHunterGame({
    this.levelName = 'Level1.tmx',
    this.onLevelCompleted,
    this.onQuizEncounter,
    this.onGameOver,
  });

  late final World gameWorld;
  late final CameraComponent cameraComponent;
  late final PlayerComponent player;
  late TiledComponent mapComponent;

  int score = 0;
  int lives = 3;
  late final TextComponent hudText;

  @override
  Color backgroundColor() => const Color(0xFF68BBE3);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    gameWorld = World();

    // Resolusi kamera dekat dan pas menyorot arena permainan
    cameraComponent = CameraComponent.withFixedResolution(
      width: 400,
      height: 225,
      world: gameWorld,
    );
    addAll([cameraComponent, gameWorld]);

    gameWorld.add(CloudsBackground());

    mapComponent = await TiledComponent.load(
      levelName,
      Vector2.all(16),
      prefix: 'tiled/maps/',
      images: Images(bundle: NormalizedAssetBundle()),
    );
    gameWorld.add(mapComponent);

    _setupObjectLayers();
    _setupHUD();

    cameraComponent.follow(player);
  }

  void addScore(int amount) {
    score += amount;
    _updateHUD();
  }

  void loseLife() {
    lives--;
    _updateHUD();
    if (lives <= 0) {
      pauseEngine();
      if (onGameOver != null) onGameOver!();
    }
  }

  void triggerQuiz(EnemyComponent enemy) {
    pauseEngine();
    if (onQuizEncounter != null) {
      onQuizEncounter!(enemy);
    }
  }

  void _setupHUD() {
    hudText = TextComponent(
      text: 'NYAWA: ❤️️❤️❤️  |  SKOR: 0',
      position: Vector2(14, 10),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: Colors.black87, offset: Offset(1, 1), blurRadius: 3),
          ],
        ),
      ),
    );
    cameraComponent.viewport.add(hudText);
  }

  void _updateHUD() {
    final hearts = '❤️' * lives;
    hudText.text = 'NYAWA: $hearts  |  SKOR: $score';
  }

  void _setupObjectLayers() {
    final tileMap = mapComponent.tileMap;

    // 1. Memuat objek koin, duri, dan garis finish dari Tiled
    for (final layer in tileMap.map.layers) {
      if (layer is ObjectGroup) {
        for (final obj in layer.objects) {
          final name = obj.name.toLowerCase();
          final type = obj.type.toLowerCase();

          // Duri jeruji putih dari Tiled
          if (name.contains('trap') ||
              name.contains('damage') ||
              name.contains('duri') ||
              name.contains('spike')) {
            gameWorld.add(
              TrapBlock(
                position: Vector2(obj.x, obj.y),
                size: Vector2(
                  obj.width > 0 ? obj.width : 16,
                  obj.height > 0 ? obj.height : 16,
                ),
              ),
            );
          }
          // Koin dari Tiled
          else if (name.contains('poin') ||
              name.contains('coin') ||
              name.contains('point')) {
            gameWorld.add(
              CoinItem(
                position: Vector2(
                  obj.x + (obj.width / 2),
                  obj.y + (obj.height / 2),
                ),
              ),
            );
          }
          // Garis finish
          else if (name.contains('finish') || name.contains('goal')) {
            gameWorld.add(
              GoalBlock(
                position: Vector2(obj.x, obj.y),
                size: Vector2(
                  obj.width > 0 ? obj.width : 20,
                  obj.height > 0 ? obj.height : 20,
                ),
                onReached: () {
                  if (onLevelCompleted != null) onLevelCompleted!();
                },
              ),
            );
          }
        }
      }
    }

    // 2. Membangun lantai solid tepat di permukaan visual tanah (menyesuaikan map)
    // Permukaan tanah paling bawah (Y: 272)
    gameWorld.add(
      GroundBlock(position: Vector2(0, 272), size: Vector2(230, 48)),
    ); // Tanah kiri
    gameWorld.add(
      GroundBlock(position: Vector2(260, 272), size: Vector2(70, 48)),
    ); // Tanah tengah
    gameWorld.add(
      GroundBlock(position: Vector2(360, 272), size: Vector2(500, 48)),
    ); // Tanah kanan full

    // Platform gantung melayang yang bisa dilompati
    gameWorld.add(
      GroundBlock(position: Vector2(232, 208), size: Vector2(54, 16)),
    ); // Platform pohon
    gameWorld.add(
      GroundBlock(position: Vector2(184, 144), size: Vector2(54, 16)),
    ); // Platform tengah
    gameWorld.add(
      GroundBlock(position: Vector2(248, 80), size: Vector2(54, 16)),
    ); // Platform atas
    gameWorld.add(
      GroundBlock(position: Vector2(392, 96), size: Vector2(40, 16)),
    ); // Platform kanan atas

    // Jeruji putih (duri pembunuh) di dalam celah tanah
    gameWorld.add(
      TrapBlock(position: Vector2(230, 280), size: Vector2(30, 30)),
    );
    gameWorld.add(
      TrapBlock(position: Vector2(330, 280), size: Vector2(30, 30)),
    );

    // 3. Taruh karakter MENAPAK DI TANAH PALING BAWAH (di sebelah kiri tanah)
    final spawnPos = Vector2(80, 272);
    player = PlayerComponent(initialPos: spawnPos);
    gameWorld.add(player);

    // 4. Pasang 5 Musuh tepat menapak di atas tanah & platform (sesuai panah)
    final enemySpawns = [
      Vector2(160, 272), // Musuh 1: Tanah bawah kiri
      Vector2(258, 208), // Musuh 2: Platform pohon (panah kedua)
      Vector2(210, 144), // Musuh 3: Platform tengah
      Vector2(300, 272), // Musuh 4: Tanah bawah tengah
      Vector2(410, 96), // Musuh 5: Platform kanan atas (panah ketiga)
    ];

    for (int i = 0; i < 5; i++) {
      gameWorld.add(EnemyComponent(position: enemySpawns[i], questionIndex: i));
    }
  }
}

class GroundBlock extends PositionComponent with CollisionCallbacks {
  GroundBlock({required super.position, required super.size}) {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}

class TrapBlock extends PositionComponent with CollisionCallbacks {
  TrapBlock({required super.position, required super.size}) {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}

class GoalBlock extends PositionComponent with CollisionCallbacks {
  final VoidCallback onReached;
  GoalBlock({
    required super.position,
    required super.size,
    required this.onReached,
  }) {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}
