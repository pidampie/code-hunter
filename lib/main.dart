import 'package:flutter/material.dart';

import 'screens/landing_page_screen.dart';
import 'utils/audio_manager.dart'; // Sesuaikan path dengan lokasi audio_manager.dart kamu

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AudioManager.instance.init();
  await AudioManager.instance.startBgm(); // Putar Intro Theme.mp3 sejak awal
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Hunter',
      debugShowCheckedModeBanner: false,
      // Builder ini otomatis membungkus SELURUH halaman di aplikasi
      builder: (context, child) {
        return Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) {
            // Memastikan BGM menyala (mengatasi blokir autoplay di Chrome/Web/Android)
            AudioManager.instance.startBgm();
            // Memutar UI Click.mp3 setiap kali user mengeklik sesuatu di sistem
            AudioManager.instance.playClick();
          },
          child: child!,
        );
      },
      home: const LandingPageScreen(),
    );
  }
}
