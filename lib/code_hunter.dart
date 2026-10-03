import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class CodeHunterGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    final map = await TiledComponent.load(
      'Level1.tmx',
      Vector2.all(16),
      prefix: 'tiled/maps/',
    );
    world.add(map);

    // Memusatkan kamera ke tengah map
    camera.viewfinder.position = map.size / 2;

    // Memperbesar tampilan map
    camera.viewfinder.zoom = 2.0;
  }
}
