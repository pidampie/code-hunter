import 'dart:async';

import 'package:flutter/material.dart';

import 'main_menu_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    // Simulasi loading bar tipis berjalan halus (~2.5 detik)
    _timer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      setState(() {
        if (_progress < 1.0) {
          _progress += 0.01;
        } else {
          _progress = 1.0;
          _timer?.cancel();
          _navigateToMenu();
        }
      });
    });
  }

  void _navigateToMenu() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => MainMenuScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Fullscreen
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg/bg_jungle.png',
              fit: BoxFit.cover,
            ),
          ),

          // Loading Bar Tipis & Minimalis di Bawah Center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Container(
                width: 200,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.transparent,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF4CAF50), // Hijau aksen game yang kontras
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
