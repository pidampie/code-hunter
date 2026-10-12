import 'dart:async';

import 'package:flutter/material.dart';

// Pastikan file main_menu_screen.dart sudah ada
import 'main_menu_screen.dart';

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  bool _isLoading = false;

  void _startLoading() {
    // Cegah klik berulang saat loading sudah berjalan
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Simulasi loading selama 1.5 detik
    Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        // Pindah ke Main Menu setelah loading
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => const MainMenuScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Antisipasi jika gambar lambat dimuat
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Gambar Desain Kamu
          Image.asset('assets/images/bg/landing_bg.png', fit: BoxFit.cover),

          // 2. Area Klik Fullscreen menggunakan Material InkWell
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _startLoading,
              splashColor: Colors.white.withOpacity(
                0.2,
              ), // Efek klik putih transparan
              highlightColor: Colors.transparent,
            ),
          ),

          // 3. Indikator Loading (Muncul hanya jika tombol diklik)
          if (_isLoading)
            Container(
              color: Colors.black54, // Latar gelap transparan saat loading
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.orange, // Warna senada dengan tombol
                    ),
                    SizedBox(height: 16),
                    Text(
                      'MEMUAT...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
