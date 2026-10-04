import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'character_screen.dart';
import 'level_screen.dart';
import 'materi_screen.dart';
import 'setting_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  final List<Map<String, dynamic>> _menuList = [
    {
      'title': 'Mulai Petualangan',
      'subtitle': 'Jelajahi peta level & kalahkan coding bug',
      'tag': 'LEVEL MAP',
      'icon': Icons.play_arrow_rounded,
      'color': const Color(0xFF3B82F6),
    },
    {
      'title': 'Pilih Karakter',
      'subtitle': 'Pilih hero voxel & atur perlengkapan koding',
      'tag': 'HEROES',
      'icon': Icons.shield_rounded,
      'color': const Color(0xFF10B981),
    },
    {
      'title': 'Materi Pembelajaran',
      'subtitle': 'Pelajari modul logika algoritma & ikuti kuis',
      'tag': '8 MODUL',
      'icon': Icons.menu_book_rounded,
      'color': const Color(0xFFF59E0B),
    },
    {
      'title': 'Pengaturan Sistem',
      'subtitle': 'Sesuaikan volume suara, tema & teks',
      'tag': 'CONFIG',
      'icon': Icons.tune_rounded,
      'color': const Color(0xFF8B5CF6),
    },
    {
      'title': 'Keluar Dari Game',
      'subtitle': 'Tutup sesi petualangan Code Hunter',
      'tag': 'EXIT',
      'icon': Icons.power_settings_new_rounded,
      'color': const Color(0xFFEF4444),
    },
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.98, end: 1.02).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _onMenuSelected(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const LevelScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CharacterScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MateriScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingScreen()),
        );
        break;
      case 4:
        _showExitConfirmationDialog();
        break;
    }
  }

  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'KONFIRMASI KELUAR',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFFEF4444),
          ),
        ),
        content: const Text(
          'Apakah kamu yakin ingin mengakhiri sesi petualangan Code Hunter?',
          style: TextStyle(
            color: Color(0xFF64748B),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'BATAL',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
            child: const Text(
              'KELUAR',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: GameSettings.instance,
      builder: (context, _) {
        final settings = GameSettings.instance;

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Background Foto Hutan Asli
              Image.asset(
                'assets/images/bg/bg_jungle.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: const Color(0xFF0F172A)),
              ),

              // 2. Efek Kaca Buram yang Lebih Terang (Opacity diturunkan agar foto belakang kelihatan jelas)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                  child: Container(
                    color: const Color(0xFF0F172A).withOpacity(0.45),
                  ),
                ),
              ),

              // 3. Konten Menu Utama
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TOP BAR
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white30,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF59E0B),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.person_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      settings.playerName.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'APPRENTICE CODER',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF38BDF8),
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white30,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      settings.isBgmMuted
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      size: 16,
                                      color: settings.isBgmMuted
                                          ? const Color(0xFFEF4444)
                                          : const Color(0xFF10B981),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      settings.isBgmMuted
                                          ? 'BGM OFF'
                                          : 'BGM ${(settings.rawBgmVolume * 100).toInt()}%',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SettingScreen(),
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.white30,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.settings_rounded,
                                    size: 18,
                                    color: Color(0xFFF59E0B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // JUDUL UTAMA (Dinaikkan posisinya, ukuran diperbesar, dan ditarik ke tengah)
                    ScaleTransition(
                      scale: _pulseAnimation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'CODE HUNTER',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.pressStart2p(
                              fontSize: 42, // Diperbesar
                              letterSpacing: 4,
                              color: const Color(0xFFFFB800),
                              shadows: const [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(4, 4),
                                  blurRadius: 0,
                                ),
                                Shadow(
                                  color: Color(0xFFD68B00),
                                  offset: Offset(2, 2),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white24,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'MEDIA EDUKASI DASAR PEMROGRAMAN RPL / PPLG',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2,
                                color: Colors.white.withOpacity(0.95),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // KARTU MENU MENYAMPING DI TENGAH
                    SizedBox(
                      height: 310,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _menuList.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 24),
                        itemBuilder: (context, index) {
                          final item = _menuList[index];
                          final Color itemColor = item['color'];

                          return InkWell(
                            onTap: () => _onMenuSelected(index),
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              width: 260,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 110,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          itemColor,
                                          itemColor.withOpacity(0.7),
                                        ],
                                      ),
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(24),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: -10,
                                          top: -10,
                                          child: Icon(
                                            item['icon'],
                                            size: 100,
                                            color: Colors.white.withOpacity(
                                              0.15,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 16,
                                          left: 16,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(
                                                0.2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              item['tag'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Icon(
                                            item['icon'],
                                            size: 48,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['title'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF1E293B),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            item['subtitle'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF64748B),
                                              height: 1.4,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () =>
                                                  _onMenuSelected(index),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFFF1F5F9,
                                                ),
                                                foregroundColor: itemColor,
                                                elevation: 0,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: const Text(
                                                'BUKA MENU',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // FOOTER
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'VERSI 1.0.0 EDU-RELEASE  •  FLUTTER GAME ENGINE',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.7),
                          shadows: const [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
