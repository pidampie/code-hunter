import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  AudioManager._internal();
  static final AudioManager instance = AudioManager._internal();

  final AudioPlayer _bgmPlayer = AudioPlayer();
  Timer? _duckTimer;

  double _bgmVolume = 0.6; // Volume normal BGM (60%)
  double _sfxVolume = 1.0; // Volume normal SFX (100%)
  bool _isMuted = false;
  bool _isBgmPlaying = false;

  // Inisialisasi konfigurasi audio agar BGM dan SFX bisa berbunyi bersamaan
  Future<void> init() async {
    await AudioPlayer.global.setAudioContext(
      AudioContext(
        android: const AudioContextAndroid(
          isSpeakerphoneOn: true,
          stayAwake: false,
          contentType: AndroidContentType.music,
          usageType: AndroidUsageType.game,
          audioFocus:
              AndroidAudioFocus.none, // Penting agar SFX tidak mematikan BGM
        ),
      ),
    );
    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
  }

  // 1. PUTAR MUSIK LATAR BERULANG-ULANG (Intro Theme.mp3)
  Future<void> startBgm() async {
    if (_isBgmPlaying) return;
    try {
      await _bgmPlayer.setVolume(_isMuted ? 0.0 : _bgmVolume);
      await _bgmPlayer.play(AssetSource('audio/Intro Theme.mp3'));
      _isBgmPlaying = true;
    } catch (e) {
      // Abaikan jika gagal memuat pada percobaan pertama
    }
  }

  // Fungsi internal untuk memutar SFX sekaligus meredupkan BGM (Audio Ducking)
  Future<void> _playSfxWithDucking(
    String fileName, {
    Duration duckDuration = const Duration(milliseconds: 700),
    double duckRatio = 0.2, // BGM meredup menjadi 20% dari volume normal
  }) async {
    if (_isMuted) return;

    try {
      // Redupkan volume BGM sementara
      if (_isBgmPlaying) {
        await _bgmPlayer.setVolume(_bgmVolume * duckRatio);
      }

      // Buat player khusus untuk SFX agar bisa ditumpuk (overlap) tanpa memotong SFX lain
      final sfxPlayer = AudioPlayer();
      await sfxPlayer.setVolume(_sfxVolume);
      await sfxPlayer.play(AssetSource('audio/$fileName'));

      // Hapus player dari memori setelah selesai berbunyi
      sfxPlayer.onPlayerComplete.listen((_) {
        sfxPlayer.dispose();
      });

      // Kembalikan volume BGM ke normal setelah durasi SFX selesai
      _duckTimer?.cancel();
      _duckTimer = Timer(duckDuration, () async {
        if (_isBgmPlaying && !_isMuted) {
          await _bgmPlayer.setVolume(_bgmVolume);
        }
      });
    } catch (e) {
      // Tangani jika ada error pemutaran
    }
  }

  // =========================================================
  // DAFTAR FUNGSI SOUND EFFECT SESUAI FILE DI FOLDER AUDIO
  // =========================================================

  /// 1. Saat user mengeklik apa pun di seluruh sistem (UI Click.mp3)
  void playClick() {
    _playSfxWithDucking(
      'UI Click.mp3',
      duckDuration: const Duration(milliseconds: 350),
      duckRatio: 0.35,
    );
  }

  /// 2. Saat karakter melompat di rintangan level (jump.mp3)
  void playJump() {
    _playSfxWithDucking(
      'jump.mp3',
      duckDuration: const Duration(milliseconds: 450),
      duckRatio: 0.3,
    );
  }

  /// 3. Saat karakter menyentuh koin (coin.mp3)
  void playCoin() {
    _playSfxWithDucking(
      'coin.mp3',
      duckDuration: const Duration(milliseconds: 600),
      duckRatio: 0.25,
    );
  }

  /// 4. Saat karakter mengenai monster tanpa menembaknya (hurt.mp3)
  void playHurt() {
    _playSfxWithDucking(
      'hurt.mp3',
      duckDuration: const Duration(milliseconds: 800),
      duckRatio: 0.15,
    );
  }

  /// 5. Saat karakter berhasil menjawab soal dengan BENAR (succes game.mp3)
  void playQuizCorrect() {
    _playSfxWithDucking(
      'succes game.mp3',
      duckDuration: const Duration(milliseconds: 1400),
      duckRatio: 0.15,
    );
  }

  /// 6. Saat karakter menjawab SALAH di soal (eror.mp3)
  void playQuizWrong() {
    _playSfxWithDucking(
      'eror.mp3',
      duckDuration: const Duration(milliseconds: 1000),
      duckRatio: 0.15,
    );
  }

  /// 7. Saat karakter Game Over / nyawa habis / gagal (fail.mp3)
  void playGameOver() {
    _playSfxWithDucking(
      'fail.mp3',
      duckDuration: const Duration(milliseconds: 2200),
      duckRatio: 0.1,
    );
  }

  /// 8. Saat menang level dan lanjut ke level berikutnya (win.mp3)
  void playLevelWin() {
    _playSfxWithDucking(
      'win.mp3',
      duckDuration: const Duration(milliseconds: 2800),
      duckRatio: 0.1,
    );
  }

  // =========================================================
  // PENGATURAN VOLUME (Untuk disambungkan ke SettingScreen)
  // =========================================================
  Future<void> setBgmVolume(double value) async {
    _bgmVolume = value.clamp(0.0, 1.0);
    if (!_isMuted) {
      await _bgmPlayer.setVolume(_bgmVolume);
    }
  }

  void setSfxVolume(double value) {
    _sfxVolume = value.clamp(0.0, 1.0);
  }
}
