import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'character_screen.dart';
import 'materi_screen.dart';
import 'setting_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'PLAY', 'icon': Icons.play_arrow_rounded},
    {'title': 'DAILY CHALLENGE', 'icon': Icons.local_fire_department_rounded},
    {'title': 'MATERI', 'icon': Icons.menu_book_rounded},
    {'title': 'KARAKTER', 'icon': Icons.person_rounded},
    {'title': 'SETTINGS', 'icon': Icons.tune_rounded},
    {'title': 'QUIT', 'icon': Icons.power_settings_new_rounded},
  ];

  void _handleMenuAction(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        debugPrint('Membuka level select...');
        break;
      case 1:
        _showGameDialog(
          'DAILY CHALLENGE',
          'Selesaikan satu tantangan koding kilat setiap hari untuk mengumpulkan koin dan badge reputasi[cite: 1]!',
          Icons.local_fire_department_rounded,
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MateriScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CharacterScreen()),
        );
        break;
      case 4: // Sesuaikan dengan urutan tombol Pengaturan (misal index 4)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingScreen()),
        );
        break;
      case 5:
        SystemNavigator.pop();
        break;
    }
  }

  void _showGameDialog(String title, String content, IconData icon) {
    showDialog(
      context: context,
      builder: (ctx) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF15181C).withOpacity(0.95),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFFF9800).withOpacity(0.7),
                width: 2,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 24,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: const Color(0xFFFFB74D), size: 28),
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pressStart2p(
                    fontSize: 12,
                    color: const Color(0xFFFFB74D),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFE0E0E0),
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text(
                    'KEMBALI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Gambar Background Landscape Fullscreen
          Image.asset('assets/images/bg/bg_jungle.png', fit: BoxFit.cover),

          // 2. Lapisan Gradasi Gelap Sisi Kiri
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.0, 0.42, 0.75, 1.0],
                colors: [
                  Colors.black.withOpacity(0.92),
                  Colors.black.withOpacity(0.70),
                  Colors.black.withOpacity(0.20),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // 3. Tata Letak Menu
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 42.0,
                top: 20.0,
                bottom: 20.0,
                right: 36.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer atas untuk menurunkan blok judul ke posisi garis merah
                  const Spacer(flex: 3),

                  // Judul CODE HUNTER (Tepat di atas tombol menu)
                  Text(
                    'CODE HUNTER',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 26,
                      letterSpacing: 3,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            Color(0xFFFFF9C4),
                            Color(0xFFFFB74D),
                            Color(0xFFFF9800),
                          ],
                        ).createShader(const Rect.fromLTWH(0, 0, 320, 40)),
                      shadows: const [
                        Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 0,
                          color: Color(0xFF3E2723),
                        ),
                        Shadow(
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 18,
                  ), // Jarak rapat antara judul dan menu
                  // Daftar Menu dengan Garis Pembatas Vertikal
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 2.5,
                          margin: const EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.1),
                                const Color(0xFFFF9800).withOpacity(0.8),
                                Colors.white.withOpacity(0.1),
                              ],
                            ),
                          ),
                        ),

                        // List Tombol Navigasi
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(_menuItems.length, (index) {
                            final isSelected = _selectedIndex == index;
                            final item = _menuItems[index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3.0,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onHover: (hover) {
                                  if (hover)
                                    setState(() => _selectedIndex = index);
                                },
                                onTap: () => _handleMenuAction(index),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 160),
                                  width: 260,
                                  height: 38,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: isSelected
                                        ? const LinearGradient(
                                            colors: [
                                              Color(0xFFE65100),
                                              Color(0xFFF57C00),
                                              Color(0xFFFFB74D),
                                            ],
                                          )
                                        : null,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(4),
                                      bottomLeft: const Radius.circular(4),
                                      topRight: isSelected
                                          ? const Radius.circular(16)
                                          : Radius.zero,
                                      bottomRight: isSelected
                                          ? const Radius.circular(16)
                                          : Radius.zero,
                                    ),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: const Color(0xFFFF9800)
                                                  .withOpacity(0.4),
                                              blurRadius: 12,
                                              offset: const Offset(2, 2),
                                            ),
                                          ]
                                        : null,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        item['icon'] as IconData,
                                        size: 18,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.white54,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        item['title'] as String,
                                        style: TextStyle(
                                          fontSize: isSelected ? 15 : 14,
                                          fontWeight: isSelected
                                              ? FontWeight.w900
                                              : FontWeight.w600,
                                          letterSpacing: 2,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.72),
                                          shadows: isSelected
                                              ? const [
                                                  Shadow(
                                                    color: Colors.black54,
                                                    offset: Offset(1, 1),
                                                    blurRadius: 3,
                                                  ),
                                                ]
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  // Spacer bawah untuk mendorong footer keterangan ke bagian bawah layar
                  const Spacer(flex: 4),

                  // Footer Keterangan di Kiri Bawah
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 0.8,
                          ),
                        ),
                        child: const Text(
                          'ENTER',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'PILIH MENU',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
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
