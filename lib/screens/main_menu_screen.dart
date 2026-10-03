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
  int _hoveredIndex = -1;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  // Daftar Menu Lengkap Code Hunter
  final List<Map<String, dynamic>> _menuList = [
    {
      'title': 'MULAI PETUALANGAN',
      'subtitle': 'Jelajahi peta level & kalahkan coding bug',
      'tag': 'LEVEL MAP',
      'icon': Icons.play_arrow_rounded,
      'color': Color(0xFF00E676),
    },
    {
      'title': 'ROSTER KARAKTER',
      'subtitle': 'Pilih 10 hero voxel & atur perlengkapan koding',
      'tag': 'HEROES',
      'icon': Icons.shield_rounded,
      'color': Color(0xFF00D2FF),
    },
    {
      'title': 'KODEKS MATERI',
      'subtitle': 'Pelajari 8 modul logika algoritma & ikuti kuis',
      'tag': '8 MODUL',
      'icon': Icons.menu_book_rounded,
      'color': Color(0xFFFFB800),
    },
    {
      'title': 'PENGATURAN SISTEM',
      'subtitle': 'Sesuaikan volume suara, tema pencahayaan & teks',
      'tag': 'CONFIG',
      'icon': Icons.tune_rounded,
      'color': Color(0xFFFF70A6),
    },
    {
      'title': 'KELUAR DARI GAME',
      'subtitle': 'Tutup sesi petualangan Code Hunter',
      'tag': 'EXIT',
      'icon': Icons.power_settings_new_rounded,
      'color': Color(0xFFFF5252),
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
        backgroundColor: const Color(0xFF141924),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Color(0xFFFF5252), width: 1.5),
        ),
        title: const Text(
          'KONFIRMASI KELUAR',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            color: Color(0xFFFF5252),
          ),
        ),
        content: const Text(
          'Apakah kamu yakin ingin mengakhiri sesi petualangan Code Hunter?',
          style: TextStyle(color: Colors.white70, fontSize: 11.5, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'BATAL',
              style: TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
            child: const Text(
              'KELUAR',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
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
        final bool isDimmed = settings.isDimmedTheme;

        final Color overlayColor = isDimmed
            ? const Color(0xFF090C12).withOpacity(0.93)
            : const Color(0xFF0E131C).withOpacity(0.86);

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Latar Belakang Rimba Utama
              Image.asset('assets/images/bg/bg_jungle.png', fit: BoxFit.cover),

              // 2. Lapisan Suasana Redup vs Terang Normal
              Container(color: overlayColor),

              // 3. Efek Scanlines Layar (Jika Diaktifkan di Pengaturan)
              if (settings.enableScanlines)
                IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: List.generate(
                          120,
                          (i) => i.isEven
                              ? Colors.black.withOpacity(0.12)
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),

              // 4. Konten Antarmuka Menu Utama
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 18.0,
                  ),
                  child: Column(
                    children: [
                      // HEADER BAR: Profil Pemain & Indikator Status Audio
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Kartu Identitas Petualang
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF161C28),
                              border: Border.all(
                                color: const Color(0xFF2E3B50),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFB800),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.person_rounded,
                                      color: Colors.black,
                                      size: 20,
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
                                        fontSize: 11,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'STATUS: APPRENTICE CODER',
                                      style: TextStyle(
                                        fontSize: 8.5,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00D2FF),
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Indikator Cepat Mode Audio & Tema
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF161C28),
                                  border: Border.all(
                                    color: const Color(0xFF2E3B50),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      settings.isBgmMuted
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      size: 14,
                                      color: settings.isBgmMuted
                                          ? const Color(0xFFFF5252)
                                          : const Color(0xFF00E676),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      settings.isBgmMuted
                                          ? 'BGM OFF'
                                          : 'BGM ${(settings.rawBgmVolume * 100).toInt()}%',
                                      style: const TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SettingScreen(),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1B2433),
                                    border: Border.all(
                                      color: const Color(0xFF384761),
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.settings_rounded,
                                    size: 16,
                                    color: Color(0xFFFFB800),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      // JUDUL HERO UTAMA & LOGO
                      ScaleTransition(
                        scale: _pulseAnimation,
                        child: Column(
                          children: [
                            Text(
                              'CODE HUNTER',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.pressStart2p(
                                fontSize: 36,
                                letterSpacing: 5,
                                color: const Color(0xFFFFB800),
                                shadows: const [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(5, 5),
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
                                horizontal: 16,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF151C28).withOpacity(0.9),
                                border: Border.all(
                                  color: const Color(0xFF324157),
                                  width: 1.2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'MEDIA EDUKASI DASAR PEMROGRAMAN RPL / PPLG',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                  color: Colors.white.withOpacity(0.85),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 38),

                      // DAFTAR MENU INTERAKTIF LENGKAP
                      SizedBox(
                        width: 460,
                        child: Column(
                          children: List.generate(_menuList.length, (index) {
                            final item = _menuList[index];
                            final isHovered = _hoveredIndex == index;
                            final Color itemColor = item['color'];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 11.0),
                              child: MouseRegion(
                                onEnter: (_) =>
                                    setState(() => _hoveredIndex = index),
                                onExit: (_) =>
                                    setState(() => _hoveredIndex = -1),
                                child: InkWell(
                                  onTap: () => _onMenuSelected(index),
                                  borderRadius: BorderRadius.circular(4),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 140),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isHovered
                                          ? itemColor
                                          : const Color(0xFF151C28)
                                                .withOpacity(0.92),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: isHovered
                                            ? Colors.white
                                            : const Color(0xFF2C394F),
                                        width: isHovered ? 2 : 1.2,
                                      ),
                                      boxShadow: isHovered
                                          ? [
                                              BoxShadow(
                                                color: itemColor.withOpacity(
                                                  0.35,
                                                ),
                                                blurRadius: 16,
                                                spreadRadius: 1,
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          item['icon'],
                                          color: isHovered
                                              ? Colors.black
                                              : itemColor,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 14),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['title'],
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                  letterSpacing: 1.2,
                                                  color: isHovered
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                item['subtitle'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 9.5,
                                                  color: isHovered
                                                      ? Colors.black87
                                                      : Colors.white
                                                            .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isHovered
                                                ? Colors.black.withOpacity(0.2)
                                                : const Color(0xFF202A3C),
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                          child: Text(
                                            item['tag'],
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.8,
                                              color: isHovered
                                                  ? Colors.black
                                                  : itemColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      const Spacer(),

                      // FOOTER HINT
                      Text(
                        'VERSI 1.0.0 EDU-RELEASE  •  FLUTTER GAME ENGINE',
                        style: TextStyle(
                          fontSize: 9,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.35),
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
