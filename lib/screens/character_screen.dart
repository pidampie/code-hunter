import 'dart:ui';

import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int _selectedHeroIndex = 0;
  int _selectedSkillIndex = 0; // 0: Pasif, 1: Skill 1, 2: Skill 2, 3: Ultimate
  String _selectedRole = 'SEMUA';

  // MENGHUBUNGKAN 8 GAMBAR KARAKTER ASLI DARI FOLDER ASET
  final List<Map<String, dynamic>> _heroes = [
    {
      'name': 'STEVIE',
      'title': 'The Syntax Pioneer',
      'role': 'FIGHTER',
      'quote': '"Satu baris kode bersih bernilai seribu perbaikan bug."',
      'desc': 'Petualang pemula yang menguasai seni fundamental instruksi sekuensial. Selalu membawa palu kompilasi untuk merapikan blok kode yang berantakan.',
      'durability': 0.75,
      'offense': 0.70,
      'skill_effects': 0.50,
      'difficulty': 0.30,
      'is_locked': false,
      'is_equipped': true,
      'color': const Color(0xFF10B981),
      'image': 'assets/images/player/char_1.png',
    },
    {
      'name': 'CIPHER',
      'title': 'The Code Breaker',
      'role': 'ASSASSIN',
      'quote': '"Tidak ada enkripsi yang tidak bisa ditembus."',
      'desc': 'Bergerak dalam bayangan syntax, menyerang bug tepat di titik lemahnya secara efisien.',
      'durability': 0.30,
      'offense': 0.95,
      'skill_effects': 0.60,
      'difficulty': 0.85,
      'is_locked': true,
      'is_equipped': false,
      'color': const Color(0xFFEF4444),
      'image': 'assets/images/player/char_2.png',
    },
    {
      'name': 'ADA',
      'title': 'The Logic Weaver',
      'role': 'MAGE',
      'quote': '"Logika adalah sihir yang membentuk realitas digital."',
      'desc': 'Penyihir algoritma yang mampu memanipulasi struktur data dan variabel dari jarak jauh.',
      'durability': 0.40,
      'offense': 0.85,
      'skill_effects': 0.90,
      'difficulty': 0.60,
      'is_locked': true,
      'is_equipped': false,
      'color': const Color(0xFF8B5CF6),
      'image': 'assets/images/player/char_3.png',
    },
    {
      'name': 'VECTOR',
      'title': 'The Array Sniper',
      'role': 'MARKSMAN',
      'quote': '"Akurasi indeks adalah kunci dari setiap eksekusi."',
      'desc': 'Penembak jitu yang memanfaatkan array untuk menargetkan banyak bug sekaligus.',
      'durability': 0.40,
      'offense': 0.85,
      'skill_effects': 0.60,
      'difficulty': 0.70,
      'is_locked': true,
      'is_equipped': false,
      'color': const Color(0xFF3B82F6),
      'image': 'assets/images/player/char_4.png',
    },
    {
      'name': 'RUBY',
      'title': 'The Crimson Blade',
      'role': 'FIGHTER',
      'quote': '"Eksekusi cepat, tanpa memory leak."',
      'desc': 'Petarung tangkas yang mengeksekusi perulangan (loop) dengan sangat cepat.',
      'durability': 0.80,
      'offense': 0.85,
      'skill_effects': 0.40,
      'difficulty': 0.50,
      'is_locked': true,
      'is_equipped': false,
      'color': const Color(0xFFE11D48),
      'image': 'assets/images/player/char_5.png',
    },
    {
      'name': 'GRACE',
      'title': 'The Debug Healer',
      'role': 'SUPPORT',
      'quote': '"Setiap error mematikan pasti ada solusinya."',
      'desc': 'Spesialis pemulihan yang mampu memperbaiki memory leak dan menyembuhkan tim.',
      'durability': 0.60,
      'offense': 0.30,
      'skill_effects': 0.95,
      'difficulty': 0.40,
      'is_locked': true,
      'is_equipped': false,
      'color': const Color(0xFF06B6D4),
      'image': 'assets/images/player/char_6.png',
    },
    {
      'name': 'LINUS',
      'title': 'The Kernel Sage',
      'role': 'SUPPORT',
      'quote': '"Pondasi yang kuat menghasilkan sistem yang kebal."',
      'desc': 'Penasihat bijak yang memperkuat pertahanan sistem operasi dari serangan fatal.',
      'durability': 0.80,
      'offense': 0.40,
      'skill_effects': 0.85,
      'difficulty': 0.75,
      'is_locked': true,
      'is_equipped': false,
      'color': const Color(0xFFD97706),
      'image': 'assets/images/player/char_7.png',
    },
    {
      'name': 'MONGO',
      'title': 'The Data Titan',
      'role': 'TANK',
      'quote': '"Data yang masif membutuhkan pertahanan mutlak."',
      'desc': 'Raksasa penyimpan database yang mampu menahan serangan infinite loop tanpa crash.',
      'durability': 0.95,
      'offense': 0.40,
      'skill_effects': 0.40,
      'difficulty': 0.20,
      'is_locked': true,
      'is_equipped': false,
      'color': const Color(0xFF475569),
      'image': 'assets/images/player/char_8.png',
    },
  ];

  final List<String> _roles = [
    'SEMUA',
    'FIGHTER',
    'MAGE',
    'TANK',
    'MARKSMAN',
    'ASSASSIN',
    'SUPPORT',
  ];

  @override
  Widget build(BuildContext context) {
    final hero = _heroes[_selectedHeroIndex];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg/bg_jungle.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: const Color(0xFF0F172A)),
          ),

          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
              child: Container(color: const Color(0xFF0F172A).withOpacity(0.6)),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // HEADER
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
                            border: Border.all(color: Colors.white24, width: 1),
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
                        'HERO ROSTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      const Spacer(),

                      // Kategori Role Filter
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white24, width: 1),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _roles.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 4),
                          itemBuilder: (context, index) {
                            final role = _roles[index];
                            final isSelected = _selectedRole == role;
                            return InkWell(
                              onTap: () => setState(() => _selectedRole = role),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFFF59E0B)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  role,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: isSelected
                                        ? FontWeight.w900
                                        : FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white70,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // MAIN LAYOUT
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // KIRI: STATS
                        Expanded(flex: 3, child: _buildStatsPanel(hero)),

                        // TENGAH: GAMBAR KARAKTER
                        Expanded(flex: 4, child: _buildCenterPanel(hero)),

                        // KANAN: SKILLS
                        Expanded(flex: 3, child: _buildSkillsPanel(hero)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ROSTER LIST BAWAH
                  SizedBox(
                    height: 85,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _heroes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        final h = _heroes[index];
                        final isSelected = _selectedHeroIndex == index;
                        // Filter by Role
                        if (_selectedRole != 'SEMUA' &&
                            h['role'] != _selectedRole)
                          return const SizedBox.shrink();
                        return _buildHeroAvatar(h, isSelected, index);
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
  }

  // --- PANEL KIRI (STATISTIK) ---
  Widget _buildStatsPanel(Map<String, dynamic> hero) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      // MEMPERBAIKI OVERFLOW DENGAN SCROLLVIEW
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: hero['color'].withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: hero['color'].withOpacity(0.3)),
              ),
              child: Text(
                hero['role'],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: hero['color'],
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              hero['name'],
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E293B),
                letterSpacing: 1.5,
              ),
            ),
            Text(
              hero['title'],
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                border: const Border(
                  left: BorderSide(color: Color(0xFFCBD5E1), width: 3),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                hero['quote'],
                style: const TextStyle(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF475569),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'ATRIBUT KEMAMPUAN',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Color(0xFF94A3B8),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),
            _buildProgressBar(
              'Durability',
              hero['durability'],
              const Color(0xFF10B981),
            ),
            _buildProgressBar(
              'Offense',
              hero['offense'],
              const Color(0xFFEF4444),
            ),
            _buildProgressBar(
              'Skill Effects',
              hero['skill_effects'],
              const Color(0xFF3B82F6),
            ),
            _buildProgressBar(
              'Difficulty',
              hero['difficulty'],
              const Color(0xFFF59E0B),
            ),
            const SizedBox(height: 16), // Pengganti Spacer yang bikin error
            Text(
              hero['desc'],
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF64748B),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(String label, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF475569),
                ),
              ),
              Text(
                '${(value * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: const Color(0xFFF1F5F9),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  // --- PANEL TENGAH (FOTO KARAKTER & TOMBOL) ---
  Widget _buildCenterPanel(Map<String, dynamic> hero) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MENAMPILKAN GAMBAR ASLI KARAKTER
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: hero['color'].withOpacity(0.3),
                        blurRadius: 50,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: ColorFiltered(
                    // Jika terkunci, beri efek siluet bayangan hitam legam
                    colorFilter: hero['is_locked']
                        ? const ColorFilter.mode(
                            Colors.black87,
                            BlendMode.srcATop,
                          )
                        : const ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.multiply,
                          ),
                    child: Image.asset(
                      hero['image'],
                      height: 220,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Tombol Equip
        SizedBox(
          width: 220,
          height: 48,
          child: ElevatedButton(
            onPressed: hero['is_locked'] ? null : () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: hero['is_equipped']
                  ? const Color(0xFF10B981)
                  : Colors.white,
              foregroundColor: hero['is_equipped']
                  ? Colors.white
                  : const Color(0xFF1E293B),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              hero['is_locked']
                  ? '🔒 HERO TERKUNCI'
                  : (hero['is_equipped']
                        ? '✓ SEDANG DIGUNAKAN'
                        : 'GUNAKAN HERO'),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- PANEL KANAN (SKILLS) ---
  Widget _buildSkillsPanel(Map<String, dynamic> hero) {
    final bool isLocked = hero['is_locked'];

    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KEMAMPUAN (SKILLS)',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Color(0xFF94A3B8),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSkillTab(
                0,
                Icons.auto_awesome_rounded,
                'PASIF',
                hero['color'],
              ),
              _buildSkillTab(1, Icons.gavel_rounded, 'S1', hero['color']),
              _buildSkillTab(2, Icons.shield_rounded, 'S2', hero['color']),
              _buildSkillTab(3, Icons.bolt_rounded, 'S3', hero['color']),
            ],
          ),

          const SizedBox(height: 32),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isLocked
                  ? const Color(0xFFF1F5F9)
                  : hero['color'].withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              _selectedSkillIndex == 0 ? 'PASIF' : 'AKTIF',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                color: isLocked ? const Color(0xFF94A3B8) : hero['color'],
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            isLocked
                ? 'Kemampuan Rahasia'
                : (_selectedSkillIndex == 0
                      ? 'Clean Code'
                      : 'Skill Name ${_selectedSkillIndex}'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            isLocked
                ? 'Selesaikan lebih banyak modul dan kuis untuk membuka identitas serta kemampuan hero ini secara lengkap.'
                : 'Setiap kali menjawab kuis tanpa kesalahan, regenerasi nyawa meningkat sebesar 15% pada level tersebut.',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillTab(
    int index,
    IconData icon,
    String label,
    Color activeColor,
  ) {
    final isSelected = _selectedSkillIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedSkillIndex = index),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? activeColor : const Color(0xFFE2E8F0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? activeColor : const Color(0xFF94A3B8),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: isSelected ? activeColor : const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- ROSTER LIST BAWAH ---
  Widget _buildHeroAvatar(
    Map<String, dynamic> hero,
    bool isSelected,
    int index,
  ) {
    return InkWell(
      onTap: () => setState(() {
        _selectedHeroIndex = index;
        _selectedSkillIndex = 0;
      }),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? hero['color'] : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(color: hero['color'].withOpacity(0.4), blurRadius: 8),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GAMBAR MINIATURE DI LIST BAWAH
                  ColorFiltered(
                    colorFilter: hero['is_locked']
                        ? const ColorFilter.mode(
                            Colors.black38,
                            BlendMode.srcATop,
                          )
                        : const ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.multiply,
                          ),
                    child: Image.asset(
                      hero['image'],
                      height: 40,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, size: 32),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hero['name'],
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: hero['is_locked']
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
            if (hero['is_locked'])
              Positioned(
                top: 6,
                right: 6,
                child: Icon(
                  Icons.lock_rounded,
                  color: const Color(0xFFEF4444).withOpacity(0.8),
                  size: 12,
                ),
              ),
            if (hero['is_equipped'])
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Color(0xFF10B981),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
