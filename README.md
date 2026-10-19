# 🎮 Code Hunter: Game Edukasi 2D Pembelajaran Fundamental Pemrograman

**Code Hunter** adalah aplikasi _game_ edukasi dua dimensi (2D) bergenre _action-platformer_ berbasis Android yang dirancang khusus untuk membantu siswa SMK jurusan **Pengembangan Perangkat Lunak dan Gim (PPLG) / Rekayasa Perangkat Lunak (RPL)** dalam mempelajari serta menguji pemahaman materi fundamental pemrograman secara interaktif.

---

## 👩‍💻 Identitas Pengembang

- **Nama Lengkap:** Fida Enjellia Anggoroning Ayu
- **NPM:** 2413025034
- **Mata Kuliah:** Mobile Programming
- **Dosen Pengampu:** Ghea Chandra Surawan, M.Pd.
- **Program Studi:** Pendidikan Teknologi Informasi, FKIP, Universitas Lampung

---

## 📖 Ringkasan Aplikasi & Latar Belakang Masalah

Kemudahan akses kecerdasan buatan saat ini sering kali membuat pelajar mengambil jawaban instan tanpa melalui proses berpikir analitis dan pemecahan masalah (_problem solving_). Padahal, pembelajaran dasar pemrograman menuntut latihan logika, pemahaman sintaks, serta penelusuran kesalahan (_debugging_) secara mandiri.

**Code Hunter** hadir sebagai solusi media pembelajaran pendamping yang menggabungkan mekanisme permainan _platformer_ dengan tantangan evaluasi pemrograman berjenjang:

1. **Eksplorasi & Aksi 2D:** Pemain mengendalikan karakter pahlawan untuk menjelajahi peta, melompati rintangan, mengumpulkan koin, dan menembakkan proyektil ke arah _Coding Bug_ (musuh _Slime_).
2. **Evaluasi Kuis Terintegrasi:** Setiap kali serangan pemain mengenai musuh, permainan akan dijeda dan menampilkan _pop-up_ kuis pemrograman (mencakup 20 level dari konsep Variabel, Tipe Data, Operator, Percabangan, Perulangan, Fungsi, Array/Object, hingga _Error Handling_).
3. **Modul Materi Komprehensif (_Clean Edutech UI_):** Dilengkapi 8 modul bacaan terstruktur yang memuat konsep dasar, analogi sehari-hari, studi kasus kode beserta _output_ terminal, bedah potongan kode, serta tantangan berpikir kritis.
4. **Gamifikasi & Retensi:** Menyediakan fitur _Hero Roster_ (8 karakter pahlawan), _Daily Challenge_ (Tantangan Harian), serta dasbor _Profil Siswa_ untuk memantau persentase progres belajar dan lencana pencapaian (_badges_).

---

## 🖼️ Tangkapan Layar Antarmuka (Screenshots)

|           Halaman Pembuka (_Landing Page_)           |            Menu Utama (_Main Menu_)            |
| :--------------------------------------------------: | :--------------------------------------------: |
| ![Landing Page](assets/screenshots/landing_page.png) | ![Main Menu](assets/screenshots/main_menu.png) |

|                  Modul Materi Pembelajaran                   |         Pemilihan Pahlawan (_Hero Roster_)         |
| :----------------------------------------------------------: | :------------------------------------------------: |
| ![Materi Pembelajaran](assets/screenshots/materi_screen.png) | ![Hero Roster](assets/screenshots/hero_roster.png) |

|       Arena Permainan (_Gameplay 2D_)        |            Interaksi Kuis Pemrograman             |
| :------------------------------------------: | :-----------------------------------------------: |
| ![Gameplay](assets/screenshots/gameplay.png) | ![Pop-up Kuis](assets/screenshots/quiz_popup.png) |

_(Catatan: Tangkapan layar di atas diambil langsung dari purwarupa aplikasi Code Hunter)._

---

## 🛠️ Teknologi yang Digunakan (Tech Stack)

- **Framework:** Flutter SDK (v3.47.1)
- **Bahasa Pemrograman:** Dart (v3.13.1)
- **2D Game Engine:** Flame Engine (`flame` & `flame_tiled`)
- **Level Design:** Tiled Map Editor (`.tmx`)
- **Audio Engine:** `audioplayers` (dengan kustomisasi _Singleton Audio Ducking_)
- **Target Platform:** Android

---

## 📂 Struktur Direktori Proyek

```text
code_hunter/
├── assets/
│   ├── audio/                # Berkas musik latar (BGM) dan efek suara (SFX .mp3)
│   ├── images/               # Aset latar belakang, karakter (char_1 - char_8), musuh, & item
│   └── tiled/maps/           # Berkas peta level permainan berbasis Tiled (.tmx)
├── lib/
│   ├── game/
│   │   ├── code_hunter_game.dart     # Inti Flame Engine, kamera, HUD, dan pemuat peta Tiled
│   │   ├── game_elements.dart        # Entitas Fireball, EnemyComponent (Slime), Coin, Gem, Heart
│   │   └── player_component.dart     # Kinematika pemain, gravitasi, lompatan, & deteksi tabrakan
│   ├── models/                       # Model struktur data level, pemain, dan soal
│   ├── screens/
│   │   ├── landing_page_screen.dart  # Layar pembuka dengan animasi garis pemuatan
│   │   ├── main_menu_screen.dart     # Beranda navigasi utama bergaya Clean Edutech
│   │   ├── profile_screen.dart       # Dasbor identitas siswa, progres belajar, dan lencana
│   │   ├── character_screen.dart     # Antarmuka Hero Roster dan rincian atribut karakter
│   │   ├── materi_screen.dart        # 8 Modul pembelajaran interaktif & studi kasus kritis
│   │   ├── daily_challenge_screen.dart # Sistem misi harian dan klaim hadiah koin
│   │   ├── setting_screen.dart       # Pengaturan volume audio, tampilan, dan reset progres
│   │   ├── level_screen.dart         # Peta pemilihan 20 arena level berjenjang
│   │   └── game_screen.dart          # Pembungkus GameWidget serta logika pop-up kuis & Game Over
│   ├── utils/
│   │   └── audio_manager.dart        # Pengelola audio global (BGM looping & SFX audio ducking)
│   └── main.dart                     # Titik masuk utama (entry point) aplikasi
└── pubspec.yaml                      # Konfigurasi dependensi dan registrasi aset
```

---

## 🚀 Langkah-Langkah Menjalankan Proyek

Ikuti panduan berikut untuk menjalankan proyek **Code Hunter** di lingkungan lokal Anda:

### 1. Prasyarat Sistem

Pastikan perangkat Anda telah terinstal:

- **Flutter SDK** (versi 3.x ke atas)
- **Java Development Kit (JDK 17)**
- **Android SDK** & **Android Emulator** (atau perangkat fisik Android)
- **Visual Studio Code** (dengan ekstensi _Flutter_ dan _Dart_)
- **Git**

### 2. Kloning Repositori

Buka terminal atau _Command Prompt_, lalu kloning repositori ini:

```bash
git clone [https://github.com/pidampie/code-hunter.git](https://github.com/pidampie/code-hunter.git)
cd code-hunter
```

### 3. Instalasi Dependensi Paket

Unduh seluruh pustaka yang dibutuhkan proyek sesuai konfigurasi `pubspec.yaml`:

```bash
flutter clean
flutter pub get
```

### 4. Menjalankan Aplikasi di Emulator / Perangkat Android

Pastikan _Android Emulator_ sudah menyala atau perangkat Android fisik telah terhubung melalui _USB Debugging_, kemudian jalankan perintah:

```bash
flutter run
```

Untuk membangun (_build_) berkas instalasi APK Android:

```bash
flutter build apk --release
```
