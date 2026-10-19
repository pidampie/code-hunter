# 🤖 Deklarasi Transparansi Penggunaan Kecerdasan Buatan (AI Declaration)

Dokumen ini disusun sebagai bentuk transparansi akademik dalam proses pengembangan proyek aplikasi **Code Hunter** pada mata kuliah _Mobile Programming_[cite: 5, 10, 60].

- **Nama Mahasiswa:** Fida Enjellia Anggoroning Ayu[cite: 5, 10]
- **NPM:** 2413025034[cite: 5, 10]
- **Judul Proyek:** Code Hunter – Game Edukasi 2D Berbasis Android untuk Pembelajaran Fundamental Pemrograman bagi Siswa SMK PPLG[cite: 10, 12]

---

## 1. Daftar Alat Bantu AI yang Digunakan

Selama siklus pengembangan purwarupa sistem, alat bantu kecerdasan buatan yang digunakan meliputi[cite: 60]:

1. **Google Gemini:** Digunakan sebagai asisten diskusi arsitektur kode Flutter/Flame, _refactoring_ tata letak antarmuka (_Clean Edutech UI_), perancangan kelas utilitas audio, serta pengembangan struktur bank materi pembelajaran.
2. **Canva & Tiled Map Editor (Non-AI / Desain Manual):** Digunakan untuk merancang aset _landing page_, menyusun peta level ortogonal (`.tmx`), dan mengorganisasi aset visual karakter.

---

## 2. Pembagian Peran (Pemetaan Modul Manual vs Dibantu AI)

Berikut adalah pemetaan rincian kontribusi antara pengerjaan manual oleh pengembang dengan modul yang dioptimalkan menggunakan bantuan AI[cite: 60]:

| Komponen / Modul Sistem                      | Berkas Terkait                                                         | Peran Pengembang (Manual)                                                                                                                                           | Peran Bantuan AI                                                                                                                  |
| :------------------------------------------- | :--------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------------------------------------------- |
| **Perancangan Konsep, PRD, UML, & ERD**      | Dokumen Perancangan                                                    | **100% Manual:** Merumuskan masalah, tujuan pembelajaran, aturan permainan (5 nyawa, mekanisme _coding bug_), Use Case, Class, Sequence, Activity Diagram, dan ERD. | Membantu merapikan tata bahasa dokumentasi teknis.                                                                                |
| **Desain Level & Peta Permainan 2D**         | `assets/tiled/maps/Level1.tmx` s.d. `Level20.tmx`                      | **100% Manual:** Menyusun _tile layer_ (tanah, dekorasi, rintangan duri) serta meletakkan titik _Object_ (`PlayerSpawn`, `EnemySpawn`, `Coin`) di aplikasi Tiled.   | Memberikan saran alur duplikasi dan pemanggilan nama file `.tmx` secara dinamis berdasarkan indeks.                               |
| **Manajemen Aset & Konfigurasi Proyek**      | `pubspec.yaml`, `assets/images/`, `assets/audio/`                      | **Manual:** Mengumpulkan, memilah, mengubah nama 8 aset karakter, latar belakang, serta 9 berkas efek suara (`.mp3`).                                               | Membantu mengecek struktur indentasi registrasi _path_ aset pada `pubspec.yaml`.                                                  |
| **Inti Mesin Permainan & Fisika Pemain**     | `code_hunter_game.dart`, `player_component.dart`, `game_elements.dart` | **Kolaboratif (Manual & AI):** Mengatur parameter kecepatan gerak, gaya gravitasi, tinggi lompatan, posisi kamera, dan logika permainan.                            | Membantu menyusun kerangka awal _collision callback_ AABB dan kelas `NormalizedAssetBundle` untuk memuat _path_ Tiled.            |
| **Antarmuka Pengguna (UI Screens) & Materi** | `lib/screens/*.dart`                                                   | **Kolaboratif (Manual & AI):** Menentukan struktur navigasi halaman, alur pembukaan level/modul, tema warna, serta uji coba tampilan pada perangkat.                | Membantu menghasilkan struktur _widget_ kartu horizontal, efek _BackdropFilter_, serta draf teks studi kasus pada 8 modul materi. |
| **Sistem Audio & Efek Suara**                | `lib/utils/audio_manager.dart`, `main.dart`                            | **Kolaboratif (Manual & AI):** Menentukan skenario pemicu 9 efek suara dan menguji kecocokan waktu bunyi pada setiap aksi permainan.                                | Membantu membuat kerangka kelas _Singleton_ `AudioManager` dengan fitur _audio ducking_.                                          |

---

## 3. Studi Kasus Prompting dan Penyesuaian Logika Manual

Berikut adalah 2 studi kasus nyata selama pengembangan proyek yang menunjukkan proses _prompting_, kelemahan/galat dari hasil awal AI, serta perbaikan manual yang dilakukan pengembang agar aplikasi berjalan stabil[cite: 60]:

---

### 📌 Studi Kasus 1: Implementasi Sistem Audio Global & Penanganan _Blank Screen_ / _Audio Context_

#### **A. Instruksi (_Prompt_) yang Digunakan:**

> _"Itu aku sudah dapat beberapa song-nya dan sound effect-nya (coin.mp3, eror.mp3, fail.mp3, hurt.mp3, Intro Theme.mp3, jump.mp3, succes game.mp3, UI Click.mp3, win.mp3). Tolong integrasikan dengan kode. Untuk Intro Theme.mp3 diputar berulang-ulang kali saat sistemnya dimainkan, namun ketika ada sound effect yang berbunyi maka sound tersebut akan meredup atau kecil."_

#### **B. Hasil Awal dari AI & Kendala/Galat yang Muncul:**

Pada iterasi awal, AI menyarankan pemanggilan `await AudioManager.instance.init()` dan `await AudioManager.instance.startBgm()` secara langsung (sinkron-blokir) di dalam fungsi `void main()` sebelum `runApp(const MyApp())` dieksekusi, serta menempatkan pemanggilan suara tabrakan langsung di dalam fungsi `takeDamage()`.
Ketika kode tersebut dijalankan, muncul **dua masalah serius**:

1. **Layar Putih (_White Blank Screen_) saat Aplikasi Dijalankan:** Pemanggilan `await startBgm()` di dalam `main()` memblokir _main thread_ Flutter ketika kebijakan platform menolak _autoplay_ sebelum ada interaksi sentuhan pengguna, sehingga antarmuka `LandingPageScreen` gagal dirender[cite: 51, 52].
2. **Suara Bertumpuk (_Overlapping SFX_) saat Salah Menjawab Kuis:** Karena fungsi `takeDamage()` juga dipanggil ketika pemain salah menjawab kuis di `game_screen.dart`, menaruh `playHurt()` di dalam `takeDamage()` menyebabkan suara `eror.mp3` dan `hurt.mp3` berbunyi secara bersamaan sehingga audio terdengar berisik.

#### **C. Penyesuaian & Perbaikan Manual yang Dilakukan:**

1. **Memisahkan Inisialisasi Audio dari Render UI Utama (`main.dart`):**
   Saya membungkus proses inisialisasi audio menggunakan blok `try-catch` non-pemblokir dan memindahkan pemicu `startBgm()` ke dalam _widget_ `Listener` (`onPointerDown`), sehingga antarmuka aplikasi langsung tampil seketika dan musik latar berputar dengan aman tepat pada sentuhan pertama pengguna:
   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     try {
       await AudioManager.instance.init();
     } catch (e) {
       debugPrint("Audio init error: $e");
     }
     runApp(const MyApp());
   }
   ```
2. **Memisahkan Logika Suara Fisik vs Suara Kuis (`player_component.dart` & `game_screen.dart`):**
   Saya tidak menaruh `playHurt()` di dalam `takeDamage()`, melainkan memindahkannya secara spesifik ke dalam blok `onCollision` ketika objek pemain bersentuhan langsung dengan `TrapBlock` atau `EnemyComponent` (kondisi `!isHurt`). Dengan demikian, saat pemain salah menjawab soal kuis, hanya `eror.mp3` yang berbunyi; sedangkan saat menabrak monster secara fisik, `hurt.mp3` yang berbunyi.

---

### 📌 Studi Kasus 2: Perbaikan _Collision_ Karakter Menembus Tanah (_Anti-Mendelep_) & Galat Konstanta Ikon Materi

#### **A. Instruksi (_Prompt_) yang Digunakan:**

> _"Buatkan isi halaman materi pembelajaran yang lengkap dengan studi kasus kode, output terminal, dan pertanyaan berpikir kritis dengan tampilan profesional clean tanpa emotikon, serta perbaiki masalah karakter yang suka menembus tanah (mendelep) dan tampilan bawah yang terkena bottom overflow."_

#### **B. Hasil Awal dari AI & Kendala/Galat yang Muncul:**

1. **Galat Kompilasi Konstanta Ikon (`const_with_non_constant_argument`):**
   Saat menghasilkan kode `materi_screen.dart`, AI menuliskan nama ikon bawaan Flutter menggunakan gaya _PascalCase_ yang tidak valid di SDK Flutter, seperti `Icons.SubdirectoryArrowRight_rounded`, `Icons.PublishedWithChanges_rounded`, dan `Icons.FactCheck_rounded`. Hal ini menyebabkan VS Code menampilkan 23 pesan _error_ merah karena kompiler Dart tidak mengenali properti tersebut sebagai ekspresi `const`[cite: 54, 55].
2. **Masalah Deteksi Pijakan Tanah & _Layout Overflow_:**
   Pada logika awal `onCollision`, pengecekan tabrakan hanya memeriksa `if (other is GroundBlock)` tanpa memvalidasi posisi kaki pemain terhadap sisi atas balok tanah. Akibatnya, saat karakter menyentuh samping tanah, karakter ikut terdorong ke atas atau menembus tanah ketika gravitasi tinggi. Selain itu, pada layar beresolusi pendek, halaman `MainMenuScreen` mengalami _Bottom Overflow by 4.7 pixels_.

#### **C. Penyesuaian & Perbaikan Manual yang Dilakukan:**

1. **Koreksi Penamaan Ikon sesuai Standar _snake_case_ Flutter SDK:**
   Saya melakukan penelusuran (_debugging_) pada baris ke-1512 di `materi_screen.dart`[cite: 54, 55] dan memperbaiki seluruh penamaan ikon secara manual menjadi format _snake_case_ resmi Flutter, yaitu:
   - `Icons.subdirectory_arrow_right_rounded`
   - `Icons.published_with_changes_rounded`
   - `Icons.fact_check_rounded`
2. **Penyempurnaan Rumus Batas Pijakan Kaki (`player_component.dart`) & _Scroll Layout_:**
   Saya menyesuaikan logika perhitungan batas koordinat vertikal dan horizontal pada `onCollision` agar karakter hanya dianggap berpijak (`isOnGround = true`) ketika kecepatan jatuh `velocity.y >= 0` dan posisi `kakiPemain` berada tepat di rentang permukaan atas balok tanah (`atasTanah - 4` hingga `atasTanah + 12`):
   ```dart
   if (velocity.y >= 0 &&
       kakiPemain <= atasTanah + 12 &&
       kakiPemain > atasTanah - 4) {
     if (tengahPemain > kiriTanah - 8 && tengahPemain < kananTanah + 8) {
       position.y = atasTanah;
       velocity.y = 0;
       isOnGround = true;
     }
   }
   ```
   Untuk mengatasi _Bottom Overflow_, saya membungkus kolom utama pada `MainMenuScreen` menggunakan kombinasi `LayoutBuilder`, `SingleChildScrollView`, `ConstrainedBox`, dan `IntrinsicHeight` sehingga antarmuka dapat menyesuaikan berbagai ukuran layar perangkat Android secara elastis tanpa memotong elemen visual.
