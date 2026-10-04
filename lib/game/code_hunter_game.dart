import 'dart:math';

import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart' as exp;
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
  int lives = 6;
  late final TextComponent scoreText;
  late final TextComponent livesText;

  double mapWidth = 0.0;
  double mapHeight = 0.0;
  double lowestGroundY = 0.0;

  @override
  Color backgroundColor() => const Color(0xFF90CDF4);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    gameWorld = World();

    mapComponent = await TiledComponent.load(
      levelName,
      Vector2.all(16),
      prefix: 'tiled/maps/',
      images: Images(bundle: NormalizedAssetBundle()),
    );
    mapWidth = mapComponent.tileMap.map.width * 16.0;

    final double viewWidth = 320;
    final double viewHeight = 180;
    final halfW = viewWidth / 2;
    final halfH = viewHeight / 2;

    cameraComponent = CameraComponent.withFixedResolution(
      width: viewWidth,
      height: viewHeight,
      world: gameWorld,
    );

    cameraComponent.backdrop.add(CloudsBackground());

    _parseTiledLayers();
    gameWorld.add(mapComponent);

    final cameraBounds = exp.Rectangle.fromLTRB(
      halfW,
      halfH - 24,
      max(halfW, mapWidth - halfW),
      max(halfH, lowestGroundY + 16 - halfH),
    );
    cameraComponent.setBounds(cameraBounds);

    addAll([cameraComponent, gameWorld]);

    _setupHeaderHUD();
    cameraComponent.follow(player);
  }

  void addScore(int amount) {
    score += amount;
    _updateHUD();
  }

  void addLife(int amount) {
    if (lives < 6) lives += amount;
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
    if (onQuizEncounter != null) onQuizEncounter!(enemy);
  }

  void _setupHeaderHUD() {
    final viewportWidth = cameraComponent.viewport.virtualSize.x;

    final headerBar = RectangleComponent(
      position: Vector2(0, 0),
      size: Vector2(viewportWidth, 24),
      paint: Paint()..color = Colors.white,
    );
    cameraComponent.viewport.add(headerBar);

    final borderLine = RectangleComponent(
      position: Vector2(0, 24),
      size: Vector2(viewportWidth, 1.5),
      paint: Paint()..color = Colors.black26,
    );
    cameraComponent.viewport.add(borderLine);

    livesText = TextComponent(
      text: '❤️ x$lives',
      position: Vector2(10, 5),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 11,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
    cameraComponent.viewport.add(livesText);

    scoreText = TextComponent(
      text: '💎 SKOR: $score',
      position: Vector2(viewportWidth - 75, 5),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 11,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
    cameraComponent.viewport.add(scoreText);
  }

  void _updateHUD() {
    livesText.text = '❤️ x$lives';
    scoreText.text = '💎 SKOR: $score';
  }

  void _parseTiledLayers() {
    final tileMap = mapComponent.tileMap;
    int questionCounter = 0;
    Vector2 spawnPos = Vector2(32, 100);

    for (final layer in tileMap.map.layers) {
      if (layer is TileLayer) {
        final layerName = layer.name.toLowerCase();
        if (layerName.contains('decor') || layerName.contains('dekor'))
          continue;

        for (int y = 0; y < layer.height; y++) {
          for (int x = 0; x < layer.width; x++) {
            if (layer.tileData != null && layer.tileData![y][x].tile != 0) {
              final pos = Vector2(x * 16.0, y * 16.0);
              if (pos.y > lowestGroundY) lowestGroundY = pos.y;

              if (layerName.contains('trap') ||
                  layerName.contains('damage') ||
                  layerName.contains('duri')) {
                gameWorld.add(TrapBlock(position: pos, size: Vector2(16, 16)));
              } else if (layerName.contains('ground') ||
                  layerName.contains('platfrom')) {
                gameWorld.add(
                  GroundBlock(position: pos, size: Vector2(16, 16)),
                );
              }
            }
          }
        }
      }
    }

    final objLayer = tileMap.getLayer<ObjectGroup>('Object');
    if (objLayer != null) {
      for (final obj in objLayer.objects) {
        final pos = Vector2(obj.x, obj.y);
        final name = obj.name.toLowerCase();

        if (name == 'playerspawn' || name == 'start') {
          spawnPos = Vector2(pos.x + 8, pos.y);
        } else if (name.startsWith('enemyspa')) {
          gameWorld.add(
            EnemyComponent(
              position: Vector2(pos.x + 8, pos.y - 6),
              questionIndex: questionCounter,
            ),
          );
          questionCounter++;
        } else if (name.contains('coin') || name.contains('koin')) {
          gameWorld.add(CoinItem(position: Vector2(pos.x + 8, pos.y - 8)));
        } else if (name.contains('gem') || name.contains('berlian')) {
          gameWorld.add(GemItem(position: Vector2(pos.x + 8, pos.y - 8)));
        } else if (name.contains('heart') || name.contains('hati')) {
          gameWorld.add(HeartItem(position: Vector2(pos.x + 8, pos.y - 8)));
        }
      }
    }

    player = PlayerComponent(initialPos: spawnPos);
    gameWorld.add(player);
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
