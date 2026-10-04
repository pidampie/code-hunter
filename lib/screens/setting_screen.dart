import 'dart:ui';

import 'package:flutter/material.dart';

// KELAS PENGATURAN GLOBAL (Singleton untuk menyimpan preferensi suara & tema)
class GameSettings extends ChangeNotifier {
  static final GameSettings instance = GameSettings._internal();
  GameSettings._internal();

  double rawBgmVolume = 0.8;
  double rawSfxVolume = 1.0;
  bool isBgmMuted = false;
  bool isSfxMuted = false;
  bool typeWriterSound = true;
  bool isDimmedTheme = false;
  bool enableScanlines = false;
  String playerName = 'Petualang Koding';

  void updateBgm(double val) {
    rawBgmVolume = val;
    isBgmMuted = val == 0;
    notifyListeners();
  }

  void updateSfx(double val) {
    rawSfxVolume = val;
    isSfxMuted = val == 0;
    notifyListeners();
  }

  void toggleTypeWriter(bool val) {
    typeWriterSound = val;
    notifyListeners();
  }

  void toggleTheme(bool val) {
    isDimmedTheme = val;
    notifyListeners();
  }

  void toggleScanlines(bool val) {
    enableScanlines = val;
    notifyListeners();
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _selectedTab =
      0; // 0: Audio, 1: Tampilan, 2: Aksesibilitas, 3: Data Progres, 4: Tentang

  final List<Map<String, dynamic>> _tabs = [
    {'title': 'Audio', 'icon': Icons.volume_up_rounded},
    {'title': 'Tampilan', 'icon': Icons.palette_rounded},
    {'title': 'Aksesibilitas', 'icon': Icons.accessibility_new_rounded},
    {'title': 'Data Progres', 'icon': Icons.storage_rounded},
    {'title': 'Tentang Aplikasi', 'icon': Icons.info_rounded},
  ];

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
              // 1. Background Foto Hutan
              Image.asset(
                'assets/images/bg/bg_jungle.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: const Color(0xFF0F172A)),
              ),

              // 2. Efek Kaca Buram (Frosted Glass)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    color: const Color(0xFF0F172A).withOpacity(0.75),
                  ),
                ),
              ),

              // 3. Konten Utama
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 24.0,
                  ),
                  child: Column(
                    children: [
                      // TOP BAR (Tombol Kembali, Judul, & Status Mode)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white24,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'PENGATURAN SISTEM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),

                          // Tombol Mode Terang/Redup
                          InkWell(
                            onTap: () =>
                                settings.toggleTheme(!settings.isDimmedTheme),
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    settings.isDimmedTheme
                                        ? Icons.nightlight_round
                                        : Icons.wb_sunny_rounded,
                                    color: const Color(0xFFF59E0B),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    settings.isDimmedTheme
                                        ? 'MODE REDUP'
                                        : 'MODE TERANG',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // KONTEN UTAMA (Layout Split: Menu Kiri & Panel Kanan)
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TAB MENU KIRI
                            SizedBox(
                              width: 240,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _tabs.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final tab = _tabs[index];
                                  final bool isSelected = _selectedTab == index;

                                  return InkWell(
                                    onTap: () =>
                                        setState(() => _selectedTab = index),
                                    borderRadius: BorderRadius.circular(16),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? const Color(0xFF3B82F6)
                                            : Colors.white.withOpacity(0.08),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: isSelected
                                              ? Colors.transparent
                                              : Colors.white12,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            tab['icon'],
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.white70,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 14),
                                          Text(
                                            tab['title'],
                                            style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.white70,
                                              fontSize: 13,
                                              fontWeight: isSelected
                                                  ? FontWeight.w800
                                                  : FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(width: 24),

                            // PANEL KANAN (Isi Pengaturan)
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(28),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: _buildTabContent(settings),
                                ),
                              ),
                            ),
                          ],
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

  // WIDGET KONTEN BERDASARKAN TAB YANG DIPILIH
  Widget _buildTabContent(GameSettings settings) {
    switch (_selectedTab) {
      case 0: // AUDIO
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PENGATURAN AUDIO GLOBAL',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E293B),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Sesuaikan volume suara latar belakang dan efek dalam game.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),

            // Slider BGM
            _buildSliderSetting(
              title: 'Musik Latar (BGM)',
              subtitle: 'Mengatur alunan musik santai di menu, materi, dan arena petualangan.',
              value: settings.rawBgmVolume,
              onChanged: (val) => settings.updateBgm(val),
            ),
            const SizedBox(height: 24),

            // Slider SFX
            _buildSliderSetting(
              title: 'Efek Suara (SFX)',
              subtitle: 'Suara klik tombol, centang benar kuis, lonceng level, dan lompatan karakter.',
              value: settings.rawSfxVolume,
              onChanged: (val) => settings.updateSfx(val),
            ),
            const SizedBox(height: 24),

            // Toggle Typewriter
            _buildSwitchSetting(
              title: 'Suara Ketukan Teks (Typewriter)',
              subtitle: 'Memutar suara kelikan keyboard retro saat cerita materi dan dialog muncul.',
              value: settings.typeWriterSound,
              onChanged: (val) => settings.toggleTypeWriter(val),
            ),
          ],
        );

      case 1: // TAMPILAN
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PENGATURAN TAMPILAN LAYAR',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E293B),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Personalisasi visual dan efek grafis antarmuka.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),
            _buildSwitchSetting(
              title: 'Efek Garis Layar (Scanlines)',
              subtitle: 'Menampilkan efek garis tipis ala monitor retro klasik pada layar game.',
              value: settings.enableScanlines,
              onChanged: (val) => settings.toggleScanlines(val),
            ),
          ],
        );

      case 2: // AKSESIBILITAS
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PENGATURAN AKSESIBILITAS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E293B),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Fitur tambahan untuk kenyamanan belajar dan bermain.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Segera Hadir: Mode kontras tinggi, pembaca teks layar (TTS), dan pengaturan ukuran font.',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                height: 1.5,
              ),
            ),
          ],
        );

      case 3: // DATA PROGRES
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MANAJEMEN DATA PROGRES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E293B),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Kelola penyimpanan data level dan catatan materi belajar.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFEF4444),
                side: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Aksi reset data
              },
              icon: const Icon(Icons.delete_outline_rounded),
              label: const Text(
                'RESET SEMUA PROGRES LEVEL',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        );

      case 4: // TENTANG APLIKASI
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TENTANG CODE HUNTER',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E293B),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Media edukasi berbasis game interaktif untuk siswa RPL / PPLG.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Versi Aplikasi: 1.0.0 Edu-Release',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Engine: Flutter & Flame Game Engine',
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dikembangkan khusus untuk pembelajaran pemograman dasar JavaScript tingkat SMK.',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }

  // WIDGET HELPER: Slider Setting
  Widget _buildSliderSetting({
    required String title,
    required String subtitle,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E293B),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${(value * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF3B82F6),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: const Color(0xFF3B82F6),
            inactiveTrackColor: const Color(0xFFE2E8F0),
            thumbColor: const Color(0xFF3B82F6),
            overlayColor: const Color(0xFF3B82F6).withOpacity(0.2),
            trackHeight: 6,
          ),
          child: Slider(value: value, min: 0.0, max: 1.0, onChanged: onChanged),
        ),
      ],
    );
  }

  // WIDGET HELPER: Switch Setting
  Widget _buildSwitchSetting({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Switch.adaptive(
          value: value,
          activeColor: const Color(0xFF10B981),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
