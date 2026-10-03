import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game_screen.dart';
import 'setting_screen.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  // Daftar 8 Level Sesuai Modul Pembelajaran Code Hunter
  final List<Map<String, dynamic>> _levels = [
    {
      'level': 1,
      'title': 'Hutan Variabel',
      'file': 'level_1.tmx',
      'unlocked': true,
    },
    {
      'level': 2,
      'title': 'Rawa Percabangan',
      'file': 'level_2.tmx',
      'unlocked': false,
    },
    {
      'level': 3,
      'title': 'Lembah Perulangan',
      'file': 'level_3.tmx',
      'unlocked': false,
    },
    {
      'level': 4,
      'title': 'Gua Tipe Data',
      'file': 'level_4.tmx',
      'unlocked': false,
    },
    {
      'level': 5,
      'title': 'Kuil Logika Boolean',
      'file': 'level_5.tmx',
      'unlocked': false,
    },
    {
      'level': 6,
      'title': 'Danau Array & List',
      'file': 'level_6.tmx',
      'unlocked': false,
    },
    {
      'level': 7,
      'title': 'Puncak Fungsi & Method',
      'file': 'level_7.tmx',
      'unlocked': false,
    },
    {
      'level': 8,
      'title': 'Benteng Master Bug',
      'file': 'level_8.tmx',
      'unlocked': false,
    },
  ];

  void _playLevel(String mapFile) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => GameScreen(levelFile: mapFile)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: GameSettings.instance,
      builder: (context, _) {
        final bool isDimmed = GameSettings.instance.isDimmedTheme;

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Background Game Rimba
              Image.asset('assets/images/bg/bg_jungle.png', fit: BoxFit.cover),

              // Lapisan Ambience Tema Redup vs Terang
              Container(
                color: isDimmed
                    ? const Color(0xFF0A0D13).withOpacity(0.92)
                    : const Color(0xFF0F141C).withOpacity(0.85),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 14.0,
                  ),
                  child: Column(
                    children: [
                      // Header Bar
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B2332),
                                border: Border.all(
                                  color: const Color(0xFF38465C),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'KEMBALI',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Text(
                            'PILIH ARENA PETUALANGAN',
                            style: GoogleFonts.pressStart2p(
                              fontSize: 12,
                              color: const Color(0xFFFFB800),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Grid Kartu Level (2 Kolom x 4 Baris)
                      Expanded(
                        child: GridView.builder(
                          itemCount: _levels.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                childAspectRatio: 1.4,
                              ),
                          itemBuilder: (context, index) {
                            final item = _levels[index];
                            final bool isUnlocked = item['unlocked'] as bool;

                            return InkWell(
                              onTap: isUnlocked
                                  ? () => _playLevel(item['file'] as String)
                                  : null,
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isUnlocked
                                      ? const Color(0xFF161E2D)
                                      : const Color(0xFF11141B)
                                            .withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: isUnlocked
                                        ? const Color(0xFFFFB800)
                                        : const Color(0xFF263244),
                                    width: isUnlocked ? 2 : 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'LVL ${item['level']}',
                                          style: GoogleFonts.pressStart2p(
                                            fontSize: 11,
                                            color: isUnlocked
                                                ? const Color(0xFFFFB800)
                                                : Colors.white30,
                                          ),
                                        ),
                                        Icon(
                                          isUnlocked
                                              ? Icons.play_arrow_rounded
                                              : Icons.lock_outline_rounded,
                                          color: isUnlocked
                                              ? const Color(0xFF00E676)
                                              : Colors.white24,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item['title'] as String,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: isUnlocked
                                            ? Colors.white
                                            : Colors.white38,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      isUnlocked
                                          ? 'Siap Dijalankan'
                                          : 'Terkunci',
                                      style: TextStyle(
                                        fontSize: 9.5,
                                        color: isUnlocked
                                            ? const Color(0xFF00D2FF)
                                            : Colors.white24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
