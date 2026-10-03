import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/services.dart';

import 'player_component.dart';

class CodeHunterGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  final String levelName; // Contoh: 'level_1.tmx'
  CodeHunterGame({this.levelName = 'level_1.tmx'});

  late final World gameWorld;
  late final CameraComponent cameraComponent;
  late final PlayerComponent player;
  late TiledComponent mapComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // 1. Inisialisasi World & Kamera Modern Flame 1.38+
    gameWorld = World();

    // Resolusi virtual retro 16:9 (640x360 px) agar ringan di Core i3
    cameraComponent = CameraComponent.withFixedResolution(
      width: 640,
      height: 360,
      world: gameWorld,
    );

    // Pasang kamera dan world ke tree Flame
    addAll([cameraComponent, gameWorld]);

    // 2. Load Map Tiled (flame_tiled 3.1.2)
    mapComponent = await TiledComponent.load(
      levelName,
      Vector2.all(16), // Ukuran grid tile (16x16 px)
    );
    gameWorld.add(mapComponent);

    // 3. Spawn Karakter & Rintangan dari Object Layer Tiled
    _setupObjectLayers();

    // 4. Kamera mengunci dan mengikuti karakter
    cameraComponent.follow(player);
  }

  void _setupObjectLayers() {
    // A. Titik Spawn Karakter
    final spawnLayer = mapComponent.tileMap.getLayer<ObjectGroup>('SpawnPoint');
    Vector2 spawnPos = Vector2(100, 100); // Default cadangan
    if (spawnLayer != null && spawnLayer.objects.isNotEmpty) {
      final spawnObj = spawnLayer.objects.first;
      spawnPos = Vector2(spawnObj.x, spawnObj.y);
    }

    player = PlayerComponent(position: spawnPos);
    gameWorld.add(player);

    // B. Hitbox Rintangan Tanah (Collisions)
    final collisionLayer = mapComponent.tileMap.getLayer<ObjectGroup>(
      'Collisions',
    );
    if (collisionLayer != null) {
      for (final obj in collisionLayer.objects) {
        gameWorld.add(
          GroundBlock(
            position: Vector2(obj.x, obj.y),
            size: Vector2(obj.width, obj.height),
          ),
        );
      }
    }

    // C. Hitbox Duri / Jebakan (Traps)
    final trapLayer = mapComponent.tileMap.getLayer<ObjectGroup>('Traps');
    if (trapLayer != null) {
      for (final obj in trapLayer.objects) {
        gameWorld.add(
          TrapBlock(
            position: Vector2(obj.x, obj.y),
            size: Vector2(obj.width, obj.height),
          ),
        );
      }
    }
  }
}

// Komponen Rintangan Fisik Tanah
class GroundBlock extends PositionComponent with CollisionCallbacks {
  GroundBlock({required super.position, required super.size}) {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}

// Komponen Jebakan Duri
class TrapBlock extends PositionComponent with CollisionCallbacks {
  TrapBlock({required super.position, required super.size}) {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}
