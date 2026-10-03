import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'setting_screen.dart';

// Konfigurasi agar scroll horizontal bisa digeser bebas dengan mouse/trackpad di browser
class MouseDraggableScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

// Model Penjelasan Komponen Kode
class CodeTokenExplanation {
  final String token;
  final String role;
  final String description;

  const CodeTokenExplanation({
    required this.token,
    required this.role,
    required this.description,
  });
}

// Model Soal Kuis
class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

// Model Lengkap Materi
class MateriModel {
  final int id;
  final String badgeText;
  final String title;
  final String cuteHook;
  final String imagePath;
  final Color pastelColor;
  final String analogiSPOK;
  final String konsepMendalam;
  final List<String> checklistPoin;
  final String sourceCode;
  final List<CodeTokenExplanation> bedahSintaks;
  final String tipsBugLucu;
  final List<QuizQuestion> quizList;

  const MateriModel({
    required this.id,
    required this.badgeText,
    required this.title,
    required this.cuteHook,
    required this.imagePath,
    required this.pastelColor,
    required this.analogiSPOK,
    required this.konsepMendalam,
    required this.checklistPoin,
    required this.sourceCode,
    required this.bedahSintaks,
    required this.tipsBugLucu,
    required this.quizList,
  });
}

// ---------------------------------------------------------------------------
// DATABASE 8 MODUL LENGKAP & BERBOBOT
// ---------------------------------------------------------------------------
final List<MateriModel> bankMateriLengkap = [
  const MateriModel(
    id: 1,
    badgeText: 'LEVEL 01',
    title: 'Dasar Pemrograman',
    cuteHook: 'Gimana sih cara manusia ngobrol dan merintah komputer?',
    imagePath: 'assets/images/materi/card_1.png',
    pastelColor: Color(0xFF48CAE4),
    analogiSPOK: 'Instruktur penerbangan melatih calon pilot di dalam ruang simulator pesawat. Instruktur menyusun buku panduan penerbangan secara terperinci. Calon pilot mempelajari instrumen kokpit pesawat berdasarkan instruksi panduan. Pesawat simulator merespons tombol kemudi kokpit dengan akurasi mekanis mutlak. Komputer memproses baris instruksi kode pemrograman dengan prinsip kepatuhan serupa. Unit pemrosesan pusat mengeksekusi runtutan instruksi logis tanpa penafsiran subjektif.',
    konsepMendalam: 'Pemrograman komputer merupakan seni dan ilmu menyusun instruksi logis agar prosesor komputer mampu menyelesaikan suatu masalah secara otomatis.\n\nDi tingkat perangkat keras, komputer sebenarnya hanya memahami aliran listrik hidup (1) dan mati (0) yang disebut kode biner. Bahasa pemrograman modern hadir sebagai jembatan agar manusia bisa menulis instruksi menggunakan kata-kata bahasa Inggris sederhana.\n\nProgram penerjemah (Compiler) bertugas memeriksa kerapian tata bahasa kodemu lalu mengubahnya menjadi file biner siap jalan. Komputer selalu membaca instruksi baris demi baris dari urutan paling atas sampai urutan paling bawah.',
    checklistPoin: [
      'Alur Sekuensial: Komputer selalu menjalankan instruksi berurutan dari atas ke bawah.',
      'Sintaks Disiplin: Kesalahan satu simbol tanda baca bisa membuat kompilasi terhenti.',
      'Peran Compiler: Program penerjemah yang mengubah teks kodemu jadi bahasa biner mesin.',
      'Komentar Kode: Catatan tambahan pengembang yang tidak akan dieksekusi oleh komputer.',
    ],
    sourceCode: 'void main() {\n  // Menyapa dunia petualangan koding\n  print("Halo! Selamat datang di Code Hunter!");\n\n  // Menghitung target koin koding\n  int targetKoin = 50 * 2;\n  print("Target Koin Petualangan: \$targetKoin");\n}',
    bedahSintaks: [
      CodeTokenExplanation(
        token: 'void',
        role: 'Tipe Kembalian Kosong',
        description: 'Menandakan bahwa fungsi main() murni bekerja menjalankan perintah dan tidak melempar balik nilai angka/teks apa pun.',
      ),
      CodeTokenExplanation(
        token: 'main()',
        role: 'Gerbang Utama (Entry Point)',
        description: 'Pintu masuk wajib aplikasi. Komputer akan selalu mencari dan menjalankan fungsi bernama main() ini pertama kali.',
      ),
      CodeTokenExplanation(
        token: '{ ... }',
        role: 'Rumah Perintah (Scope)',
        description: 'Tanda kurung kurawal pembungkus. Semua baris instruksi yang ada di dalamnya adalah milik fungsi tersebut.',
      ),
      CodeTokenExplanation(
        token: '//',
        role: 'Komentar Pengembang',
        description: 'Coretan catatan pembuat kode. Komputer akan mengabaikan tulisan apa pun di belakang garis miring ganda ini.',
      ),
      CodeTokenExplanation(
        token: 'print(...)',
        role: 'Pencetak Layar Konsol',
        description: 'Perintah bawaan sistem untuk menampilkan teks atau isi wadah ke layar terminal keluaran.',
      ),
      CodeTokenExplanation(
        token: 'int targetKoin',
        role: 'Wadah Bilangan Bulat',
        description: 'Menyiapkan ruang di memori RAM khusus untuk menyimpan bilangan bulat berlabel targetKoin.',
      ),
      CodeTokenExplanation(
        token: ';',
        role: 'Titik Koma (Penutup Instruksi)',
        description: 'Tanda rem resmi. Memberitahu compiler bahwa satu kalimat perintah koding sudah selesai tuntas.',
      ),
    ],
    tipsBugLucu: 'Jangan lupa titik koma (;) di ujung baris! Sering kali kode merah berantakan hanya gara-gara satu titik koma mungil yang lupa kamu pasang.',
    quizList: [
      QuizQuestion(
        question: 'Bagaimana cara prosesor membaca instruksi kode secara umum?',
        options: [
          'Acak sesuka hati',
          'Berurutan dari atas ke bawah',
          'Mulai dari baris terbawah',
          'Hanya membaca baris genap',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Apa peran Compiler di dalam dunia pemrograman?',
        options: [
          'Mempercepat internet',
          'Menerjemahkan kode manusia jadi bahasa biner mesin',
          'Menghapus file sampah',
          'Mengganti wallpaper monitor',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Mengapa kita menulis kata "void" di depan main()?',
        options: [
          'Karena fungsinya rusak',
          'Karena fungsi ini tidak mengembalikan nilai apapun',
          'Agar kodingan berwarna ungu',
          'Khusus untuk game online',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question:
            'Tanda baca apakah yang wajib menutup sebuah pernyataan instruksi?',
        options: [
          'Titik dua (:)',
          'Titik koma (;)',
          'Tanda seru (!)',
          'Tanda tanya (?)',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question:
            'Bahasa mesin fisik yang dipahami langsung oleh CPU berbentuk...',
        options: [
          'Teks alfabet latin',
          'Bilangan biner 0 dan 1',
          'File audio lagu',
          'Format gambar PNG',
        ],
        correctIndex: 1,
      ),
    ],
  ),
  const MateriModel(
    id: 2,
    badgeText: 'LEVEL 02',
    title: 'Variabel & Identifier',
    cuteHook: 'Di mana ya komputer menyimpan angka dan nama pemain?',
    imagePath: 'assets/images/materi/card_2.png',
    pastelColor: Color(0xFFFFB703),
    analogiSPOK: 'Petugas gudang menempelkan label stiker bertuliskan "Kardus Sepatu" pada wadah penyimpanan barang. Petugas menyimpan tiga pasang sepatu olahraga ke dalam kardus tersebut. Pemilik toko mengambil satu pasang sepatu untuk pelanggan toko. Label wadah tetap bertuliskan "Kardus Sepatu" sepanjang waktu kerja. Jumlah isi barang di dalam kardus berubah sesuai transaksi penjualan. Variabel komputer menyimpan nilai data di dalam memori fisik dengan mekanisme kerja serupa.',
    konsepMendalam: 'Variabel adalah kotak penyimpanan ajaib di dalam memori RAM komputer yang kita beri nama pengenal unik (identifier).\n\nSaat aplikasi game berjalan, variabel bertugas mencatat hal-hal yang nilainya terus berubah, seperti sisa nyawa, jumlah peluru, nama avatar, dan skor saat ini.\n\nDalam standar industri perangkat lunak, nama variabel dianjurkan menggunakan pola camelCase: diawali huruf kecil, dan huruf pertama pada kata berikutnya menggunakan huruf besar tanpa spasi.',
    checklistPoin: [
      'Alokasi RAM: Deklarasi variabel berarti memesan ruang simpan kecil di memori komputer.',
      'Gaya camelCase: Penulisan rapi tanpa spasi, contoh: sisaDarahHero.',
      'Aturan Nama: Tidak boleh diawali angka dan tidak boleh menggunakan kata kunci sistem.',
      'Dinamis vs Konstan: Nilai variabel bisa diganti berkali-kali sepanjang petualangan game.',
    ],
    sourceCode: '// Menyiapkan toples skor awal pemain\nint skorPemain = 0;\n\n// Menambah skor saat pemain mengalahkan monster bug\nskorPemain = skorPemain + 150;\nprint("Total Skor Sekarang: \$skorPemain");',
    bedahSintaks: [
      CodeTokenExplanation(
        token: 'int',
        role: 'Tipe Wadah Bilangan',
        description: 'Meminta RAM membuat kotak khusus yang hanya boleh dimasuki bilangan bulat.',
      ),
      CodeTokenExplanation(
        token: 'skorPemain',
        role: 'Nama Pengenal (Identifier)',
        description: 'Nama toples yang kita buat dengan gaya camelCase agar mudah dipanggil ulang.',
      ),
      CodeTokenExplanation(
        token: '= 0',
        role: 'Pengisian Nilai Awal',
        description: 'Memasukkan angka 0 sebagai modal awal saat toples pertama kali dibikin.',
      ),
      CodeTokenExplanation(
        token: 'skorPemain = ...',
        role: 'Pembaruan Isi (Re-assignment)',
        description: 'Membuang nilai lama dan mengisi toples dengan nilai baru hasil penjumlahan.',
      ),
    ],
    tipsBugLucu: 'Jangan pakai nama variabel satu huruf seperti a, x, atau z! Nanti kalau kodinganmu sudah panjang ratusan baris, kamu bakal bingung sendiri apa isi variabel itu.',
    quizList: [
      QuizQuestion(
        question:
            'Manakah nama variabel yang paling rapi sesuai standar camelCase?',
        options: [
          'total_skor_hero',
          'TotalSkorHero',
          'totalSkorHero',
          '1totalSkor',
        ],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'Apa yang terjadi di memori komputer saat kita membuat variabel baru?',
        options: [
          'Sistem operasi memesan ruang simpan di RAM',
          'Harddisk langsung penuh',
          'Baterai laptop berkurang 10%',
          'Komputer mati mendadak',
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'Mengapa kata "class" atau "void" dilarang dipakai sebagai nama variabel?',
        options: [
          'Karena terlalu pendek',
          'Karena kata khusus milik sistem bahasa koding',
          'Karena artinya jelek',
          'Karena hanya boleh untuk huruf besar',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Jika int apel = 5; lalu apel = apel + 3; berapa isi variabel apel sekarang?',
        options: ['5', '3', '8', '53'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'Variabel yang cuma bisa diakses di dalam satu fungsi saja disebut variabel...',
        options: [
          'Variabel Bebas',
          'Variabel Lokal',
          'Variabel Gaib',
          'Variabel Publik',
        ],
        correctIndex: 1,
      ),
    ],
  ),
  const MateriModel(
    id: 3,
    badgeText: 'LEVEL 03',
    title: 'Klasifikasi Tipe Data',
    cuteHook: 'Ada jenis data apa saja sih di dunia komputer kita?',
    imagePath: 'assets/images/materi/card_3.png',
    pastelColor: Color(0xFFC77DFF),
    analogiSPOK: 'Pengemudi truk memilah muatan barang ke dalam ruang kargo kendaraan logistik. Pengemudi menuangkan cairan bensin ke dalam tangki bahan bakar tertutup. Pengemudi menata balok kayu padat di atas bak terbuka truk. Kasir menyerahkan dokumen surat jalan bercetak kertas kepada pengemudi. Komputer menyediakan wadah memori khusus untuk setiap ragam data digital dengan tata kelola serupa.',
    konsepMendalam: 'Tipe data memberitahu komputer mengenai jenis barang apa yang disimpan di dalam variabel, serta operasi apa saja yang boleh dilakukan padanya.\n\nKomputer membedakan angka bulat (Integer), angka desimal berkoma (Double), kumpulan huruf teks (String), dan saklar kondisi benar/salah (Boolean).\n\nSistem tipe data yang disiplin (Type Safety) menjaga game dari bug aneh, misalnya mencegah teks nama karakter tidak sengaja dikalikan dengan angka nyawa.',
    checklistPoin: [
      'Integer (int): Khusus bilangan bulat tanpa koma, misalnya jumlah koin atau sisa nyawa.',
      'Double (double): Khusus bilangan desimal berkoma presisi, misalnya koordinat posisi atau kecepatan lari.',
      'String (String): Khusus teks bacaan yang wajib diapit tanda petik, misalnya nama hero.',
      'Boolean (bool): Saklar logika yang cuma punya 2 pilihan: true (hidup/aktif) atau false (mati).',
    ],
    sourceCode: '// Atribut karakter petualang cilik\nString namaHero = "Koder Pintar";\nint totalNyawa = 3;\ndouble kecepatanLari = 4.5;\nbool statusKebal = true;\n\nprint("Hero: \$namaHero | Nyawa: \$totalNyawa");',
    bedahSintaks: [
      CodeTokenExplanation(
        token: 'String namaHero',
        role: 'Tipe Data Teks',
        description: 'Menyimpan rangkaian huruf teks. Wajib diapit dengan tanda petik ganda atau tunggal.',
      ),
      CodeTokenExplanation(
        token: 'int totalNyawa',
        role: 'Tipe Bilangan Bulat',
        description: 'Menyimpan angka bulat diskret tanpa pecahan desimal di belakang koma.',
      ),
      CodeTokenExplanation(
        token: 'double kecepatanLari',
        role: 'Tipe Bilangan Pecahan',
        description: 'Menyimpan angka desimal menggunakan titik koma presisi untuk pergerakan halus physics game.',
      ),
      CodeTokenExplanation(
        token: 'bool statusKebal',
        role: 'Tipe Saklar Logika',
        description: 'Hanya bernilai true atau false, penentu apakah hero sedang dalam mode tak terkalahkan.',
      ),
    ],
    tipsBugLucu: 'Ingat! Angka 10 berbeda dengan teks "10". Kalau kamu menjalankan "10" + "20", hasilnya adalah "1020" (disambung), bukan 30!',
    quizList: [
      QuizQuestion(
        question: 'Tipe data apa yang paling pas untuk menyimpan kecepatan lari 7.25 meter/detik?',
        options: ['int', 'double', 'String', 'bool'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Berapakah hasil dari eksekusi kode teks "50" + "50"?',
        options: ['100', '"5050"', '0', 'Error'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Variabel boolean (bool) hanya memiliki dua kemungkinan nilai, yaitu...',
        options: ['1 dan 2', 'true dan false', 'on dan off', 'yes dan no'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Penulisan data teks String yang sah wajib diapit tanda...',
        options: [
          'Kurung siku [ ]',
          'Tanda petik " "',
          'Kurung kurawal { }',
          'Garis miring / /',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Apa manfaat fitur Type Safety pada bahasa koding modern?',
        options: [
          'Bikin kodingan makin lemot',
          'Mencegah operasi data salah yang bikin aplikasi crash',
          'Bikin warna font jadi ungu',
          'Menghemat pulsa internet',
        ],
        correctIndex: 1,
      ),
    ],
  ),
  const MateriModel(
    id: 4,
    badgeText: 'LEVEL 04',
    title: 'Operator & Logika',
    cuteHook: 'Gimana sih cara komputer berhitung dan membandingkan?',
    imagePath: 'assets/images/materi/card_4.png',
    pastelColor: Color(0xFFFB8500),
    analogiSPOK: 'Petugas pos memeriksa kelengkapan berkas pemohon di loket pendaftaran paspor. Petugas mencocokkan kartu tanda penduduk pemohon dengan akta kelahiran asli. Petugas memverifikasi usia pemohon melebihi batas tujuh belas tahun. Sistem loket menerbitkan nomor antrean wawancara kepada pemohon yang memenuhi syarat. Komputer mengevaluasi sekumpulan relasi logika sebelum mengambil tindakan komputasi dengan prinsip kerja serupa.',
    konsepMendalam: 'Operator adalah simbol ajaib yang memerintahkan komputer melakukan perhitungan matematika atau perbandingan logika.\n\nKategori operator terpenting dalam game programming:\n1. Operator Aritmatika (+, -, *, /, %) untuk hitungan skor dan pengurangan peluru.\n2. Operator Relasi (==, !=, >, <, >=, <=) untuk menguji kondisi dan menghasilkan nilai true/false.\n3. Operator Logika Gabungan (&& AND, || OR, ! NOT) untuk menyatukan beberapa syarat permainan.',
    checklistPoin: [
      'Prioritas Hitung: Perkalian dan pembagian selalu dihitung lebih dulu daripada penjumlahan.',
      'Sisa Bagi (%): Mengambil sisa pembagian bilangan bulat (misal: 10 % 3 = 1).',
      'Logika AND (&&): Semua syarat harus bernilai benar agar aksinya bisa jalan.',
      'Logika OR (||): Cukup salah satu syarat yang benar, aksi sudah bisa langsung jalan.',
    ],
    sourceCode: 'int peluruLaser = 5;\nbool musuhDekat = true;\n\n// Menembak hanya jika peluru ada DAN musuh terdeteksi\nif (peluruLaser > 0 && musuhDekat == true) {\n  print("Tembak Coding Bug! Dor!");\n  peluruLaser--; // Kurangi 1 peluru secara kilat\n}',
    bedahSintaks: [
      CodeTokenExplanation(
        token: 'peluruLaser > 0',
        role: 'Perbandingan Relasi',
        description: 'Memeriksa apakah jumlah amunisi pemain lebih besar dari angka nol.',
      ),
      CodeTokenExplanation(
        token: '&&',
        role: 'Logika AND (Wajib Keduanya)',
        description: 'Menuntut kedua syarat terpenuhi sekaligus: peluru masih ada DAN musuh terdeteksi.',
      ),
      CodeTokenExplanation(
        token: 'musuhDekat == true',
        role: 'Penguji Kesetaraan',
        description: 'Dua tanda sama dengan (==) untuk mengecek apakah statusnya benar tanpa mengubah nilai.',
      ),
      CodeTokenExplanation(
        token: 'peluruLaser--',
        role: 'Pengurangan Cepat (Decrement)',
        description: 'Cara kilat koder untuk memotong nilai variabel sebesar 1 angka secara instan.',
      ),
    ],
    tipsBugLucu: 'Awas tertukar! Satu tanda sama dengan (=) artinya MEMASUKKAN nilai, sedangkan dua tanda sama dengan (==) artinya MEMBANDINGKAN nilai!',
    quizList: [
      QuizQuestion(
        question: 'Berapakah sisa bagi dari operasi matematika 14 % 4?',
        options: ['3', '2', '0', '3.5'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Simbol manakah yang digunakan untuk mengecek apakah dua nilai itu SAMA?',
        options: ['=', '==', '!=', ':='],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Jika syarat A = true dan syarat B = false, berapakah hasil dari (A && B)?',
        options: ['true', 'false', 'null', 'error'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Simbol || dalam pemrograman melambangkan operator logika...',
        options: ['AND', 'OR', 'NOT', 'XOR'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Operator tanda seru (!) bertugas sebagai pembalik logika, maka !false adalah...',
        options: ['false', 'true', 'null', '0'],
        correctIndex: 1,
      ),
    ],
  ),
  const MateriModel(
    id: 5,
    badgeText: 'LEVEL 05',
    title: 'Percabangan (IF-ELSE)',
    cuteHook: 'Kiri atau kanan? Gimana cara program mengambil keputusan?',
    imagePath: 'assets/images/materi/card_5.png',
    pastelColor: Color(0xFFFF70A6),
    analogiSPOK: 'Masinis kereta api memperhatikan sinyal lentera wesel di persimpangan stasiun. Lentera persimpangan memancarkan pendar cahaya merah pekat. Masinis menarik tuas rem darurat kereta secara seketika. Kereta api berhenti sempurna di depan batas peron stasiun. Program komputer mengalihkan alur eksekusi berdasarkan evaluasi kondisi parameter sistem dengan disiplin ketat serupa.',
    konsepMendalam: 'Percabangan (Control Flow Decision) adalah kecerdasan komputer untuk memilih jalan mana yang harus diambil berdasarkan situasi yang sedang dihadapi.\n\nTanpa percabangan, game akan berjalan membosankan karena tidak bisa merespons aksi pemain sama sekali.\n\nStruktur dasarnya meliputi IF (jika syarat terpenuhi), ELSE IF (jika syarat lain yang cocok), dan ELSE (jalur cadangan terakhir jika semua syarat di atas tidak ada yang berhasil).',
    checklistPoin: [
      'Kondisi Benar: Blok di dalam kurung kurawal IF hanya dijalankan jika syarat bernilai true.',
      'Jalur Cadangan: Blok ELSE akan otomatis dieksekusi jika semua syarat di atasnya gagal.',
      'Switch-Case: Pilihan alternatif yang sangat rapi untuk mengecek banyak pilihan nilai pasti.',
      'Urutan Pengecekan: Komputer selalu menguji cabang dari paling atas ke paling bawah.',
    ],
    sourceCode: 'int nilaiDarah = 0;\n\nif (nilaiDarah <= 0) {\n  print("Yah, karaktermu gugur! Coba lagi ya!");\n} else if (nilaiDarah < 30) {\n  print("Awas! Darah sekarat, segera minum potion!");\n} else {\n  print("Semangat! Kondisi karakter masih prima!");\n}',
    bedahSintaks: [
      CodeTokenExplanation(
        token: 'if (nilaiDarah <= 0)',
        role: 'Ujian Syarat Pertama',
        description:
            'Komputer mengecek apakah darah sudah habis menyentuh angka nol.',
      ),
      CodeTokenExplanation(
        token: 'else if (...)',
        role: 'Ujian Syarat Cadangan',
        description: 'Hanya diperiksa jika syarat pertama di atas tadi ternyata belum terpenuhi.',
      ),
      CodeTokenExplanation(
        token: 'else { ... }',
        role: 'Penyelamat Terakhir',
        description: 'Dijalankan otomatis jika semua kondisi di atas ternyata tidak ada yang cocok.',
      ),
    ],
    tipsBugLucu: 'Letakkan kondisi yang paling spesifik di paling atas! Kalau kondisi yang terlalu umum ditaruh di awal, kode di bawahnya tidak akan pernah tersentuh.',
    quizList: [
      QuizQuestion(
        question:
            'Kapan baris kode di dalam kurung kurawal IF akan dijalankan?',
        options: [
          'Saat syaratnya salah',
          'Saat syaratnya bernilai true (benar)',
          'Hanya saat laptop mati',
          'Setiap kali file dibuka',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Apa tugas utama blok ELSE?',
        options: [
          'Menghapus semua kodingan',
          'Jalur penyelamat jika semua IF di atasnya gagal',
          'Mengulang kode 10 kali',
          'Menutup browser otomatis',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Kapan struktur switch-case lebih asyik dipakai dibanding if-else bertingkat?',
        options: [
          'Saat mencocokkan banyak pilihan nilai pasti',
          'Saat menghitung rumus fisika rumit',
          'Saat tidak ada kondisi',
          'Hanya untuk menggambar animasi',
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'Berapa banyak blok ELSE yang boleh ada pada satu untaian rangkaian IF?',
        options: [
          'Maksimal 1 di ujung akhir',
          'Boleh sebanyak yang dimau',
          'Harus selalu 5',
          'Tergantung RAM laptop',
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'Tanda kurung kurawal { } di percabangan bertugas untuk...',
        options: [
          'Hiasan teks semata',
          'Membatasi rumah baris instruksi',
          'Menyimpan gambar',
          'Membuat komentar',
        ],
        correctIndex: 1,
      ),
    ],
  ),
  const MateriModel(
    id: 6,
    badgeText: 'LEVEL 06',
    title: 'Perulangan (Looping)',
    cuteHook: 'Kenapa harus muter-muter? Biar tugas ribet selesai otomatis!',
    imagePath: 'assets/images/materi/card_6.png',
    pastelColor: Color(0xFF06D6A0),
    analogiSPOK: 'Instruktur senam menghitung ritme gerakan tubuh peserta di lapangan olahraga. Instruktur menginstruksikan sepuluh kali gerakan lompat kepada peserta senam. Peserta melakukan gerakan lompat pertama secara serempak. Peserta menambah satu hitungan putaran gerakan setelah mendarat di matras senam. Peserta menghentikan seluruh aktivitas lompat saat hitungan mencapai angka sepuluh. Perulangan komputer mengeksekusi sekumpulan instruksi otomatis dengan mekanisme penghitungan serupa.',
    konsepMendalam: 'Perulangan atau looping adalah kemampuan sakti komputer untuk mengulang sekumpulan tugas yang sama berkali-kali tanpa rasa lelah dan tanpa salah.\n\nDi dunia programming, kita punya prinsip DRY (Don\'t Repeat Yourself): jangan pernah mengetik baris yang sama berkali-kali secara manual jika bisa diulang otomatis menggunakan loop.\n\nAda FOR loop (jika jumlah putaran sudah kita ketahui pasti), WHILE loop (berputar selama syarat masih berlaku), dan DO-WHILE (menjalankan tugas minimal satu kali dulu sebelum menguji syarat di akhir).',
    checklistPoin: [
      'Hitungan Pasti: FOR loop paling pas dipakai jika jumlah putarannya sudah jelas dari awal.',
      'Variabel Pencacah: Variabel i bertugas mencatat sudah berapa putaran yang dilewati.',
      'Syarat Berhenti: Batas akhir yang wajib dipasang agar perulangan tahu kapan harus setop.',
      'Awas Infinite Loop: Jangan lupa memperbarui hitungan agar komputermu tidak macet berputar selamanya!',
    ],
    sourceCode: '// Memunculkan 5 monster bug ke arena secara otomatis\nfor (int i = 1; i <= 5; i++) {\n  print("Monster Bug ke-\$i muncul ke arena!");\n}\n\n// Menembak musuh sampai energi habis\nint energi = 3;\nwhile (energi > 0) {\n  print("Tembak laser! Sisa energi: \$energi");\n  energi--; // Kurangi energi biar loop bisa berhenti\n}',
    bedahSintaks: [
      CodeTokenExplanation(
        token: 'int i = 1',
        role: 'Titik Awal Hitungan',
        description: 'Memulai hitungan putaran dari angka 1.',
      ),
      CodeTokenExplanation(
        token: 'i <= 5',
        role: 'Batas Syarat Henti',
        description: 'Perulangan akan terus berjalan selama angka i belum melewati angka 5.',
      ),
      CodeTokenExplanation(
        token: 'i++',
        role: 'Langkah Tambahan',
        description: 'Setiap kali satu putaran selesai, angka i dinaikkan 1 secara otomatis.',
      ),
      CodeTokenExplanation(
        token: 'energi--',
        role: 'Pengurang Syarat While',
        description: 'Mengurangi sisa energi agar perulangan while punya titik henti saat energi jadi 0.',
      ),
    ],
    tipsBugLucu: 'Bahaya "Infinite Loop"! Kalau di dalam WHILE loop kamu lupa menulis pengurang (seperti energi--), komputermu bakal berputar tanpa henti sampai aplikasimu freeze!',
    quizList: [
      QuizQuestion(
        question: 'Jenis perulangan mana yang paling cocok kalau jumlah putarannya sudah diketahui pasti?',
        options: ['WHILE loop', 'FOR loop', 'DO-WHILE loop', 'IF loop'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Apa sebutan untuk kecelakaan koding saat perulangan berjalan selamanya tanpa bisa henti?',
        options: ['Infinite Loop', 'Happy Loop', 'Super Loop', 'Magic Loop'],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'Pada kode for (int i = 0; i < 3; i++), berapa kali perulangan dijalankan?',
        options: ['1 kali', '2 kali', '3 kali', '4 kali'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'Apa keistimewaan DO-WHILE dibanding WHILE biasa?',
        options: [
          'Lebih lambat',
          'Menjalankan kodenya minimal 1 kali dulu',
          'Tidak butuh memori',
          'Hanya untuk angka ganjil',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Kata kunci apakah yang bisa memaksa perulangan berhenti seketika saat itu juga?',
        options: ['continue', 'break', 'stop', 'exit'],
        correctIndex: 1,
      ),
    ],
  ),
  const MateriModel(
    id: 7,
    badgeText: 'LEVEL 07',
    title: 'Array & List Data',
    cuteHook: 'Gimana cara merapikan antrean barang berderet dari nomor 0?',
    imagePath: 'assets/images/materi/card_7.png',
    pastelColor: Color(0xFF118AB2),
    analogiSPOK: 'Pustakawan menata buku cerita di dalam lemari loker perpustakaan sekolah. Pustakawan menomori pintu laci loker mulai dari nomor urut nol. Pustakawan memasukkan buku komik petualangan ke dalam laci nomor nol perpustakaan. Siswa mengambil buku komik melalui nomor indeks laci yang tertera. Komputer mengelola sekumpulan elemen data sejenis melalui penataan indeks memori berurutan dengan kaidah serupa.',
    konsepMendalam: 'Array atau List adalah laci loker berderet rapi yang menampung banyak data sejenis di dalam satu nama variabel saja.\n\nHal paling unik di dunia koding adalah aturan Zero-Based Indexing: laci pertama komputer selalu diberi nomor urut 0 (bukan nomor 1!).\n\nJika kamu punya 3 data di dalam list, nomor lacinya adalah 0, 1, dan 2. Kamu bisa mengambil, mengubah, atau menambahkan barang baru ke dalam list kapan saja.',
    checklistPoin: [
      'Nomor Urut dari 0: Laci elemen pertama selalu berada di indeks ke-0.',
      'Properti .length: Fitur bawaan untuk menghitung ada berapa total barang di dalam list.',
      'Laci Terakhir: Elemen paling belakang selalu berada di nomor (panjang list - 1).',
      'Metode .add(): Perintah gampang untuk memasukkan barang baru ke antrean paling belakang.',
    ],
    sourceCode: '// Laci tas petualang berisi nama monster\nList<String> daftarBug = ["Bug Sintaks", "Bug Logika", "Null Error"];\n\n// Mengambil monster pertama dari laci nomor 0\nprint("Target Utama: " + daftarBug[0]); // Output: Bug Sintaks\n\n// Menambahkan monster baru ke laci paling belakang\ndaftarBug.add("Infinite Loop");\nprint("Total Monster di Tas: \${daftarBug.length}");',
    bedahSintaks: [
      CodeTokenExplanation(
        token: 'List<String>',
        role: 'Deklarasi Wadah Deret',
        description:
            'Membuat loker khusus yang semua isinya harus berupa teks String.',
      ),
      CodeTokenExplanation(
        token: 'daftarBug[0]',
        role: 'Buka Laci Indeks',
        description: 'Membuka dan mengambil isi data yang tersimpan di laci pertama (nomor 0).',
      ),
      CodeTokenExplanation(
        token: '.add(...)',
        role: 'Masukkan Barang Baru',
        description: 'Perintah otomatis untuk menitipkan data baru ke posisi paling akhir antrean.',
      ),
      CodeTokenExplanation(
        token: '.length',
        role: 'Penghitung Isi Loker',
        description: 'Menghitung secara kilat berapa banyak total barang yang sedang ada di dalam list.',
      ),
    ],
    tipsBugLucu: 'Awas kena jebakan IndexOutOfBounds! Kalau lokermu cuma punya 3 barang, laci terbesarnya adalah nomor 2. Jangan coba-coba memanggil daftarBug[3] ya!',
    quizList: [
      QuizQuestion(
        question: 'Nomor indeks berapakah yang selalu disematkan pada elemen urutan PERTAMA?',
        options: [
          'Indeks ke-1',
          'Indeks ke-0',
          'Indeks ke-(-1)',
          'Indeks bebas',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Jika sebuah List punya 5 item, berapakah nomor indeks untuk elemen TERAKHIR?',
        options: ['5', '4', '3', '6'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Eror apakah yang muncul jika kita memanggil nomor indeks yang melebihi batas list?',
        options: [
          'IndexOutOfBoundsException',
          'NullPointer',
          'OutOfMemory',
          'BatteryLow',
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'Properti apa yang dipakai untuk mengecek jumlah barang di dalam list?',
        options: ['size', 'count', 'length', 'total'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'Perintah apakah yang digunakan untuk menambah barang baru ke ujung list?',
        options: ['push()', 'insert()', 'add()', 'append()'],
        correctIndex: 2,
      ),
    ],
  ),
  const MateriModel(
    id: 8,
    badgeText: 'LEVEL 08',
    title: 'Debugging & Membasmi Bug',
    cuteHook: 'Hayo, siapa monster serangga kecil perusak kodinganmu?',
    imagePath: 'assets/images/materi/card_8.png',
    pastelColor: Color(0xFFEF476F),
    analogiSPOK: 'Seorang mekanik memeriksa rangkaian kabel pengapian pada sepeda motor mogok. Mekanik mengukur tegangan baterai motor menggunakan alat voltmeter presisi. Mekanik menemukan soket kabel kelistrikan longgar di bawah rangka motor. Mekanik mengencangkan baut soket kabel yang kendur menggunakan obeng bengkel. Mesin sepeda motor menyala normal kembali di bengkel servis. Pengembang perangkat lunak menelusuri kerusakan baris instruksi program dengan ketelitian sistematis serupa.',
    konsepMendalam: 'Debugging adalah seni menjadi detektif untuk melacak, mengisolasi, dan membasmi bug (kesalahan kode) sampai aplikasimu berjalan mulus kembali.\n\n3 Jenis Eror yang Sering Dihadapi Koder:\n1. Syntax Error: Salah tata bahasa koding (misal: kurang tanda kurung atau titik koma), langsung ditandai garis merah oleh VS Code.\n2. Runtime Error: Aplikasi mogok tiba-tiba saat sedang dimainkan (misal: membagi angka dengan nol).\n3. Logic Error: Aplikasi lancar tanpa pesan eror sama sekali, tetapi hasil perhitungannya salah!',
    checklistPoin: [
      'Baca Pesan Eror: Terminal selalu memberi tahu nama file dan nomor baris letak kesalahanmu.',
      'Gunakan Print Tracing: Pasang print() berkala untuk mengintip isi variabel saat game jalan.',
      'Sabar & Teliti: Detektif koding memeriksa kode langkah demi langkah tanpa panik.',
      'Try-Catch: Perisai penyelamat untuk menangkap eror agar aplikasi tidak mendadak force-close.',
    ],
    sourceCode: '// Contoh jebakan Logic Error pada rumus rata-rata nilai\nint nilaiTeori = 80;\nint nilaiPraktik = 90;\n\n// KESALAHAN: pembagian jalan duluan tanpa tanda kurung!\n// double salah = nilaiTeori + nilaiPraktik / 2; // Hasil: 125 (Keliru!)\n\n// PERBAIKAN: gunakan kurung agar penjumlahan dihitung dulu\ndouble nilaiBenar = (nilaiTeori + nilaiPraktik) / 2;\nprint("Hasil Nilai Rata-rata Valid: \$nilaiBenar"); // Hasil: 85.0',
    bedahSintaks: [
      CodeTokenExplanation(
        token: '(nilaiTeori + ...)',
        role: 'Tanda Kurung Prioritas',
        description: 'Memaksa komputer menjumlahkan kedua nilai terlebih dahulu sebelum dibagi.',
      ),
      CodeTokenExplanation(
        token: '/ 2',
        role: 'Pembagi Komponen',
        description:
            'Membagi total jumlah nilai dengan kuantitas komponen pengujian.',
      ),
      CodeTokenExplanation(
        token: 'double nilaiBenar',
        role: 'Penampung Desimal',
        description:
            'Wadah pecahan agar angka di belakang koma tidak hilang terpotong.',
      ),
    ],
    tipsBugLucu: 'Kalau terminalmu memunculkan tulisan merah tebal, jangan panik atau buru-buru tutup editor! Tarik napas, lalu baca baris paling atas dari tulisan merah itu.',
    quizList: [
      QuizQuestion(
        question: 'Eror mana yang paling gampang ketahuan karena langsung digarisbawahi merah oleh IDE?',
        options: [
          'Logic Error',
          'Syntax Error',
          'Internet Timeout',
          'Hardware Error',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Game berjalan lancar tanpa crash, tapi skor pemain selalu bertambah salah. Ini contoh dari...',
        options: [
          'Runtime Error',
          'Logic Error',
          'Syntax Error',
          'Compilation Error',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Cara paling sederhana dan ampuh yang sering dipakai koder untuk melacak variabel adalah...',
        options: [
          'Memasang print statement di kode',
          'Menghapus seluruh proyek',
          'Membeli laptop baru',
          'Mematikan Wi-Fi',
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'Kapan Runtime Error terjadi pada sebuah aplikasi?',
        options: [
          'Sebelum kode diketik',
          'Saat aplikasi sedang berjalan dimainkan',
          'Saat laptop dimatikan',
          'Hanya saat kompilasi',
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Perintah apakah yang digunakan untuk menangkap eror agar aplikasi tidak force close?',
        options: ['if - else', 'try - catch', 'for - in', 'while - loop'],
        correctIndex: 1,
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// SCREEN UTAMA: BUKU PETUALANGAN MATERI (CUTE PIXEL GAME UI)
// ---------------------------------------------------------------------------
class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  int _activeCardIndex = 0;
  final Set<int> _unlockedModules = {1};
  final Set<int> _completedModules = {};

  void _onModuleCompleted(int moduleId) {
    setState(() {
      _completedModules.add(moduleId);
      if (moduleId < bankMateriLengkap.length) {
        _unlockedModules.add(moduleId + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Rimba Alami
          Image.asset('assets/images/bg/bg_jungle.png', fit: BoxFit.cover),

          // Lapisan Gelap Hangat Lembut
          Container(color: const Color(0xFF161824).withOpacity(0.88)),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar Navigasi Bergaya Retro Game
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    children: [
                      // Tombol Kembali Berbentuk Tombol Pixel Bouncy
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD166),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 2.5),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 3),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'KEMBALI',
                                style: GoogleFonts.pressStart2p(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),

                      // Judul Utama yang Lucu & Ramah
                      Row(
                        children: [
                          const Text('🎒 ', style: TextStyle(fontSize: 18)),
                          Text(
                            'PETUALANGAN KODING',
                            style: GoogleFonts.pressStart2p(
                              fontSize: 13,
                              letterSpacing: 1.5,
                              color: const Color(0xFFFFD166),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Lencana Progres Bintang Lucu
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26293D),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFFFD166),
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(2, 2),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('⭐ ', style: TextStyle(fontSize: 13)),
                            Text(
                              'MISI TERBUKA: ${_completedModules.length} / ${bankMateriLengkap.length}',
                              style: GoogleFonts.pressStart2p(
                                fontSize: 8.5,
                                color: const Color(0xFFFFD166),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Hint Lucu Geser Kartu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    children: [
                      const Text('🐾', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 6),
                      Text(
                        'GESER KARTU KE KANAN & KIRI UNTUK MEMILIH TANTANGAN',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Horizontal Carousel Kartu Lucu (16:9 Utuh, Semua Foto Terang)
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MouseDraggableScrollBehavior(),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: bankMateriLengkap.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 18),
                      itemBuilder: (context, index) {
                        final item = bankMateriLengkap[index];
                        final isUnlocked = _unlockedModules.contains(item.id);
                        final isCompleted = _completedModules.contains(item.id);
                        final isActive = _activeCardIndex == index;

                        return _CutePixelCardTile(
                          item: item,
                          isActive: isActive,
                          isUnlocked: isUnlocked,
                          isCompleted: isCompleted,
                          onHover: () {
                            setState(() => _activeCardIndex = index);
                          },
                          onTap: () {
                            setState(() => _activeCardIndex = index);
                            if (!isUnlocked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: const Color(0xFFEF476F),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  content: Row(
                                    children: [
                                      const Text(
                                        '🔒 ',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Selesaikan level sebelumnya dulu ya untuk membuka materi ini!',
                                          style: GoogleFonts.pressStart2p(
                                            fontSize: 8.5,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MateriDetailScreen(
                                  materi: item,
                                  onPassedQuiz: () =>
                                      _onModuleCompleted(item.id),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),

                // Footnote Petunjuk Kontrol
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD166),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: const Text(
                          'KLIK KARTU',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Untuk Membaca Panduan Petualangan',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.85),
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
    );
  }
}

// ---------------------------------------------------------------------------
// KOMPONEN KARTU PIXEL LUCU DENGAN FOTO TERANG & STIKER GEMBOK
// ---------------------------------------------------------------------------
class _CutePixelCardTile extends StatelessWidget {
  final MateriModel item;
  final bool isActive;
  final bool isUnlocked;
  final bool isCompleted;
  final VoidCallback onHover;
  final VoidCallback onTap;

  const _CutePixelCardTile({
    required this.item,
    required this.isActive,
    required this.isUnlocked,
    required this.isCompleted,
    required this.onHover,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 380.0;

    return MouseRegion(
      onEnter: (_) => onHover(),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: cardWidth,
          decoration: BoxDecoration(
            color: const Color(0xFF1E2130),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isActive
                  ? const Color(0xFFFFD166)
                  : (isUnlocked ? Colors.white30 : const Color(0xFF333852)),
              width: isActive ? 3 : 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: isActive ? const Offset(5, 5) : const Offset(3, 3),
                blurRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. BAGIAN ATAS: FOTO 16:9 DARI CANVA (100% TERANG & JERNIH)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Gambar asli tanpa filter gelap apa pun
                      Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: item.pastelColor.withOpacity(0.3),
                            child: Center(
                              child: Icon(
                                Icons.auto_stories_rounded,
                                size: 54,
                                color: item.pastelColor,
                              ),
                            ),
                          );
                        },
                      ),

                      // Stiker Level di Kiri Atas
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F111A).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: item.pastelColor,
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            item.badgeText,
                            style: GoogleFonts.pressStart2p(
                              fontSize: 8,
                              color: item.pastelColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      // Stiker Status di Kanan Atas (Gembok Lucu / Bintang Selesai)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: isCompleted
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF06D6A0),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 2),
                                      blurRadius: 0,
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('⭐ ', style: TextStyle(fontSize: 10)),
                                    Text(
                                      'SELESAI',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : (!isUnlocked
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 9,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEF476F),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black45,
                                            offset: Offset(2, 2),
                                            blurRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.lock_rounded,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'TERKUNCI',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink()),
                      ),
                    ],
                  ),
                ),

                // 2. BAGIAN BAWAH: DESKRIPSI RAMAH & TOMBOL AKSI LUCU
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    color: isActive
                        ? const Color(0xFFFFFDF5)
                        : const Color(0xFF161822),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                  color: isActive
                                      ? Colors.black87
                                      : Colors.white,
                                ),
                              ),
                            ),
                            if (!isUnlocked) ...[
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.lock_rounded,
                                size: 14,
                                color: Color(0xFFEF476F),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item.cuteHook,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.5,
                            height: 1.35,
                            fontWeight: FontWeight.w500,
                            color: isActive
                                ? const Color(0xFF4A4E69)
                                : Colors.white.withOpacity(0.65),
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
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// SCREEN DETAIL: BUKU PETUALANGAN MATERI (HANGAT, RAMAH & TIDAK KAKU)
// ---------------------------------------------------------------------------
class MateriDetailScreen extends StatelessWidget {
  final MateriModel materi;
  final VoidCallback onPassedQuiz;

  const MateriDetailScreen({
    super.key,
    required this.materi,
    required this.onPassedQuiz,
  });

  Widget _buildCuteSectionTitle(String emoji, String title, Color accent) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.pressStart2p(
              fontSize: 10.5,
              letterSpacing: 1,
              color: accent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13151F),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar Buku Petualang
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF1C1F2E),
                border: Border(
                  bottom: BorderSide(color: Color(0xFF2E344A), width: 2),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD166),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.black, size: 14),
                          SizedBox(width: 6),
                          Text(
                            'TUTUP BUKU',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '📖 ${materi.badgeText} : ${materi.title.toUpperCase()}',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 11,
                      letterSpacing: 1.2,
                      color: materi.pastelColor,
                    ),
                  ),
                ],
              ),
            ),

            // Isi Lembaran Modul
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. KOTAK CERITA ANALOGI (SPOK Baku & Ramah Anak)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFDF5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFFFD166),
                          width: 3,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(4, 4),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('💡 ', style: TextStyle(fontSize: 18)),
                              Text(
                                'CERITA SINGKAT (BIAR GAMPANG KEBAYANG!)',
                                style: GoogleFonts.pressStart2p(
                                  fontSize: 9.5,
                                  color: const Color(0xFF8A5A00),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            materi.analogiSPOK,
                            style: const TextStyle(
                              color: Color(0xFF2B2D42),
                              fontSize: 13.5,
                              height: 1.6,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 2. PEMBAHASAN KONSEP MENDALAM
                    _buildCuteSectionTitle(
                      '🧠',
                      'INTI ILMUNYA (YUK PAHAMI BARENG)',
                      const Color(0xFFFFD166),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1F2E),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF2E344A),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        materi.konsepMendalam,
                        style: const TextStyle(
                          color: Color(0xFFE0E2EC),
                          fontSize: 13,
                          height: 1.7,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),

                    // 3. CHECKLIST CATATAN PENTING
                    _buildCuteSectionTitle(
                      '📌',
                      'MISI CATATAN PENTING',
                      const Color(0xFF06D6A0),
                    ),
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1F2E),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF2E344A),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: materi.checklistPoin.map((point) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '✔ ',
                                  style: TextStyle(
                                    color: Color(0xFF06D6A0),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    point,
                                    style: const TextStyle(
                                      color: Color(0xFFE0E2EC),
                                      fontSize: 12.5,
                                      height: 1.45,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // 4. JENDELA KODE RETRO TERMINAL
                    _buildCuteSectionTitle(
                      '💻',
                      'LABORATORIUM KODE',
                      const Color(0xFF48CAE4),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D0F17),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF2E344A),
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              color: const Color(0xFF1A1D2B),
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEF476F),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFFD166),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF06D6A0),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'terminal_belajar.dart',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 11,
                                      fontFamily: 'Courier',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18),
                              child: SelectableText(
                                materi.sourceCode,
                                style: TextStyle(
                                  fontFamily: 'Courier',
                                  color: Color(0xFF90E0EF),
                                  fontSize:
                                      GameSettings.instance.codeFontSizeInPx,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 5. BEDAH KODE KATA PER KATA (STIKER WARNA-WARNI)
                    _buildCuteSectionTitle(
                      '🔍',
                      'BEDAH KATA PER KATA (BIAR NGGAK BINGUNG)',
                      const Color(0xFFC77DFF),
                    ),
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1F2E),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF2E344A),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: materi.bedahSintaks.map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 9,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: materi.pastelColor.withOpacity(0.18),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: materi.pastelColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    item.token,
                                    style: TextStyle(
                                      fontFamily: 'Courier',
                                      color: materi.pastelColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.role,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: materi.pastelColor,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        item.description,
                                        style: const TextStyle(
                                          color: Color(0xFFCFD2DC),
                                          fontSize: 12,
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // 6. CATATAN PENCEGAHAN BUG LUCU
                    _buildCuteSectionTitle(
                      '⚠️',
                      'AWAS JEBAKAN BUG!',
                      const Color(0xFFEF476F),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF331A24),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFEF476F),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('👾 ', style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              materi.tipsBugLucu,
                              style: const TextStyle(
                                color: Color(0xFFFFD4E0),
                                fontSize: 12.5,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 36),

                    // 7. TOMBOL MULAI KUIS RETRO
                    Center(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => _CuteQuizDialog(
                              materi: materi,
                              onPassed: () {
                                onPassedQuiz();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD166),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.black, width: 3),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(4, 4),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('🎯 ', style: TextStyle(fontSize: 20)),
                              Text(
                                'IKUTI KUIS PETUALANG (5 SOAL)',
                                style: GoogleFonts.pressStart2p(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// DIALOG KUIS ARCADE RETRO LUCU (5 SOAL)
// ---------------------------------------------------------------------------
class _CuteQuizDialog extends StatefulWidget {
  final MateriModel materi;
  final VoidCallback onPassed;

  const _CuteQuizDialog({required this.materi, required this.onPassed});

  @override
  State<_CuteQuizDialog> createState() => _CuteQuizDialogState();
}

class _CuteQuizDialogState extends State<_CuteQuizDialog> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;
  bool _answered = false;

  void _checkAnswer(int selected) {
    if (_answered) return;
    setState(() {
      _selectedOption = selected;
      _answered = true;
      if (selected == widget.materi.quizList[_currentIndex].correctIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.materi.quizList.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        _answered = false;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    final bool isPassed = _score >= 3;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1E2130),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFFFD166), width: 3),
        ),
        title: Text(
          isPassed ? '🎉 MISI SELESAI!' : '💪 YUK COBA LAGI!',
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: isPassed ? const Color(0xFF06D6A0) : const Color(0xFFEF476F),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Skormu: $_score / ${widget.materi.quizList.length}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isPassed
                  ? 'Keren banget! Kamu berhasil menaklukkan tantangan materi ini. Level berikutnya resmi terbuka!'
                  : 'Minimal butuh 3 jawaban benar untuk membuka level berikutnya. Pelajari lagi bukunya ya!',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (isPassed) {
                widget.onPassed();
              } else {
                Navigator.pop(context);
              }
            },
            child: Text(
              isPassed ? 'LANJUT KE PETA MISI ▶' : 'ULANGI BACA MATERI',
              style: GoogleFonts.pressStart2p(
                fontSize: 8.5,
                color: const Color(0xFFFFD166),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.materi.quizList[_currentIndex];

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 480,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D2B),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFFFD166), width: 3),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(5, 5), blurRadius: 0),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SOAL ${_currentIndex + 1} / ${widget.materi.quizList.length}',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 9.5,
                    color: const Color(0xFFFFD166),
                  ),
                ),
                Text(
                  'BENAR: $_score ⭐',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 8.5,
                    color: const Color(0xFF06D6A0),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white24, height: 20),
            Text(
              q.question,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(q.options.length, (i) {
              Color optBg = const Color(0xFF262A3D);
              Color optBorder = const Color(0xFF3B415C);

              if (_answered) {
                if (i == q.correctIndex) {
                  optBg = const Color(0xFF06D6A0).withOpacity(0.4);
                  optBorder = const Color(0xFF06D6A0);
                } else if (_selectedOption == i) {
                  optBg = const Color(0xFFEF476F).withOpacity(0.4);
                  optBorder = const Color(0xFFEF476F);
                }
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: () => _checkAnswer(i),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: optBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: optBorder, width: 2),
                    ),
                    child: Text(
                      '${String.fromCharCode(65 + i)}. ${q.options[i]}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 12),
            if (_answered)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD166),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  onPressed: _nextQuestion,
                  child: Text(
                    _currentIndex == widget.materi.quizList.length - 1
                        ? 'LIHAT HASIL'
                        : 'LANJUT ▶',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
