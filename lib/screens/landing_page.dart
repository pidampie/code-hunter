import 'package:flutter/material.dart';

import 'main_menu_screen.dart'; // Sesuaikan jika path file MainMenuScreen berbeda

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Mengatur durasi loading selama 1.5 detik
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Mendengarkan perubahan nilai animasi untuk memperbarui tampilan
    _controller.addListener(() {
      setState(() {});
    });

    // Ketika animasi selesai (mencapai 100%), pindah ke Main Menu
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (_, __, ___) => const MainMenuScreen(),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startLoading() {
    if (_isLoading) return; // Mencegah klik berulang saat sedang memuat

    setState(() {
      _isLoading = true;
    });

    _controller.forward(); // Memulai jalannya animasi dari 0.0 ke 1.0
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. GAMBAR LATAR BELAKANG UTUH (Polosan, tanpa lapisan gelap)
          Image.asset('assets/images/bg/landing_bg.png', fit: BoxFit.cover),

          // 2. AREA KLIK (Seluruh layar bisa disentuh untuk mulai)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _startLoading,
              splashColor: Colors.white.withOpacity(0.1),
              highlightColor: Colors.transparent,
            ),
          ),

          // 3. GARIS LOADING MINIMALIS DI BAGIAN PALING BAWAH
          if (_isLoading)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: _controller
                    .value, // Nilai otomatis bergerak dari 0.0 ke 1.0
                backgroundColor: Colors.black45,
                color: const Color(
                  0xFFE65100,
                ), // Warna oranye tua ala Minecraft
                minHeight: 6, // Ketebalan garis bawah
              ),
            ),
        ],
      ),
    );
  }
}
