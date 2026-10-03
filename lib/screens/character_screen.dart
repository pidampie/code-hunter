import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------------------
// MODEL DATA KARAKTER & SKILL
// ---------------------------------------------------------------------------
class CharacterSkill {
  final String name;
  final String type; // 'PASIF', 'SKILL 1', 'SKILL 2', 'ULTIMATE'
  final IconData icon;
  final String description;

  const CharacterSkill({
    required this.name,
    required this.type,
    required this.icon,
    required this.description,
  });
}

class CharacterModel {
  final int id;
  final String name;
  final String title;
  final String role;
  final String quote;
  final Color themeColor;
  final IconData avatarIcon;
  final double durability;
  final double offense;
  final double skillEffect;
  final double difficulty;
  final String lore;
  final bool isUnlocked;
  final List<CharacterSkill> skills;

  const CharacterModel({
    required this.id,
    required this.name,
    required this.title,
    required this.role,
    required this.quote,
    required this.themeColor,
    required this.avatarIcon,
    required this.durability,
    required this.offense,
    required this.skillEffect,
    required this.difficulty,
    required this.lore,
    required this.isUnlocked,
    required this.skills,
  });

  String get imagePath => 'assets/images/player/char_$id.png';
}

// ---------------------------------------------------------------------------
// 10 DATABASE KARAKTER BERDASARKAN ARCHETYPE PEMROGRAMAN
// ---------------------------------------------------------------------------
final List<CharacterModel> characterRoster = [
  const CharacterModel(
    id: 1,
    name: 'STEVIE',
    title: 'The Syntax Pioneer',
    role: 'Fighter',
    quote: '"Satu baris kode bersih bernilai seribu perbaikan bug."',
    themeColor: Color(0xFF4CAF50),
    avatarIcon: Icons.handyman_rounded,
    durability: 0.75,
    offense: 0.70,
    skillEffect: 0.50,
    difficulty: 0.30,
    lore: 'Petualang pemula yang menguasai seni fundamental instruksi sekuensial. Selalu membawa palu kompilasi untuk merapikan blok kode yang berantakan.',
    isUnlocked: true,
    skills: [
      CharacterSkill(
        name: 'Clean Code',
        type: 'PASIF',
        icon: Icons.auto_fix_high_rounded,
        description: 'Setiap kali menjawab kuis tanpa kesalahan, regenerasi nyawa meningkat 15%.',
      ),
      CharacterSkill(
        name: 'Syntax Strike',
        type: 'SKILL 1',
        icon: Icons.gavel_rounded,
        description: 'Menghantam bug terdekat dengan tanda titik-koma raksasa, memberikan damage fisik.',
      ),
      CharacterSkill(
        name: 'Variable Shield',
        type: 'SKILL 2',
        icon: Icons.shield_rounded,
        description: 'Menciptakan perisai data sementara yang menyerap 2 serangan musuh.',
      ),
      CharacterSkill(
        name: 'Compile Overload',
        type: 'ULTIMATE',
        icon: Icons.bolt_rounded,
        description: 'Mengeksekusi gelombang energi kompilasi penuh ke seluruh area peta.',
      ),
    ],
  ),
  const CharacterModel(
    id: 2,
    name: 'ADA',
    title: 'Lady of Logic',
    role: 'Mage',
    quote: '"Logika matematika adalah puisi alam semesta."',
    themeColor: Color(0xFF9C27B0),
    avatarIcon: Icons.auto_awesome_rounded,
    durability: 0.35,
    offense: 0.40,
    skillEffect: 0.95,
    difficulty: 0.70,
    lore: 'Penyihir legendaris perintis bahasa mesin. Mampu memanipulasi percabangan realitas dan melipat loop waktu untuk memusnahkan kesalahan program.',
    isUnlocked: true,
    skills: [
      CharacterSkill(
        name: 'Binary Aura',
        type: 'PASIF',
        icon: Icons.lightbulb_outline_rounded,
        description: 'Meningkatkan perolehan skor kuis koding sebesar 20%.',
      ),
      CharacterSkill(
        name: 'Branching Fork',
        type: 'SKILL 1',
        icon: Icons.alt_route_rounded,
        description: 'Melemparkan proyektil IF-ELSE ganda yang mencari 2 musuh sekaligus.',
      ),
      CharacterSkill(
        name: 'Infinite Orbit',
        type: 'SKILL 2',
        icon: Icons.all_inclusive_rounded,
        description:
            'Menjebak musuh di dalam pusaran perulangan (Loop) selama 2 detik.',
      ),
      CharacterSkill(
        name: 'Quantum Algorithm',
        type: 'ULTIMATE',
        icon: Icons.flare_rounded,
        description: 'Memanggil badai kalkulasi data analitis yang melenyapkan bug seketika.',
      ),
    ],
  ),
  const CharacterModel(
    id: 3,
    name: 'CIPHER',
    title: 'Null Pointer Shadow',
    role: 'Assassin',
    quote: '"Kamu tak bisa memperbaiki apa yang tidak bisa kamu lihat."',
    themeColor: Color(0xFFE91E63),
    avatarIcon: Icons.flash_on_rounded,
    durability: 0.30,
    offense: 0.95,
    skillEffect: 0.60,
    difficulty: 0.85,
    lore: 'Pembunuh bayaran yang hidup di celah alamat memori mentah. Menyerang bug logika berbahaya dari titik buta sebelum garbage collector sempat bertindak.',
    isUnlocked: false,
    skills: [
      CharacterSkill(
        name: 'Memory Leak',
        type: 'PASIF',
        icon: Icons.opacity_rounded,
        description: 'Serangan biasa menyebabkan musuh kehilangan pertahanan secara bertahap.',
      ),
      CharacterSkill(
        name: 'Pointer Dash',
        type: 'SKILL 1',
        icon: Icons.double_arrow_rounded,
        description: 'Melesat seketika ke alamat memori musuh tanpa memicu jebakan rintangan.',
      ),
      CharacterSkill(
        name: 'Null Exception',
        type: 'SKILL 2',
        icon: Icons.not_interested_rounded,
        description: 'Membuat karakter tak terlihat selama 1.5 detik dan kebal serangan.',
      ),
      CharacterSkill(
        name: 'Segmentation Fault',
        type: 'ULTIMATE',
        icon: Icons.crisis_alert_rounded,
        description: 'Tebasan fatal mematikan yang merusak struktur data musuh dalam sekejap.',
      ),
    ],
  ),
  const CharacterModel(
    id: 4,
    name: 'MONGO',
    title: 'The Database Bastion',
    role: 'Tank',
    quote: '"Integritas data adalah benteng yang tak tergoyahkan."',
    themeColor: Color(0xFF009688),
    avatarIcon: Icons.dns_rounded,
    durability: 0.95,
    offense: 0.40,
    skillEffect: 0.45,
    difficulty: 0.40,
    lore: 'Raksasa yang terbuat dari lempengan server terdistribusi. Menjaga record tabel penting dari ancaman serangan injeksi dan corrupt storage.',
    isUnlocked: true,
    skills: [
      CharacterSkill(
        name: 'ACID Property',
        type: 'PASIF',
        icon: Icons.security_rounded,
        description: 'Kebal terhadap efek lambat (slow) dan memiliki resistensi knockback.',
      ),
      CharacterSkill(
        name: 'Index Barrier',
        type: 'SKILL 1',
        icon: Icons.view_sidebar_rounded,
        description: 'Memunculkan tembok partisi indeks tabel untuk menghadang laju monster.',
      ),
      CharacterSkill(
        name: 'Rollback Wave',
        type: 'SKILL 2',
        icon: Icons.history_rounded,
        description: 'Memulihkan 10% darah yang hilang dalam 3 detik terakhir.',
      ),
      CharacterSkill(
        name: 'Schema Earthquake',
        type: 'ULTIMATE',
        icon: Icons.vibration_rounded,
        description: 'Menghentakkan tanah server, memberikan stun area kepada semua bug.',
      ),
    ],
  ),
  const CharacterModel(
    id: 5,
    name: 'LINUS',
    title: 'Terminal Gunslinger',
    role: 'Marksman',
    quote: '"Jalankan perintah dengan izin root, atau jangan sama sekali."',
    themeColor: Color(0xFFFF9800),
    avatarIcon: Icons.terminal_sharp,
    durability: 0.40,
    offense: 0.90,
    skillEffect: 0.50,
    difficulty: 0.55,
    lore: 'Penembak jitu yang menguasai kernel sistem operasi. Senapan berbasis command-line miliknya menembakkan peluru string tajam dari jarak jauh.',
    isUnlocked: false,
    skills: [
      CharacterSkill(
        name: 'Sudo Privileges',
        type: 'PASIF',
        icon: Icons.admin_panel_settings_rounded,
        description:
            'Damage tembakan bertambah jika nyawa monster di bawah 30%.',
      ),
      CharacterSkill(
        name: 'Grep Tracer',
        type: 'SKILL 1',
        icon: Icons.search_rounded,
        description:
            'Menembakkan peluru pelacak yang mendeteksi bug tersembunyi.',
      ),
      CharacterSkill(
        name: 'Bash Burst',
        type: 'SKILL 2',
        icon: Icons.fast_forward_rounded,
        description: 'Meningkatkan kecepatan tembak peluru kode sebesar 40%.',
      ),
      CharacterSkill(
        name: 'Kernel Panic',
        type: 'ULTIMATE',
        icon: Icons.report_problem_rounded,
        description:
            'Hujan peluru beruntun berdaya ledak tinggi ke garis depan lawan.',
      ),
    ],
  ),
  const CharacterModel(
    id: 6,
    name: 'GRACE',
    title: 'The First Debugger',
    role: 'Marksman',
    quote: '"Tumpas serangga pengganggu hingga baris terakhir."',
    themeColor: Color(0xFF29B6F6),
    avatarIcon: Icons.pest_control_rounded,
    durability: 0.45,
    offense: 0.85,
    skillEffect: 0.65,
    difficulty: 0.45,
    lore: 'Pakar militer yang pertama kali mendokumentasikan serangga bug di relay komputer. Pemburu taktis yang mengandalkan presisi breakpoint.',
    isUnlocked: true,
    skills: [
      CharacterSkill(
        name: 'Trace Log',
        type: 'PASIF',
        icon: Icons.receipt_long_rounded,
        description: 'Melihat kelemahan elemen musuh sebelum kuis dimulai.',
      ),
      CharacterSkill(
        name: 'Breakpoint Trap',
        type: 'SKILL 1',
        icon: Icons.pause_circle_filled_rounded,
        description: 'Memasang perangkap henti yang mengunci gerakan musuh yang melintas.',
      ),
      CharacterSkill(
        name: 'Inspect Scope',
        type: 'SKILL 2',
        icon: Icons.center_focus_strong_rounded,
        description: 'Memperluas jarak pandang kamera pemain sebesar 25%.',
      ),
      CharacterSkill(
        name: 'Clean Hotfix',
        type: 'ULTIMATE',
        icon: Icons.healing_rounded,
        description:
            'Tembakan presisi tinggi yang melenyapkan bug seketika tanpa jeda.',
      ),
    ],
  ),
  const CharacterModel(
    id: 7,
    name: 'VECTOR',
    title: 'The Array Sentinel',
    role: 'Tank',
    quote: '"Indeks nol adalah awal dari setiap perisai kokoh."',
    themeColor: Color(0xFF3F51B5),
    avatarIcon: Icons.table_chart_rounded,
    durability: 0.90,
    offense: 0.50,
    skillEffect: 0.60,
    difficulty: 0.50,
    lore: 'Ksatria pelindung berzirah lempeng matriks berurutan. Mampu mengatur formasi bertahan dengan memposisikan struktur data array tak tertembus.',
    isUnlocked: false,
    skills: [
      CharacterSkill(
        name: 'Zero-Based Guard',
        type: 'PASIF',
        icon: Icons.numbers_rounded,
        description: 'Serangan pertama yang diterima selalu dikurangi 50%.',
      ),
      CharacterSkill(
        name: 'Stack Push',
        type: 'SKILL 1',
        icon: Icons.publish_rounded,
        description: 'Mendorong musuh ke belakang dan memberikan efek stun.',
      ),
      CharacterSkill(
        name: 'Queue Barrier',
        type: 'SKILL 2',
        icon: Icons.format_list_bulleted_rounded,
        description: 'Membuka dinding pelindung yang melindungi anggota tim di belakangnya.',
      ),
      CharacterSkill(
        name: 'Heap Sort Crush',
        type: 'ULTIMATE',
        icon: Icons.sort_rounded,
        description: 'Menyusun ulang rintangan di sekitar dan membanting semua bug ke tengah.',
      ),
    ],
  ),
  const CharacterModel(
    id: 8,
    name: 'TURING',
    title: 'The Enigma Machine',
    role: 'Mage',
    quote: '"Bahkan teka-teki paling rumit memiliki pola tersembunyi."',
    themeColor: Color(0xFFFFC107),
    avatarIcon: Icons.psychology_rounded,
    durability: 0.50,
    offense: 0.60,
    skillEffect: 0.90,
    difficulty: 0.90,
    lore: 'Cendekiawan pemecah sandi rahasia. Mesin komputasi abstrak miliknya mampu memprediksi pola serangan musuh dan membongkar enkripsi tersulit.',
    isUnlocked: false,
    skills: [
      CharacterSkill(
        name: 'Pattern Recognition',
        type: 'PASIF',
        icon: Icons.grid_view_rounded,
        description:
            'Mendapat opsi bantuan eliminasi 1 jawaban salah saat kuis.',
      ),
      CharacterSkill(
        name: 'Decryption Pulse',
        type: 'SKILL 1',
        icon: Icons.lock_open_rounded,
        description:
            'Memancarkan gelombang sonik yang melumpuhkan perisai musuh.',
      ),
      CharacterSkill(
        name: 'State Transition',
        type: 'SKILL 2',
        icon: Icons.sync_alt_rounded,
        description:
            'Berpindah tempat dengan bayangan ilusi algoritma miliknya.',
      ),
      CharacterSkill(
        name: 'Universal Machine',
        type: 'ULTIMATE',
        icon: Icons.hub_rounded,
        description:
            'Memprogram ulang unit musuh menjadi sekutu selama 5 detik.',
      ),
    ],
  ),
  const CharacterModel(
    id: 9,
    name: 'NEXUS',
    title: 'Cyber Netrunner',
    role: 'Support',
    quote: '"Koneksi stabil adalah kunci menuju kemenangan mutlak."',
    themeColor: Color(0xFF00BCD4),
    avatarIcon: Icons.wifi_tethering_rounded,
    durability: 0.60,
    offense: 0.40,
    skillEffect: 0.85,
    difficulty: 0.60,
    lore: 'Spesialis transmisi paket data cepat. Mampu menghubungkan jalur komunikasi, memulihkan stamina kawan, dan meretas sistem keamanan map.',
    isUnlocked: false,
    skills: [
      CharacterSkill(
        name: 'Low Latency',
        type: 'PASIF',
        icon: Icons.speed_rounded,
        description:
            'Kecepatan lari meningkat 20% saat berada di jalur map utama.',
      ),
      CharacterSkill(
        name: 'Data Packet Buff',
        type: 'SKILL 1',
        icon: Icons.healing_rounded,
        description:
            'Menembakkan paket energi pemulih nyawa ke hero yang dipilih.',
      ),
      CharacterSkill(
        name: 'Firewall Ward',
        type: 'SKILL 2',
        icon: Icons.local_fire_department_rounded,
        description:
            'Menanam lentera firewall yang membakar bug yang mencoba mendekat.',
      ),
      CharacterSkill(
        name: 'Cloud Synchronization',
        type: 'ULTIMATE',
        icon: Icons.cloud_sync_rounded,
        description:
            'Menyinkronkan seluruh bonus buff ke seluruh map selama 8 detik.',
      ),
    ],
  ),
  const CharacterModel(
    id: 10,
    name: 'RUBY',
    title: 'The OOP Sorceress',
    role: 'Fighter',
    quote: '"Semua hal di dunia ini adalah objek yang bisa diwariskan."',
    themeColor: Color(0xFFD32F2F),
    avatarIcon: Icons.diamond_rounded,
    durability: 0.70,
    offense: 0.80,
    skillEffect: 0.70,
    difficulty: 0.65,
    lore: 'Penyihir anggun penguasa paradigma Object-Oriented Programming (OOP). Mengendalikan prinsip inheritance dan polimorfisme untuk bertarung di garis depan.',
    isUnlocked: false,
    skills: [
      CharacterSkill(
        name: 'Inheritance Bond',
        type: 'PASIF',
        icon: Icons.account_tree_rounded,
        description:
            'Mewarisi 15% armor dari musuh terakhir yang berhasil dikalahkan.',
      ),
      CharacterSkill(
        name: 'Encapsulation Orb',
        type: 'SKILL 1',
        icon: Icons.blur_circular_rounded,
        description: 'Mengurung bug ke dalam gelembung private yang tidak bisa diserang balik.',
      ),
      CharacterSkill(
        name: 'Polymorphic Blade',
        type: 'SKILL 2',
        icon: Icons.change_circle_rounded,
        description: 'Mengubah gaya serangan pedang dari jarak dekat menjadi serangan tebasan sabit jarak jauh.',
      ),
      CharacterSkill(
        name: 'Class Instantiation',
        type: 'ULTIMATE',
        icon: Icons.copy_rounded,
        description: 'Menciptakan klon objek tiruan dirinya sendiri untuk mendampingi bertarung.',
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// SCREEN UTAMA: HERO SHOWCASE (MLBB STYLE)
// ---------------------------------------------------------------------------
class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int _selectedHeroIndex = 0;
  int _selectedSkillIndex = 0;
  int _equippedHeroId = 1; // Default hero terpilih: STEVIE
  String _activeRoleFilter = 'SEMUA';

  final List<String> _roleFilters = [
    'SEMUA',
    'Fighter',
    'Mage',
    'Tank',
    'Marksman',
    'Assassin',
    'Support',
  ];

  CharacterModel get _currentHero => characterRoster[_selectedHeroIndex];

  List<CharacterModel> get _filteredRoster {
    if (_activeRoleFilter == 'SEMUA') return characterRoster;
    return characterRoster
        .where(
          (hero) => hero.role.toLowerCase() == _activeRoleFilter.toLowerCase(),
        )
        .toList();
  }

  void _equipCharacter() {
    if (!_currentHero.isUnlocked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFB71C1C),
          content: Text(
            'Karakter ${_currentHero.name} masih terkunci! Selesaikan level koding untuk membukanya.',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _equippedHeroId = _currentHero.id;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF2E7D32),
        content: Text(
          'Karakter ${_currentHero.name} berhasil dipilih untuk petualangan!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hero = _currentHero;
    final isEquipped = _equippedHeroId == hero.id;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background Rimba Utama
          Image.asset('assets/images/bg/bg_jungle.png', fit: BoxFit.cover),

          // 2. Lapisan Sinematik Gelap Khas Arena MLBB
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.25,
                colors: [
                  const Color(0xFF0D141E).withOpacity(0.70),
                  const Color(0xFF06090E).withOpacity(0.95),
                ],
              ),
            ),
          ),

          // 3. Konten Showcase Antarmuka Game
          SafeArea(
            child: Column(
              children: [
                // Top Header: Tombol Kembali, Judul, & Filter Role
                _buildTopNavigationHeader(),

                // Area Tengah: Showcase 3 Kolom
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // KOLOM KIRI: Identitas Hero & Radar Bar Atribut
                        Expanded(
                          flex: 3,
                          child: _buildHeroAttributesPanel(hero),
                        ),

                        // KOLOM TENGAH: Panggung Visual Hero Foto Asli
                        Expanded(
                          flex: 4,
                          child: _buildHeroStageCenter(hero, isEquipped),
                        ),

                        // KOLOM KANAN: Skillset & Lore Hero
                        Expanded(flex: 3, child: _buildHeroSkillsPanel(hero)),
                      ],
                    ),
                  ),
                ),

                // Area Bawah: Bar Carousel Miniatur Foto 10 Hero
                _buildHeroSelectionCarousel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // KOMPONEN TOP BAR
  // ---------------------------------------------------------------------------
  Widget _buildTopNavigationHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2633),
                border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Color(0xFFFFB74D),
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'KEMBALI',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 9,
                      color: const Color(0xFFFFB74D),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'HERO ROSTER',
            style: GoogleFonts.pressStart2p(
              fontSize: 14,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _roleFilters.map((role) {
                final isSelected = _activeRoleFilter == role;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _activeRoleFilter = role;
                        final filtered = _filteredRoster;
                        if (filtered.isNotEmpty) {
                          _selectedHeroIndex = characterRoster.indexOf(
                            filtered.first,
                          );
                          _selectedSkillIndex = 0;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFFF9800)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        role.toUpperCase(),
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: isSelected ? Colors.black : Colors.white70,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // KOMPONEN KOLOM KIRI: ATRIBUT & STATISTIK HERO
  // ---------------------------------------------------------------------------
  Widget _buildHeroAttributesPanel(CharacterModel hero) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF10151E).withOpacity(0.85),
        border: Border.all(color: hero.themeColor.withOpacity(0.4), width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: hero.themeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: hero.themeColor),
                ),
                child: Text(
                  hero.role.toUpperCase(),
                  style: TextStyle(
                    color: hero.themeColor,
                    fontSize: 9.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (!hero.isUnlocked)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.lock, color: Colors.redAccent, size: 10),
                      SizedBox(width: 4),
                      Text(
                        'TERKUNCI',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            hero.name,
            style: GoogleFonts.pressStart2p(
              fontSize: 18,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            hero.title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: hero.themeColor,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(6),
              border: Border(
                left: BorderSide(color: hero.themeColor, width: 3),
              ),
            ),
            child: Text(
              hero.quote,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Color(0xFFCFD8DC),
                fontSize: 10.5,
                height: 1.35,
              ),
            ),
          ),
          const Divider(color: Colors.white12, height: 20),
          const Text(
            'ATRIBUT KEMAMPUAN',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          _buildStatBar('Durability', hero.durability, const Color(0xFF4CAF50)),
          _buildStatBar('Offense', hero.offense, const Color(0xFFEF5350)),
          _buildStatBar(
            'Skill Effects',
            hero.skillEffect,
            const Color(0xFF29B6F6),
          ),
          _buildStatBar('Difficulty', hero.difficulty, const Color(0xFFFFB74D)),
          const Spacer(),
          Text(
            hero.lore,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withOpacity(0.65),
              fontSize: 10,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar(String label, double value, Color barColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 9.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${(value * 100).toInt()}%',
                style: TextStyle(
                  color: barColor,
                  fontSize: 9.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 5,
              backgroundColor: Colors.white10,
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // KOMPONEN KOLOM TENGAH: PANGGUNG FOTO HERO ASLI
  // ---------------------------------------------------------------------------
  Widget _buildHeroStageCenter(CharacterModel hero, bool isEquipped) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Efek Cahaya Lingkaran Pedestal Bawah
              Positioned(
                bottom: 15,
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: hero.themeColor.withOpacity(0.55),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),

              // Lantai Pedestal 3D Isometrik
              Positioned(
                bottom: 20,
                child: Container(
                  width: 190,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2633),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: hero.themeColor, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0, 8),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),

              // Foto Karakter PNG Penuh
              Positioned(
                bottom: 30,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorFiltered(
                      // Efek siluet hitam jika karakter belum terbuka
                      colorFilter: hero.isUnlocked
                          ? const ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.multiply,
                            )
                          : const ColorFilter.mode(
                              Colors.black87,
                              BlendMode.srcATop,
                            ),
                      child: Image.asset(
                        hero.imagePath,
                        height: 180,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          // Tampilan fallback jika foto belum terbaca
                          return Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hero.themeColor.withOpacity(0.2),
                              border: Border.all(
                                color: hero.themeColor,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              hero.avatarIcon,
                              size: 64,
                              color: hero.isUnlocked
                                  ? hero.themeColor
                                  : Colors.white24,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (isEquipped)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E7D32),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF81C784),
                            width: 1.5,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check, color: Colors.white, size: 12),
                            SizedBox(width: 4),
                            Text(
                              'SEDANG DIGUNAKAN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Tombol Aksi Bawah
        SizedBox(
          width: 220,
          height: 42,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: hero.isUnlocked
                  ? (isEquipped
                        ? const Color(0xFF37474F)
                        : const Color(0xFFFF9800))
                  : const Color(0xFFB71C1C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: hero.isUnlocked
                      ? const Color(0xFFFFD54F)
                      : Colors.white24,
                  width: 1.5,
                ),
              ),
              elevation: 4,
            ),
            onPressed: isEquipped ? null : _equipCharacter,
            child: Text(
              hero.isUnlocked
                  ? (isEquipped ? 'TERPASANG' : 'GUNAKAN KARAKTER')
                  : 'TERKUNCI 🔒',
              style: GoogleFonts.pressStart2p(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: isEquipped ? Colors.white54 : Colors.black87,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // KOMPONEN KOLOM KANAN: SKILLSET & KEMAMPUAN AKTIF
  // ---------------------------------------------------------------------------
  Widget _buildHeroSkillsPanel(CharacterModel hero) {
    final activeSkill = hero.skills[_selectedSkillIndex];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF10151E).withOpacity(0.85),
        border: Border.all(color: hero.themeColor.withOpacity(0.4), width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KEMAMPUAN (SKILLS)',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(hero.skills.length, (i) {
              final skill = hero.skills[i];
              final isSkillSelected = _selectedSkillIndex == i;

              return InkWell(
                onTap: () => setState(() => _selectedSkillIndex = i),
                borderRadius: BorderRadius.circular(10),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSkillSelected
                        ? hero.themeColor.withOpacity(0.3)
                        : const Color(0xFF19202C),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSkillSelected
                          ? const Color(0xFFFFD54F)
                          : Colors.white24,
                      width: isSkillSelected ? 2 : 1,
                    ),
                    boxShadow: isSkillSelected
                        ? [
                            BoxShadow(
                              color: const Color(0xFFFFD54F).withOpacity(0.4),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        skill.icon,
                        color: isSkillSelected
                            ? const Color(0xFFFFD54F)
                            : Colors.white70,
                        size: 20,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        skill.type == 'PASIF' ? 'PASIF' : 'S$i',
                        style: TextStyle(
                          fontSize: 7.5,
                          fontWeight: FontWeight.bold,
                          color: isSkillSelected
                              ? const Color(0xFFFFD54F)
                              : Colors.white38,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const Divider(color: Colors.white12, height: 22),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: hero.themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              activeSkill.type,
              style: TextStyle(
                color: hero.themeColor,
                fontSize: 8.5,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            activeSkill.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                activeSkill.description,
                style: const TextStyle(
                  color: Color(0xFFCFD8DC),
                  fontSize: 11.5,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // KOMPONEN BAWAH: CAROUSEL 10 FOTO HERO SELECTION
  // ---------------------------------------------------------------------------
  Widget _buildHeroSelectionCarousel() {
    final list = _filteredRoster;

    return Container(
      height: 82,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF090D14).withOpacity(0.92),
        border: const Border(
          top: BorderSide(color: Color(0xFF1E2633), width: 2),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = list[index];
          final originalIndex = characterRoster.indexOf(item);
          final isSelected = _selectedHeroIndex == originalIndex;
          final isEquipped = _equippedHeroId == item.id;

          return InkWell(
            onTap: () {
              setState(() {
                _selectedHeroIndex = originalIndex;
                _selectedSkillIndex = 0;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 64,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF1C2432)
                    : const Color(0xFF10151E),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFFB74D)
                      : (isEquipped ? const Color(0xFF4CAF50) : Colors.white12),
                  width: isSelected ? 2.5 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFFFFB74D).withOpacity(0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: ColorFiltered(
                          colorFilter: item.isUnlocked
                              ? const ColorFilter.mode(
                                  Colors.transparent,
                                  BlendMode.multiply,
                                )
                              : const ColorFilter.mode(
                                  Colors.black87,
                                  BlendMode.srcATop,
                                ),
                          child: Image.asset(
                            item.imagePath,
                            width: 32,
                            height: 32,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => Icon(
                              item.avatarIcon,
                              color: item.isUnlocked
                                  ? item.themeColor
                                  : Colors.white24,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color(0xFFFFB74D)
                              : Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  if (!item.isUnlocked)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.lock,
                          color: Colors.redAccent,
                          size: 10,
                        ),
                      ),
                    ),
                  if (isEquipped)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E7D32),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
