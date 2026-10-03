import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ===========================================================================
// GLOBAL GAME SETTINGS CONTROLLER (SINGLETON STATE)
// Mengatur audio, tema, dan data permainan agar tersinkronisasi di semua screen
// ===========================================================================
class GameSettings extends ChangeNotifier {
  static final GameSettings instance = GameSettings._internal();
  GameSettings._internal();

  // --- AUDIO SETTINGS ---
  double _bgmVolume = 0.8; // 0.0 - 1.0 (Musik Latar)
  double _sfxVolume = 1.0; // 0.0 - 1.0 (Efek Suara Tombol/Aksi)
  bool _isBgmMuted = false;
  bool _isSfxMuted = false;
  bool _enableTypewriterSound = true;

  // --- THEME SETTINGS ---
  // false = Terang Normal (Day Mode), true = Redup Hangat (Dimmed / Cozy Night)
  bool _isDimmedTheme = false;
  bool _enableScanlines = false; // Efek monitor arcade retro

  // --- CODE & LEARNING ACCESSIBILITY ---
  String _codeFontSize = 'Standar'; // 'Kecil', 'Standar', 'Besar'
  String _dialogSpeed = 'Normal'; // 'Lambat', 'Normal', 'Instan'

  // --- PLAYER & PROGRESS DATA ---
  String _playerName = 'Petualang Koding';
  int _unlockedLevel = 1;
  int _totalScore = 0;

  // Getters
  double get bgmVolume => _isBgmMuted ? 0.0 : _bgmVolume;
  double get rawBgmVolume => _bgmVolume;
  double get sfxVolume => _isSfxMuted ? 0.0 : _sfxVolume;
  double get rawSfxVolume => _sfxVolume;
  bool get isBgmMuted => _isBgmMuted;
  bool get isSfxMuted => _isSfxMuted;
  bool get enableTypewriterSound => _enableTypewriterSound;
  bool get isDimmedTheme => _isDimmedTheme;
  bool get enableScanlines => _enableScanlines;
  String get codeFontSize => _codeFontSize;
  String get dialogSpeed => _dialogSpeed;
  String get playerName => _playerName;
  int get unlockedLevel => _unlockedLevel;
  int get totalScore => _totalScore;

  // Ukuran font kode yang dikonversi ke nilai pixel
  double get codeFontSizeInPx {
    switch (_codeFontSize) {
      case 'Kecil':
        return 11.5;
      case 'Besar':
        return 15.0;
      case 'Standar':
      default:
        return 13.0;
    }
  }

  // Setters dengan notifikasi otomatis ke seluruh widget pendengar
  void setBgmVolume(double value) {
    _bgmVolume = value;
    if (_bgmVolume > 0) _isBgmMuted = false;
    notifyListeners();
  }

  void setSfxVolume(double value) {
    _sfxVolume = value;
    if (_sfxVolume > 0) _isSfxMuted = false;
    notifyListeners();
  }

  void toggleBgmMute() {
    _isBgmMuted = !_isBgmMuted;
    notifyListeners();
  }

  void toggleSfxMute() {
    _isSfxMuted = !_isSfxMuted;
    notifyListeners();
  }

  void toggleTypewriterSound() {
    _enableTypewriterSound = !_enableTypewriterSound;
    notifyListeners();
  }

  void setDimmedTheme(bool value) {
    _isDimmedTheme = value;
    notifyListeners();
  }

  void toggleScanlines() {
    _enableScanlines = !_enableScanlines;
    notifyListeners();
  }

  void setCodeFontSize(String size) {
    _codeFontSize = size;
    notifyListeners();
  }

  void setDialogSpeed(String speed) {
    _dialogSpeed = speed;
    notifyListeners();
  }

  void setPlayerName(String name) {
    if (name.trim().isNotEmpty) {
      _playerName = name.trim();
      notifyListeners();
    }
  }

  // Fungsi Reset Progres Materi & Kuis
  void resetGameProgress() {
    _unlockedLevel = 1;
    _totalScore = 0;
    notifyListeners();
  }
}

// ===========================================================================
// SCREEN UTAMA: HALAMAN PENGATURAN (RETRO PIXEL QUESTBOOK STYLE)
// ===========================================================================
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _selectedTab = 0;

  final List<Map<String, dynamic>> _tabs = [
    {'title': 'AUDIO', 'icon': Icons.volume_up_rounded, 'emoji': '🔊'},
    {'title': 'TAMPILAN', 'icon': Icons.palette_rounded, 'emoji': '🎨'},
    {'title': 'AKSESIBILITAS', 'icon': Icons.menu_book_rounded, 'emoji': '📖'},
    {'title': 'DATA PROGRES', 'icon': Icons.save_rounded, 'emoji': '💾'},
    {'title': 'TENTANG APLIKASI', 'icon': Icons.info_rounded, 'emoji': 'ℹ️'},
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: GameSettings.instance,
      builder: (context, _) {
        final settings = GameSettings.instance;
        final bool isDimmed = settings.isDimmedTheme;

        // Palet warna adaptif: Redup Cozy vs Terang Normal
        final Color baseOverlayColor = isDimmed
            ? const Color(0xFF090B10).withOpacity(0.92)
            : const Color(0xFF161824).withOpacity(0.85);

        final Color panelBgColor = isDimmed
            ? const Color(0xFF131620)
            : const Color(0xFF1E2130);

        final Color accentYellow = const Color(0xFFFFD166);

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Background Rimba
              Image.asset('assets/images/bg/bg_jungle.png', fit: BoxFit.cover),

              // 2. Lapisan Ambience Redup vs Terang
              Container(color: baseOverlayColor),

              // 3. Optional Retro Scanlines Effect
              if (settings.enableScanlines)
                IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: List.generate(
                          100,
                          (i) => i.isEven
                              ? Colors.black.withOpacity(0.12)
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),

              // 4. Konten Antarmuka Pengaturan
              SafeArea(
                child: Column(
                  children: [
                    // TOP BAR
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28.0,
                        vertical: 14.0,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: accentYellow,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.5,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(3, 3),
                                    blurRadius: 0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'KEMBALI',
                                    style: GoogleFonts.pressStart2p(
                                      fontSize: 9,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Row(
                            children: [
                              const Text('⚙️ ', style: TextStyle(fontSize: 18)),
                              Text(
                                'PENGATURAN SISTEM',
                                style: GoogleFonts.pressStart2p(
                                  fontSize: 13,
                                  letterSpacing: 1.5,
                                  color: accentYellow,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Lencana Mode Cahaya Terpilih
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isDimmed
                                  ? const Color(0xFF232838)
                                  : const Color(0xFF333850),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: accentYellow,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  isDimmed ? '🌙 ' : '☀️ ',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  isDimmed ? 'MODE REDUP' : 'MODE TERANG',
                                  style: GoogleFonts.pressStart2p(
                                    fontSize: 8,
                                    color: accentYellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // BODY DUA KOLOM: TAB NAVIGASI DI KIRI, PANEL OPSI DI KANAN
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // KOLOM KIRI: TABS
                            SizedBox(
                              width: 230,
                              child: ListView.separated(
                                itemCount: _tabs.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  final tab = _tabs[index];
                                  final isSelected = _selectedTab == index;

                                  return InkWell(
                                    onTap: () =>
                                        setState(() => _selectedTab = index),
                                    borderRadius: BorderRadius.circular(12),
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 150,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? accentYellow
                                            : (isDimmed
                                                  ? const Color(0xFF141724)
                                                  : const Color(0xFF222638)),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: isSelected
                                              ? Colors.black
                                              : Colors.white12,
                                          width: isSelected ? 2.5 : 1,
                                        ),
                                        boxShadow: isSelected
                                            ? const [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  offset: Offset(3, 3),
                                                  blurRadius: 0,
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            tab['emoji'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              tab['title'],
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w900,
                                                letterSpacing: 0.8,
                                                color: isSelected
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                          if (isSelected)
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 12,
                                              color: Colors.black,
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(width: 18),

                            // KOLOM KANAN: ISI PANEL PENGATURAN
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                  color: panelBgColor,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white24,
                                    width: 2,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(4, 4),
                                      blurRadius: 0,
                                    ),
                                  ],
                                ),
                                child: _buildSelectedTabContent(settings),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Router tampilan per tab
  Widget _buildSelectedTabContent(GameSettings settings) {
    switch (_selectedTab) {
      case 0:
        return _buildAudioTab(settings);
      case 1:
        return _buildThemeTab(settings);
      case 2:
        return _buildAccessibilityTab(settings);
      case 3:
        return _buildDataProgressTab(settings);
      case 4:
      default:
        return _buildAboutAppTab(settings);
    }
  }

  // ---------------------------------------------------------------------------
  // 1. TAB AUDIO & SUARA (Terhubung Global)
  // ---------------------------------------------------------------------------
  Widget _buildAudioTab(GameSettings settings) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPanelTitle(
            'PENGATURAN AUDIO GLOBAL',
            'Semua perubahan volume langsung berlaku di setiap halaman game.',
          ),
          const SizedBox(height: 18),

          // Slider Musik Latar (BGM)
          _buildVolumeCard(
            title: 'MUSIK LATAR (BGM)',
            subtitle: 'Mengatur alunan musik santai di menu, materi, dan arena petualangan.',
            icon: settings.isBgmMuted || settings.rawBgmVolume == 0
                ? Icons.volume_off_rounded
                : Icons.music_note_rounded,
            value: settings.rawBgmVolume,
            isMuted: settings.isBgmMuted,
            accentColor: const Color(0xFF48CAE4),
            onChanged: (val) => settings.setBgmVolume(val),
            onToggleMute: () => settings.toggleBgmMute(),
          ),

          const SizedBox(height: 14),

          // Slider Efek Suara (SFX)
          _buildVolumeCard(
            title: 'EFEK SUARA (SFX)',
            subtitle: 'Suara klik tombol, centang benar kuis, lonceng level, dan lompatan karakter.',
            icon: settings.isSfxMuted || settings.rawSfxVolume == 0
                ? Icons.volume_off_rounded
                : Icons.sports_esports_rounded,
            value: settings.rawSfxVolume,
            isMuted: settings.isSfxMuted,
            accentColor: const Color(0xFFFFB703),
            onChanged: (val) => settings.setSfxVolume(val),
            onToggleMute: () => settings.toggleSfxMute(),
          ),

          const SizedBox(height: 14),

          // Toggle Typewriter Effect
          _buildToggleRow(
            title: 'SUARA KETUKAN TEKS (TYPEWRITER)',
            subtitle: 'Memutar suara ketikan keyboard retro saat cerita materi dan dialog muncul.',
            value: settings.enableTypewriterSound,
            onChanged: (val) => settings.toggleTypewriterSound(),
            activeColor: const Color(0xFF06D6A0),
          ),
        ],
      ),
    );
  }

  Widget _buildVolumeCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required double value,
    required bool isMuted,
    required Color accentColor,
    required ValueChanged<double> onChanged,
    required VoidCallback onToggleMute,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: onToggleMute,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isMuted ? const Color(0xFFEF476F) : Colors.white12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    isMuted ? 'MUTE (MATI)' : '${(value * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isMuted ? Colors.white : accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
          const SizedBox(height: 8),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: accentColor,
              inactiveTrackColor: Colors.white12,
              thumbColor: Colors.white,
              overlayColor: accentColor.withOpacity(0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              trackHeight: 6,
            ),
            child: Slider(
              value: value,
              min: 0.0,
              max: 1.0,
              onChanged: isMuted ? null : onChanged,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 2. TAB TEMA & TAMPILAN (Redup Cozy vs Terang Normal)
  // ---------------------------------------------------------------------------
  Widget _buildThemeTab(GameSettings settings) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPanelTitle(
            'TEMA & SUASANA CAHAYA',
            'Atur pencahayaan game agar mata tetap rileks saat belajar koding.',
          ),
          const SizedBox(height: 18),

          // Pilihan Mode Siang vs Mode Redup Hangat
          Row(
            children: [
              // Kartu Mode Terang Normal
              Expanded(
                child: InkWell(
                  onTap: () => settings.setDimmedTheme(false),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: !settings.isDimmedTheme
                          ? const Color(0xFFFFFDF5)
                          : Colors.black26,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: !settings.isDimmedTheme
                            ? const Color(0xFFFFD166)
                            : Colors.white12,
                        width: !settings.isDimmedTheme ? 3 : 1.5,
                      ),
                      boxShadow: !settings.isDimmedTheme
                          ? const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(3, 3),
                                blurRadius: 0,
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      children: [
                        const Text('☀️', style: TextStyle(fontSize: 32)),
                        const SizedBox(height: 8),
                        Text(
                          'MODE TERANG',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: !settings.isDimmedTheme
                                ? Colors.black
                                : Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Pencahayaan normal, cerah, dan segar untuk siang hari.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 9.5,
                            color: !settings.isDimmedTheme
                                ? const Color(0xFF4A4E69)
                                : Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              // Kartu Mode Redup Hangat (Dimmed)
              Expanded(
                child: InkWell(
                  onTap: () => settings.setDimmedTheme(true),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: settings.isDimmedTheme
                          ? const Color(0xFF0D0F17)
                          : Colors.black26,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: settings.isDimmedTheme
                            ? const Color(0xFF48CAE4)
                            : Colors.white12,
                        width: settings.isDimmedTheme ? 3 : 1.5,
                      ),
                      boxShadow: settings.isDimmedTheme
                          ? const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(3, 3),
                                blurRadius: 0,
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      children: [
                        const Text('🌙', style: TextStyle(fontSize: 32)),
                        const SizedBox(height: 8),
                        Text(
                          'MODE REDUP (COZY)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: settings.isDimmedTheme
                                ? const Color(0xFF48CAE4)
                                : Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Cahaya meredup lembut, bukan hitam pekat. Nyaman di mata.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 9.5,
                            color: settings.isDimmedTheme
                                ? const Color(0xFF90E0EF)
                                : Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Efek Garis TV Tabung Retro (Scanlines)
          _buildToggleRow(
            title: 'EFEK MONITOR TABUNG (CRT SCANLINES)',
            subtitle:
                'Menampilkan garis raster halus khas layar game arcade jadul.',
            value: settings.enableScanlines,
            onChanged: (val) => settings.toggleScanlines(),
            activeColor: const Color(0xFF48CAE4),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 3. TAB AKSESIBILITAS BELAJAR (Ukuran Font Kode & Kecepatan Dialog)
  // ---------------------------------------------------------------------------
  Widget _buildAccessibilityTab(GameSettings settings) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPanelTitle(
            'AKSESIBILITAS BELAJAR',
            'Sesuaikan kenyamanan membaca kode sintaks dan kecepatan teks penjelasan.',
          ),
          const SizedBox(height: 18),

          // Pilihan Ukuran Font Kode
          const Text(
            'UKURAN FONT JENDELA KODE TERMINAL',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Mengatur besar kecilnya huruf teks sintaks pada materi pemrograman.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: ['Kecil', 'Standar', 'Besar'].map((size) {
              final isSelected = settings.codeFontSize == size;
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ChoiceChip(
                  label: Text(size),
                  selected: isSelected,
                  selectedColor: const Color(0xFFFFD166),
                  backgroundColor: Colors.white12,
                  labelStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.white,
                  ),
                  onSelected: (_) => settings.setCodeFontSize(size),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Kecepatan Teks Muncul
          const Text(
            'KECEPATAN MUNCULNYA TEKS DIALOG',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Atur kecepatan animasi teks saat membaca cerita analogi koding.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: ['Lambat', 'Normal', 'Instan'].map((speed) {
              final isSelected = settings.dialogSpeed == speed;
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ChoiceChip(
                  label: Text(speed),
                  selected: isSelected,
                  selectedColor: const Color(0xFF06D6A0),
                  backgroundColor: Colors.white12,
                  labelStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.white,
                  ),
                  onSelected: (_) => settings.setDialogSpeed(speed),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 4. TAB DATA & PROGRES (Reset Save Data & Ganti Nama)
  // ---------------------------------------------------------------------------
  Widget _buildDataProgressTab(GameSettings settings) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPanelTitle(
            'MANAJEMEN DATA PETUALANG',
            'Kelola identitas karakter dan penyimpanan progres kuis materi.',
          ),
          const SizedBox(height: 18),

          // Edit Nama Petualang
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                const Text('🏷️ ', style: TextStyle(fontSize: 22)),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'NAMA PANGGILAN PETUALANG',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        settings.playerName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFFD166),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD166),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => _showEditNameDialog(settings),
                  child: const Text(
                    'GANTI NAMA',
                    style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // KOTAK BAHAYA: RESET PROGRES MATERI / CLEAR SAVE DATA
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF33151E),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFEF476F), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFFEF476F),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'ZONA BAHAYA: RESET SELURUH PROGRES',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFEF476F),
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Mengunci kembali modul materi dari Level 2 sampai Level 8 dan mengulang petualangan dari Level 1 awal. Fitur ini sangat berguna jika Anda ingin mendemonstrasikan sistem dari awal ke guru/penguji.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFFFFD4E0),
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF476F),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.delete_forever_rounded, size: 16),
                  label: const Text(
                    'RESET PROGRES MATERI SEKARANG',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => _showResetConfirmDialog(settings),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 5. TAB TENTANG APLIKASI (About Code Hunter & Credits)
  // ---------------------------------------------------------------------------
  Widget _buildAboutAppTab(GameSettings settings) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPanelTitle(
            'TENTANG CODE HUNTER',
            'Informasi kurikulum, versi perangkat lunak, dan pengembang.',
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD166),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Center(
                  child: Text('⚔️', style: TextStyle(fontSize: 26)),
                ),
              ),
              const SizedBox(width: 14),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CODE HUNTER: ADVENTURE',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Versi 1.0.0 (Edu-Release Build)',
                    style: TextStyle(
                      fontSize: 10.5,
                      color: Color(0xFFFFD166),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white12),
            ),
            child: const Text(
              'Code Hunter adalah media pembelajaran game interaktif berbasis Flutter yang dirancang untuk membantu siswa SMK Jurusan Rekayasa Perangkat Lunak (RPL / PPLG) memahami fondasi algoritma, variabel, dan percabangan kode melalui analogi kehidupan nyata serta petualangan visual yang menyenangkan.',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 14),

          _buildInfoRow(
            'Sasaran Kurikulum',
            'Dasar-Dasar Keahlian PPLG / RPL (Fase E)',
          ),
          _buildInfoRow(
            'Engine Permainan',
            'Flutter Framework & Flame 2D Game Engine',
          ),
          _buildInfoRow(
            'Desain Karakter',
            'Minecraft 3D Voxel & Cozy Pixel RPG',
          ),
          _buildInfoRow(
            'Lisensi Font & Aset',
            'Press Start 2P (SIL OFL) & Kenney CC0',
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER KECIL ---
  Widget _buildPanelTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.pressStart2p(
            fontSize: 11,
            color: const Color(0xFFFFD166),
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 10.5,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color activeColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 9.5,
                    color: Colors.white.withOpacity(0.55),
                  ),
                ),
              ],
            ),
          ),
          Switch(value: value, activeColor: activeColor, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white54,
              ),
            ),
          ),
          const Text(
            ': ',
            style: TextStyle(color: Colors.white54, fontSize: 10),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 10.5,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog Ganti Nama Petualang
  void _showEditNameDialog(GameSettings settings) {
    final controller = TextEditingController(text: settings.playerName);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1E2130),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: Color(0xFFFFD166), width: 2),
        ),
        title: Text(
          'GANTI NAMA PETUALANG',
          style: GoogleFonts.pressStart2p(
            fontSize: 11,
            color: const Color(0xFFFFD166),
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Ketik nama barumu...',
            hintStyle: TextStyle(color: Colors.white30),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFD166)),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('BATAL', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD166),
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              settings.setPlayerName(controller.text);
              Navigator.pop(context);
            },
            child: const Text(
              'SIMPAN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog Konfirmasi Reset Progres
  void _showResetConfirmDialog(GameSettings settings) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF261017),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: Color(0xFFEF476F), width: 2.5),
        ),
        title: Text(
          'KONFIRMASI RESET',
          style: GoogleFonts.pressStart2p(
            fontSize: 11,
            color: const Color(0xFFEF476F),
          ),
        ),
        content: const Text(
          'Apakah kamu yakin ingin menghapus seluruh progres materi dan kuis? Level materi yang telah dibuka akan kembali terkunci.',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('BATAL', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF476F),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              settings.resetGameProgress();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color(0xFFEF476F),
                  content: Text(
                    'Progres materi berhasil di-reset kembali ke Level 1!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            child: const Text(
              'YA, RESET DATA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
