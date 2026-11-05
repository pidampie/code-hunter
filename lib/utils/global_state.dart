import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalState {
  static final GlobalState instance = GlobalState._internal();
  GlobalState._internal();

  late SharedPreferences prefs;

  // Nilai default koin sebelum data dimuat
  int playerCoins = 1500; 

  // Daftar nama pahlawan yang sudah dibeli (STEVIE gratis)
  List<String> unlockedHeroes = ['STEVIE'];

  // Daftar Tantangan Harian (Warna dan Ikon tetap statis)
  final List<Map<String, dynamic>> challenges = [
    {
      'title': 'Kutu Buku Harian',
      'desc': 'Baca dan selesaikan 1 modul materi pembelajaran apapun hari ini.',
      'reward': 50,
      'current_progress': 1,
      'max_progress': 1,
      'status': 1, 
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

  // =========================================================
  // FUNGSI INISIALISASI (DIPANGGIL SAAT APLIKASI PERTAMA BUKA)
  // =========================================================
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    
    // 1. Muat Koin (Jika pengguna baru, beri 1500 koin)
    playerCoins = prefs.getInt('playerCoins') ?? 1500;
    
    // 2. Muat Pahlawan yang Terbuka
    unlockedHeroes = prefs.getStringList('unlockedHeroes') ?? ['STEVIE'];
    
    // 3. Muat Progres Tantangan Harian (Hanya memuat angka progres & status)
    String? challengesData = prefs.getString('challengesData');
    if (challengesData != null) {
      List<dynamic> decoded = jsonDecode(challengesData);
      for (int i = 0; i < decoded.length; i++) {
        if (i < challenges.length) {
          challenges[i]['current_progress'] = decoded[i]['current_progress'];
          challenges[i]['status'] = decoded[i]['status'];
        }
      }
    }
  }

  // =========================================================
  // FUNGSI TRANSAKSI DAN PENYIMPANAN PERMANEN
  // =========================================================
  
  // Mengurangi Koin & Menyimpan
  bool spendCoins(int amount) {
    if (playerCoins >= amount) {
      playerCoins -= amount;
      prefs.setInt('playerCoins', playerCoins); // SIMPAN PERMANEN
      return true;
    }
    return false;
  }

  // Menambah Koin & Menyimpan
  void addCoins(int amount) {
    playerCoins += amount;
    prefs.setInt('playerCoins', playerCoins); // SIMPAN PERMANEN
  }

  // Membuka Kunci Pahlawan & Menyimpan
  void unlockHero(String heroName) {
    if (!unlockedHeroes.contains(heroName)) {
      unlockedHeroes.add(heroName);
      prefs.setStringList('unlockedHeroes', unlockedHeroes); // SIMPAN PERMANEN
    }
  }

  // Mengecek Status Pahlawan
  bool isHeroUnlocked(String heroName) {
    return unlockedHeroes.contains(heroName);
  }

  // Menyimpan Progres Tantangan
  void saveChallenges() {
    List<Map<String, dynamic>> dataToSave = challenges.map((c) => {
      'current_progress': c['current_progress'] as int,
      'status': c['status'] as int,
    }).toList();
    prefs.setString('challengesData', jsonEncode(dataToSave)); // SIMPAN PERMANEN
  }
}