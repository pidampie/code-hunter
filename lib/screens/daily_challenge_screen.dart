import 'dart:ui';

import 'package:flutter/material.dart';

class DailyChallengeScreen extends StatefulWidget {
  const DailyChallengeScreen({super.key});

  @override
  State<DailyChallengeScreen> createState() => _DailyChallengeScreenState();
}

class _DailyChallengeScreenState extends State<DailyChallengeScreen> {
  int _userCoins = 250;

  final List<Map<String, dynamic>> _challenges = [
    {
      'title': 'Kutu Buku Harian',
      'desc':
          'Baca dan selesaikan 1 modul materi pembelajaran apapun hari ini.',
      'reward': 50,
      'current_progress': 1,
      'max_progress': 1,
      'status': 1, // Siap diklaim
      'color': const Color(0xFFF59E0B),
      'icon': Icons.menu_book_rounded,
    },
    {
      'title': 'Pemburu Bug Level 3',
      'desc': 'Selesaikan arena petualangan Level 3 tanpa nyawa habis.',
      'reward': 100,
      'current_progress': 0,
      'max_progress': 1,
      'status': 0, // Belum selesai
      'color': const Color(0xFF3B82F6),
      'icon': Icons.pest_control_rounded,
    },
    {
      'title': 'Ahli Logika Dasar',
      'desc': 'Jawab 5 pertanyaan kuis berturut-turut dengan benar.',
      'reward': 150,
      'current_progress': 3,
      'max_progress': 5,
      'status': 0, // In progress
      'color': const Color(0xFF8B5CF6),
      'icon': Icons.lightbulb_rounded,
    },
    {
      'title': 'Absensi Petualang',
      'desc': 'Login ke dalam game Code Hunter.',
      'reward': 20,
      'current_progress': 1,
      'max_progress': 1,
      'status': 2, // Sudah diklaim
      'color': const Color(0xFF10B981),
      'icon': Icons.login_rounded,
    },
  ];

  void _claimReward(int index) {
    if (_challenges[index]['status'] == 1) {
      setState(() {
        _userCoins += _challenges[index]['reward'] as int;
        _challenges[index]['status'] = 2;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.stars_rounded, color: Color(0xFFFFD700)),
              const SizedBox(width: 12),
              Text(
                'Berhasil mengklaim +${_challenges[index]['reward']} Koin!',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Image.asset(
            'assets/images/bg/bg_jungle.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: const Color(0xFF0F172A)),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
              child: Container(color: const Color(0xFF0F172A).withOpacity(0.7)),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // --- TOP BAR ---
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 20.0,
                  ),
                  child: Row(
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
                        'TANTANGAN HARIAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFF59E0B).withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.monetization_on_rounded,
                              color: Color(0xFFFCD34D),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$_userCoins',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // --- KONTEN TENGAH (DIBATASI LEBARNYA AGAR RAPI) ---
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 850,
                      ), // Batas maksimal lebar konten
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 12.0,
                        ),
                        children: [
                          _buildCountdownBanner(),
                          const SizedBox(height: 32),

                          ...List.generate(_challenges.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: _buildChallengeCard(
                                index,
                                _challenges[index],
                              ),
                            );
                          }),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- BANNER HITUNG MUNDUR (LEBIH MEWAH) ---
  Widget _buildCountdownBanner() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)], // Indigo ke Ungu
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Ornamen Icon Transparan di Belakang
            Positioned(
              right: -30,
              top: -30,
              child: Transform.rotate(
                angle: 0.2,
                child: Icon(
                  Icons.timer_outlined,
                  size: 180,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),

            // Konten Teks
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: const Icon(
                      Icons.access_time_filled_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(width: 24),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Misi Baru Akan Tersedia Dalam',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '14 Jam 24 Menit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
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
    );
  }

  // --- KARTU TANTANGAN (TERSTRUKTUR & RAPI) ---
  Widget _buildChallengeCard(int index, Map<String, dynamic> challenge) {
    final int status = challenge['status'];
    final Color itemColor = challenge['color'];
    final double progressPercent =
        challenge['current_progress'] / challenge['max_progress'];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // BAGIAN ATAS: Info Misi
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: itemColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(challenge['icon'], color: itemColor, size: 32),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challenge['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      challenge['desc'],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFDE68A)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.stars_rounded,
                      color: Color(0xFFF59E0B),
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '+${challenge['reward']}',
                      style: const TextStyle(
                        color: Color(0xFFD97706),
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(
            color: Color(0xFFF1F5F9),
            thickness: 2,
          ), // Garis pemisah yang bikin rapi
          const SizedBox(height: 16),

          // BAGIAN BAWAH: Progress & Tombol
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progres Penyelesaian',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: status == 2
                                ? const Color(0xFF10B981)
                                : const Color(0xFF94A3B8),
                          ),
                        ),
                        Text(
                          '${challenge['current_progress']} / ${challenge['max_progress']}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: status == 2
                                ? const Color(0xFF10B981)
                                : const Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: progressPercent,
                        backgroundColor: const Color(0xFFF1F5F9),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          status == 2 ? const Color(0xFF10B981) : itemColor,
                        ),
                        minHeight: 10, // Ditebalkan sedikit
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),

              // Tombol
              _buildActionButton(status, index),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(int status, int index) {
    if (status == 0) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEFF6FF), // Biru sangat muda
          foregroundColor: const Color(0xFF2563EB), // Biru gelap
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'MULAI MISI',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
      );
    } else if (status == 1) {
      return ElevatedButton(
        onPressed: () => _claimReward(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF10B981),
          foregroundColor: Colors.white,
          elevation: 6,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: const Color(0xFF10B981).withOpacity(0.5),
        ),
        child: const Text(
          'KLAIM KOIN',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: const Color(0xFFF8FAFC),
          disabledForegroundColor: const Color(0xFFCBD5E1),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
        ),
        child: const Text(
          'SELESAI',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
      );
    }
  }
}
