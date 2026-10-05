import 'dart:ui';

import 'package:flutter/material.dart';

import 'setting_screen.dart'; // Untuk mengambil nama player

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data nama dari GameSettings (sama seperti di Menu Utama)
    final String playerName = GameSettings.instance.playerName;
    final int userCoins = 350;
    final double overallProgress = 0.35;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Hutan
          Image.asset(
            'assets/images/bg/bg_jungle.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: const Color(0xFF0F172A)),
          ),

          // Efek Kaca Buram
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
                        'PROFIL SISWA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // --- KONTEN PROFIL ---
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 850),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 12.0,
                        ),
                        children: [
                          // 1. KARTU IDENTITAS
                          Container(
                            padding: const EdgeInsets.all(32),
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
                            child: Row(
                              children: [
                                // Foto Profil (Avatar)
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEFF6FF),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF3B82F6),
                                      width: 4,
                                    ),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/player/char_1.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                // Detail Nama & Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        playerName.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF1E293B),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F5F9),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: const Text(
                                          'APPRENTICE CODER',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFF38BDF8),
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      // Info Koin
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.monetization_on_rounded,
                                            color: Color(0xFFF59E0B),
                                            size: 24,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$userCoins Koin Emas',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF64748B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // 2. STATISTIK & PROGRES BELAJAR
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Kiri: Progres Keseluruhan
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'PROGRES BELAJAR',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF94A3B8),
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${(overallProgress * 100).toInt()}%',
                                            style: const TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xFF3B82F6),
                                              height: 1,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 6.0,
                                            ),
                                            child: Text(
                                              'Diselesaikan',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF64748B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: LinearProgressIndicator(
                                          value: overallProgress,
                                          backgroundColor: const Color(
                                            0xFFF1F5F9,
                                          ),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                Color
                                              >(Color(0xFF3B82F6)),
                                          minHeight: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      _buildStatRow(
                                        Icons.flag_rounded,
                                        'Level Arena',
                                        '7 / 20',
                                        const Color(0xFF10B981),
                                      ),
                                      const Divider(
                                        height: 30,
                                        color: Color(0xFFF1F5F9),
                                        thickness: 2,
                                      ),
                                      _buildStatRow(
                                        Icons.menu_book_rounded,
                                        'Modul Materi',
                                        '3 / 8',
                                        const Color(0xFFF59E0B),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24),

                              // Kanan: Lencana (Badges/Achievements)
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'PENCAPAIAN (BADGES)',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF94A3B8),
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      GridView.count(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                        childAspectRatio: 0.85,
                                        children: [
                                          _buildBadge(
                                            Icons.local_fire_department_rounded,
                                            'First Blood',
                                            'Selesaikan 1 Level',
                                            true,
                                            const Color(0xFFEF4444),
                                          ),
                                          _buildBadge(
                                            Icons.auto_stories_rounded,
                                            'Si Rajin',
                                            'Baca 3 Materi',
                                            true,
                                            const Color(0xFF3B82F6),
                                          ),
                                          _buildBadge(
                                            Icons.emoji_events_rounded,
                                            'Kaya Raya',
                                            'Kumpul 500 Koin',
                                            false,
                                            const Color(0xFFEAB308),
                                          ),
                                          _buildBadge(
                                            Icons.bug_report_rounded,
                                            'Exterminator',
                                            'Kalahkan 50 Bug',
                                            false,
                                            const Color(0xFF10B981),
                                          ),
                                          _buildBadge(
                                            Icons.school_rounded,
                                            'Master Logic',
                                            'Lulus Semua Modul',
                                            false,
                                            const Color(0xFF8B5CF6),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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

  Widget _buildStatRow(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 16),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF475569),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(
    IconData icon,
    String title,
    String desc,
    bool isUnlocked,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUnlocked ? color.withOpacity(0.1) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUnlocked ? color.withOpacity(0.3) : const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isUnlocked ? icon : Icons.lock_rounded,
            color: isUnlocked ? color : const Color(0xFFCBD5E1),
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: isUnlocked
                  ? const Color(0xFF1E293B)
                  : const Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}
