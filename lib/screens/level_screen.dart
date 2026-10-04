import 'dart:ui';

import 'package:flutter/material.dart';

import 'game_screen.dart';

int globalUnlockedLevel = 1;

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  final List<String> levelTitles = [
    "Hutan Variabel Dasar",
    "Rawa Operator Aritmatika",
    "Lembah Perbandingan",
    "Gua Logika Boolean",
    "Tebing If-Else Dasar",
    "Danau Kondisi Bersarang",
    "Benteng Switch Case",
    "Gurun Perulangan For",
    "Sabana While Loop",
    "Kuil Array Dasar",
    "Labirin Method Array",
    "Padang Fungsi Dasar",
    "Puncak Parameter Fungsi",
    "Awan Arrow Function",
    "Pulau Objek Data",
    "Kastil Method Objek",
    "Hutan Array of Objects",
    "Dimensi Manipulasi String",
    "Jurang Error Try-Catch",
    "Istana Master Algoritma",
  ];

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
                Container(color: const Color(0xFF0F172A)),
          ),

          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
              child: Container(
                color: const Color(0xFF0F172A).withOpacity(0.65),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
                        'PILIH ARENA PETUALANGAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    // Menambahkan padding horizontal agar grid tidak terlalu melebar ke ujung layar
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            // Angka > 1 membuat kartu lebih pipih/pendek (tidak memanjang ke bawah)
                            childAspectRatio: 1.25,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _buildLevelCard(index);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard(int index) {
    final bool isCompleted = index < globalUnlockedLevel - 1;
    final bool isCurrent = index == globalUnlockedLevel - 1;
    final bool isLocked = index > globalUnlockedLevel - 1;

    Color bannerColor;
    IconData cardIcon;
    String statusText;

    if (isCompleted) {
      bannerColor = const Color(0xFF10B981);
      cardIcon = Icons.check_circle_rounded;
      statusText = 'SELESAI';
    } else if (isCurrent) {
      bannerColor = const Color(0xFF3B82F6);
      cardIcon = Icons.play_arrow_rounded;
      statusText = 'SIAP DIMAINKAN';
    } else {
      bannerColor = const Color(0xFF94A3B8);
      cardIcon = Icons.lock_rounded;
      statusText = 'TERKUNCI';
    }

    return InkWell(
      onTap: isLocked
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      GameScreen(levelFile: 'Level1.tmx', levelIndex: index),
                ),
              ).then((_) => setState(() {}));
            },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BANNER ATAS (Dibuat lebih pendek agar kartu terlihat ringkas)
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [bannerColor, bannerColor.withOpacity(0.75)],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -8,
                      top: -12,
                      child: Icon(
                        cardIcon,
                        size: 70,
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                    Center(
                      child: Icon(cardIcon, color: Colors.white, size: 28),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Level ${index + 1}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isLocked
                            ? 'Selesaikan level sebelumnya'
                            : levelTitles[index],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w600,
                          color: isLocked
                              ? const Color(0xFF94A3B8)
                              : const Color(0xFF64748B),
                          height: 1.3,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w800,
                          color: bannerColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
