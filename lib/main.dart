import 'package:flutter/material.dart';

import 'screens/landing_page_screen.dart';
import 'utils/audio_manager.dart';
import 'utils/global_state.dart'; // PASTI KAN INI DI-IMPORT

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Audio
  try {
    await AudioManager.instance.init();
  } catch (e) {
    debugPrint("Audio init error: $e");
  }

  // Inisialisasi State Global (Penyimpanan Permanen)
  try {
    await GlobalState.instance.init();
  } catch (e) {
    debugPrint("Global State init error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Hunter',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) {
            try {
              AudioManager.instance.startBgm();
              AudioManager.instance.playClick();
            } catch (_) {}
          },
          child: child!,
        );
      },
      home: const LandingPageScreen(),
    );
  }
}
