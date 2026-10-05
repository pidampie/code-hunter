import 'dart:ui';

import 'package:flutter/material.dart';

// Variabel Global untuk menyimpan progres bacaan materi
// Dimulai dari Modul 1 (index 0) yang terbuka
int globalUnlockedModule = 1;

class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  final List<Map<String, dynamic>> _modules = [
    {
      'title': 'Dasar Pemrograman',
      'desc': 'Gimana sih cara manusia ngobrol dan memerintah komputer?',
      'color': const Color(0xFF3B82F6),
      'icon': Icons.computer_rounded,
    },
    {
      'title': 'Variabel & Identifier',
      'desc': 'Di mana ya komputer menyimpan angka dan nama pemain?',
      'color': const Color(0xFF10B981),
      'icon': Icons.data_object_rounded,
    },
    {
      'title': 'Klasifikasi Tipe Data',
      'desc': 'Ada jenis data apa saja sih di dunia komputer kita?',
      'color': const Color(0xFFF59E0B),
      'icon': Icons.category_rounded,
    },
    {
      'title': 'Operator & Logika',
      'desc': 'Gimana sih cara komputer berhitung dan membandingkan?',
      'color': const Color(0xFF8B5CF6),
      'icon': Icons.calculate_rounded,
    },
    {
      'title': 'Kondisi & Percabangan',
      'desc': 'Membuat komputer bisa berpikir dan mengambil keputusan sendiri.',
      'color': const Color(0xFFEC4899),
      'icon': Icons.alt_route_rounded,
    },
    {
      'title': 'Perulangan (Looping)',
      'desc': 'Menyuruh komputer melakukan tugas berulang-ulang tanpa lelah.',
      'color': const Color(0xFF14B8A6),
      'icon': Icons.loop_rounded,
    },
    {
      'title': 'Struktur Data Array',
      'desc': 'Menyimpan banyak data sekaligus dalam satu tempat yang rapi.',
      'color': const Color(0xFFF43F5E),
      'icon': Icons.view_list_rounded,
    },
    {
      'title': 'Fungsi & Method',
      'desc': 'Membungkus kode menjadi blok praktis yang bisa dipakai berkali-kali.',
      'color': const Color(0xFF6366F1),
      'icon': Icons.functions_rounded,
    },
  ];

  void _openReadingMaterial(int index, Map<String, dynamic> module) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(module['icon'], color: module['color'], size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                module['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              module['desc'],
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Di sini nanti akan berisi teks penjelasan materi yang panjang, contoh kode, dan ilustrasi untuk dipelajari oleh user...',
                style: TextStyle(height: 1.5, color: Colors.black87),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'TUTUP',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF10B981),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // LOGIKA UNLOCK MODUL BERIKUTNYA
              if (index + 1 == globalUnlockedModule &&
                  globalUnlockedModule < _modules.length) {
                setState(() {
                  globalUnlockedModule++;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Selamat! Modul berikutnya telah terbuka.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Color(0xFF10B981),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
              Navigator.pop(ctx);
            },
            child: const Text(
              'TANDAI SELESAI',
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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg/bg_jungle.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: const Color(0xFFF8FAFC)),
          ),

          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24.0, sigmaY: 24.0),
              child: Container(color: const Color(0xFF0F172A).withOpacity(0.8)),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 24.0,
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
                        'MATERI PEMBELAJARAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Center(
                    child: SizedBox(
                      // Membatasi tinggi kartu agar bentuknya jadi PERSEGI KOTAK, bukan persegi panjang ke bawah
                      height: 310,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _modules.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 24),
                        itemBuilder: (context, index) {
                          final module = _modules[index];
                          return _buildCleanCard(module, index);
                        },
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      'Geser ke kanan untuk melihat modul lainnya',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
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

  Widget _buildCleanCard(Map<String, dynamic> module, int index) {
    // LOGIKA STATUS MODUL
    final bool isCompleted = index < globalUnlockedModule - 1;
    final bool isCurrent = index == globalUnlockedModule - 1;
    final bool isLocked = index > globalUnlockedModule - 1;

    // Menentukan warna berdasarkan status kunci
    final Color primaryColor = isLocked
        ? const Color(0xFF94A3B8)
        : module['color'];
    final IconData displayIcon = isLocked ? Icons.lock_rounded : module['icon'];

    return Container(
      width: 260, // Lebar dibuat sama dengan tinggi atau seimbang untuk membentuk kotak
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
          // BAGIAN ATAS: Banner Terang / Gelap
          Container(
            height: 110, // Ketinggian banner dikurangi agar kartu lebih kotak
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  isLocked
                      ? const Color(0xFFCBD5E1)
                      : (primaryColor).withOpacity(0.7),
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
                    displayIcon,
                    size: 100,
                    color: Colors.white.withOpacity(0.15),
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
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'MODUL 0${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                Center(child: Icon(displayIcon, size: 48, color: Colors.white)),
              ],
            ),
          ),

          // BAGIAN BAWAH: Teks & Tombol
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Padding disesuaikan
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    module['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isLocked
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF1E293B),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isLocked
                        ? 'Selesaikan materi sebelumnya untuk membuka modul ini.'
                        : module['desc'],
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

                  // TOMBOL INTERAKTIF
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLocked
                          ? null
                          : () => _openReadingMaterial(index, module),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLocked
                            ? const Color(0xFFF1F5F9)
                            : (isCompleted
                                  ? const Color(0xFFD1FAE5)
                                  : const Color(0xFFF1F5F9)),
                        foregroundColor: isLocked
                            ? const Color(0xFF94A3B8)
                            : (isCompleted
                                  ? const Color(0xFF10B981)
                                  : primaryColor),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        isLocked
                            ? 'TERKUNCI'
                            : (isCompleted
                                  ? 'PELAJARI ULANG'
                                  : 'MULAI BELAJAR'),
                        style: const TextStyle(
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
    );
  }
}
