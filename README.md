# CODE HUNTER: GAME EDUKASI 2D BERBASIS ANDROID UNTUK PEMBELAJARAN FUNDAMENTAL PEMOGRAMAN BAGI SISWA SMK PENGEMBANGAN PERANGKAT LUNAK DAN GIM

**Code Hunter** adalah aplikasi _game_ edukasi dua dimensi (2D) bergenre _action-platformer_ berbasis Android yang dirancang khusus untuk membantu siswa SMK jurusan **Pengembangan Perangkat Lunak dan Gim (PPLG) / Rekayasa Perangkat Lunak (RPL)** dalam mempelajari serta menguji pemahaman materi fundamental pemrograman secara interaktif.

---

## Identitas Pengembang

- **Nama Lengkap:** Fida Enjellia Anggoroning Ayu
- **NPM:** 2413025034
- **Mata Kuliah:** Mobile Programming
- **Dosen Pengampu:** Ghea Chandra Surawan, M.Pd.
- **Program Studi:** Pendidikan Teknologi Informasi, FKIP, Universitas Lampung

---

## Ringkasan Aplikasi & Latar Belakang Masalah

Kemudahan akses kecerdasan buatan saat ini sering kali membuat pelajar mengambil jawaban instan tanpa melalui proses berpikir analitis dan pemecahan masalah (_problem solving_). Padahal, pembelajaran dasar pemrograman menuntut latihan logika, pemahaman sintaks, serta penelusuran kesalahan (_debugging_) secara mandiri.

**Code Hunter** hadir sebagai solusi media pembelajaran pendamping yang menggabungkan mekanisme permainan _platformer_ dengan tantangan evaluasi pemrograman berjenjang:

1. **Eksplorasi & Aksi 2D:** Pemain mengendalikan karakter pahlawan untuk menjelajahi peta, melompati rintangan, mengumpulkan koin, dan menembakkan proyektil ke arah _Coding Bug_ (musuh _Slime_).
2. **Evaluasi Kuis Terintegrasi:** Setiap kali serangan pemain mengenai musuh, permainan akan dijeda dan menampilkan _pop-up_ kuis pemrograman (mencakup 20 level dari konsep Variabel, Tipe Data, Operator, Percabangan, Perulangan, Fungsi, Array/Object, hingga _Error Handling_).
3. **Modul Materi Komprehensif (_Clean Edutech UI_):** Dilengkapi 8 modul bacaan terstruktur yang memuat konsep dasar, analogi sehari-hari, studi kasus kode beserta _output_ terminal, bedah potongan kode, serta tantangan berpikir kritis.
4. **Gamifikasi & Retensi:** Menyediakan fitur _Hero Roster_ (8 karakter pahlawan), _Daily Challenge_ (Tantangan Harian), serta dasbor _Profil Siswa_ untuk memantau persentase progres belajar dan lencana pencapaian (_badges_).

---

## Tangkapan Layar Antarmuka (Screenshots)

### 1. Halaman Pembuka, Menu Utama, & Profil Siswa

|           Halaman Pembuka (_Landing Page_)           |             Menu Utama (Bagian Kiri)             |
| :--------------------------------------------------: | :----------------------------------------------: |
| ![Landing Page](assets/screenshots/landing_page.png) | ![Main Menu 1](assets/screenshots/main_menu.png) |

|             Menu Utama (Bagian Kanan)             |          Dasbor Profil Siswa & Lencana          |
| :-----------------------------------------------: | :---------------------------------------------: |
| ![Main Menu 2](assets/screenshots/main_menu2.png) | ![Profil Siswa](assets/screenshots/profile.png) |

### 2. Pemilihan Level, Arena Permainan (Gameplay 2D), & Evaluasi Kuis

|               Peta Pemilihan Arena Level               |        Arena Permainan (_Gameplay 2D_)         |
| :----------------------------------------------------: | :--------------------------------------------: |
| ![Pilihan Level](assets/screenshots/pilihan_level.png) | ![Gameplay](assets/screenshots/main_arena.png) |

|            Interaksi Kuis Pemrograman #1             |            Interaksi Kuis Pemrograman #2             |
| :--------------------------------------------------: | :--------------------------------------------------: |
| ![Pop-up Kuis 1](assets/screenshots/main_arena1.png) | ![Pop-up Kuis 2](assets/screenshots/main_arena2.png) |

|               Dialog _Game Over_               |         Dialog Konfirmasi Keluar         |
| :--------------------------------------------: | :--------------------------------------: |
| ![Game Over](assets/screenshots/game_over.png) | ![Logout](assets/screenshots/logout.png) |

### 3. Pemilihan Karakter (_Hero Roster_) & Tantangan Harian

|               Karakter Aktif (Stevie)                |               Karakter Terkunci (Ada)                |
| :--------------------------------------------------: | :--------------------------------------------------: |
| ![Hero Roster 1](assets/screenshots/character_1.png) | ![Hero Roster 3](assets/screenshots/character_3.png) |

|                 Tantangan Harian & Klaim Koin                  |                   Daftar Misi Harian Lanjutan                   |
| :------------------------------------------------------------: | :-------------------------------------------------------------: |
| ![Tantangan Harian 1](assets/screenshots/tantangan_harian.png) | ![Tantangan Harian 2](assets/screenshots/tantangan_harian2.png) |

### 4. Modul Materi Pembelajaran Interaktif (_Clean Edutech_)

|                   Daftar Modul Pembelajaran                   |             Konsep Fundamental & Klasifikasi             |
| :-----------------------------------------------------------: | :------------------------------------------------------: |
| ![Daftar Materi](assets/screenshots/Materi_Pembelajaran7.png) | ![Materi 1](assets/screenshots/Materi_Pembelajaran1.png) |

|              Analogi Kehidupan Sehari-hari               |            Studi Kasus Kode & Output Terminal            |
| :------------------------------------------------------: | :------------------------------------------------------: |
| ![Materi 2](assets/screenshots/Materi_Pembelajaran2.png) | ![Materi 3](assets/screenshots/Materi_Pembelajaran3.png) |

|                   Bedah Potongan Kode                    |            Pertanyaan & Kunci Analisis Kritis            |
| :------------------------------------------------------: | :------------------------------------------------------: |
| ![Materi 4](assets/screenshots/Materi_Pembelajaran4.png) | ![Materi 6](assets/screenshots/Materi_Pembelajaran6.png) |

### 5. Pengaturan Sistem

|              Pengaturan Audio Global               |               Pengaturan Tampilan Layar               |
| :------------------------------------------------: | :---------------------------------------------------: |
| ![Setting Audio](assets/screenshots/setting_1.png) | ![Setting Tampilan](assets/screenshots/setting_2.png) |

|                Manajemen Data Progres                |              Informasi Tentang Aplikasi              |
| :--------------------------------------------------: | :--------------------------------------------------: |
| ![Setting Progres](assets/screenshots/setting_3.png) | ![Setting Tentang](assets/screenshots/setting_4.png) |

_(Catatan: Seluruh tangkapan layar di atas diambil langsung dari purwarupa aplikasi Code Hunter)._

---

## Teknologi yang Digunakan (Tech Stack)

- **Framework:** Flutter SDK (v3.47.1)
- **Bahasa Pemrograman:** Dart (v3.13.1)
- **2D Game Engine:** Flame Engine (`flame` & `flame_tiled`)
- **Level Design:** Tiled Map Editor (`.tmx`)
- **Audio Engine:** `audioplayers` (dengan kustomisasi _Singleton Audio Ducking_)
- **Target Platform:** Android

---

## Struktur Direktori Proyek

```text
code_hunter/
├── assets/
│   ├── audio/                # Berkas musik latar (BGM) dan efek suara (SFX .mp3)
│   ├── images/               # Aset latar belakang, karakter (char_1 - char_8), musuh, & item
│   ├── screenshots/          # Dokumentasi tangkapan layar antarmuka aplikasi
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

## Langkah-Langkah Menjalankan Proyek

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
