import 'package:flutter/material.dart';

class GlobalState {
  static final GlobalState instance = GlobalState._internal();
  GlobalState._internal();

  int playerCoins = 1500;

  // Fungsi untuk mengurangi koin (digunakan saat beli Hero)
  bool spendCoins(int amount) {
    if (playerCoins >= amount) {
      playerCoins -= amount;
      return true;
    }
    return false;
  }

  // Fungsi untuk menambah koin (digunakan saat klaim Misi)
  void addCoins(int amount) {
    playerCoins += amount;
  }

  // Daftar Tantangan Harian (Dipindah ke Global agar terhubung ke seluruh sistem)
  final List<Map<String, dynamic>> challenges = [
    {
      'title': 'Kutu Buku Harian',
      'desc':
          'Baca dan selesaikan 1 modul materi pembelajaran apapun hari ini.',
      'reward': 50,
      'current_progress': 1,
      'max_progress': 1,
      'status': 1, // 0: Belum, 1: Siap diklaim, 2: Selesai
      'color': const Color(0xFFF59E0B),
      'icon': Icons.menu_book_rounded,
    },
    {
      'title': 'Pemburu Bug Level 3',
      'desc': 'Selesaikan arena petualangan Level 3 tanpa nyawa habis.',
      'reward': 100,
      'current_progress': 0,
      'max_progress': 1,
      'status': 0,
      'color': const Color(0xFF3B82F6),
      'icon': Icons.pest_control_rounded,
    },
    {
      'title': 'Ahli Logika Dasar',
      'desc': 'Jawab 5 pertanyaan kuis berturut-turut dengan benar.',
      'reward': 150,
      'current_progress': 3,
      'max_progress': 5,
      'status': 0,
      'color': const Color(0xFF8B5CF6),
      'icon': Icons.lightbulb_rounded,
    },
    {
      'title': 'Absensi Petualang',
      'desc': 'Login ke dalam game Code Hunter.',
      'reward': 20,
      'current_progress': 1,
      'max_progress': 1,
      'status': 2,
      'color': const Color(0xFF10B981),
      'icon': Icons.login_rounded,
    },
  ];

  // Fungsi untuk memperbarui progres misi dari halaman lain (Materi/Game)
  void updateChallengeProgress(int index, int addedProgress) {
    if (challenges[index]['status'] == 2) return; // Jika sudah diklaim, abaikan

    challenges[index]['current_progress'] += addedProgress;

    // Jika progres mencapai target, ubah status menjadi siap diklaim (1)
    if (challenges[index]['current_progress'] >=
        challenges[index]['max_progress']) {
      challenges[index]['current_progress'] = challenges[index]['max_progress'];
      if (challenges[index]['status'] == 0) {
        challenges[index]['status'] = 1;
      }
    }
  }
}
