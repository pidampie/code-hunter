import 'dart:ui';

import 'package:flutter/material.dart';

// Variabel global untuk menyimpan progres modul yang telah diselesaikan
int globalCompletedModules = 0;

class CodeBreakdown {
  final String snippet;
  final String meaning;
  final String functionDesc;

  const CodeBreakdown({
    required this.snippet,
    required this.meaning,
    required this.functionDesc,
  });
}

class ModuleTypeItem {
  final String name;
  final String description;
  final String example;

  const ModuleTypeItem({
    required this.name,
    required this.description,
    required this.example,
  });
}

class LearningModule {
  final int number;
  final String title;
  final String subtitle;
  final String duration;
  final IconData icon;
  final Color themeColor;
  final String definition;
  final List<ModuleTypeItem> types;
  final String dailyLifeAnalogy;
  final String caseStudyStory;
  final String codeExample;
  final String codeOutput;
  final List<CodeBreakdown> codeBreakdowns;
  final String criticalQuestion;
  final String criticalAnalysis;

  const LearningModule({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.icon,
    required this.themeColor,
    required this.definition,
    required this.types,
    required this.dailyLifeAnalogy,
    required this.caseStudyStory,
    required this.codeExample,
    required this.codeOutput,
    required this.codeBreakdowns,
    required this.criticalQuestion,
    required this.criticalAnalysis,
  });
}

class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  // Daftar 8 Modul Pembelajaran Komprehensif (RPL / PPLG)
  final List<LearningModule> _modules = const [
    // =========================================================================
    // MODUL 01: DASAR PEMROGRAMAN & ALGORITMA
    // =========================================================================
    LearningModule(
      number: 1,
      title: 'Dasar Pemrograman',
      subtitle: 'Bagaimana cara manusia berkomunikasi dan memberi instruksi kepada komputer?',
      duration: '10 Menit Baca',
      icon: Icons.terminal_rounded,
      themeColor: Color(0xFF2563EB),
      definition: 'Pemrograman (Programming) adalah proses menyusun serangkaian instruksi logis, terstruktur, dan berurutan yang ditulis menggunakan bahasa pemrograman agar komputer dapat menjalankan tugas tertentu. Komputer pada dasarnya adalah mesin yang sangat cepat namun tidak memiliki inisiatif sendiri; komputer hanya bekerja secara presisi mengikuti algoritma (urutan langkah penyelesaian masalah) yang diberikan oleh pemrogram.\n\nDalam pengembangan perangkat lunak, setiap baris perintah yang ditulis disebut sebagai Statement (pernyataan). Komputer akan membaca dan mengeksekusi statement tersebut dari baris paling atas ke baris paling bawah secara berurutan (Sequential Execution), kecuali jika diatur oleh logika percabangan atau perulangan.',
      types: [
        ModuleTypeItem(
          name: '1. Instruksi Input (Masukan)',
          description: 'Perintah untuk menerima data dari luar sistem, seperti ketikan papan ketik, sentuhan layar, sensor kamera, atau data dari jaringan internet.',
          example: 'Membaca PIN yang diketik nasabah pada mesin ATM.',
        ),
        ModuleTypeItem(
          name: '2. Instruksi Proses (Pemrosesan)',
          description: 'Perintah untuk mengolah, menghitung, membandingkan, atau memanipulasi data yang telah masuk di dalam memori komputer.',
          example: 'Mengecek apakah saldo tabungan mencukupi untuk jumlah penarikan tunai.',
        ),
        ModuleTypeItem(
          name: '3. Instruksi Output (Keluaran)',
          description: 'Perintah untuk menampilkan hasil olahan data kepada pengguna melalui layar monitor, suara, cetakan kertas, atau aksi perangkat keras.',
          example: 'Menampilkan teks bukti transaksi di layar menggunakan perintah console.log().',
        ),
      ],
      dailyLifeAnalogy: 'Bayangkan kamu sedang mengikuti resep pembuatan kopi susu di sebuah kafe. Resep tersebut mengharuskan kamu: (1) Menyiapkan gelas, (2) Memasukkan 1 sendok bubuk kopi, (3) Menuangkan 150 ml air panas, dan (4) Mengaduknya hingga rata. Jika kamu membalik urutannya—misalnya mengaduk gelas kosong terlebih dahulu baru menuang air di luar gelas—maka hasilnya akan gagal. Resep yang berurutan itulah yang disebut sebagai Algoritma, sedangkan tindakan menuliskan resep tersebut ke dalam bahasa yang dipahami mesin pembuat kopi otomatis disebut sebagai Pemrograman.',
      caseStudyStory: 'Sebuah koperasi sekolah SMK ingin membuat program sederhana untuk mencetak struk sambutan otomatis pada layar kasir setiap kali sistem dinyalakan di pagi hari, lengkap dengan informasi jam operasionalnya.',
      codeExample: '''// Program Inisialisasi Layar Kasir Koperasi SMK
console.log("=== SISTEM KASIR KOPERASI SMK ===");
console.log("Status Sistem : Aktif & Siap Melayani");
console.log("Jam Operasional: 07.30 - 15.30 WIB");''',
      codeOutput: '''=== SISTEM KASIR KOPERASI SMK ===
Status Sistem : Aktif & Siap Melayani
Jam Operasional: 07.30 - 15.30 WIB''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: '// Program Inisialisasi...',
          meaning: 'Komentar Kode (Single-line Comment)',
          functionDesc: 'Tanda garis miring ganda (//) memberi tahu komputer untuk mengabaikan baris ini. Fungsinya sebagai catatan dokumentasi bagi programmer agar maksud kode mudah dipahami manusia.',
        ),
        CodeBreakdown(
          snippet: 'console.log(...)',
          meaning: 'Fungsi Cetak Output Konsol',
          functionDesc: 'Perintah bawaan JavaScript untuk mengirimkan dan menampilkan teks atau nilai data ke layar konsol/terminal sistem.',
        ),
        CodeBreakdown(
          snippet: '"=== SISTEM KASIR KOPERASI SMK ==="',
          meaning: 'Data Teks (String Literal)',
          functionDesc: 'Teks yang diapit tanda kutip ganda (" ") merupakan pesan yang akan dicetak persis apa adanya ke layar.',
        ),
        CodeBreakdown(
          snippet: '; (Titik Koma / Semicolon)',
          meaning: 'Penanda Akhir Pernyataan (Statement Terminator)',
          functionDesc: 'Menegaskan kepada kompilator bahwa satu baris instruksi telah selesai dan siap dilanjutkan ke instruksi baris berikutnya.',
        ),
      ],
      criticalQuestion: 'Saat kamu membeli minuman di mesin penjual otomatis (vending machine), mesin meminta kamu memilih tombol minuman dan memasukkan uang sebelum menjatuhkan minuman. Apa dampak fatal yang akan terjadi pada pemilik mesin maupun pembeli jika programmer salah menyusun urutan kode sehingga mesin menjatuhkan minuman terlebih dahulu sebelum mengecek uang yang masuk?',
      criticalAnalysis: 'Jika urutan algoritma terbalik (mengeluarkan produk sebelum validasi pembayaran), pembeli dapat mengambil barang lalu pergi tanpa membayar atau memasukkan uang palsu/kurang, sehingga pemilik mesin mengalami kerugian finansial. Hal ini membuktikan bahwa dalam pemrograman, kebenaran urutan eksekusi (sekuensial) sama pentingnya dengan kebenaran penulisan sintaks.',
    ),

    // =========================================================================
    // MODUL 02: VARIABEL & KONSTANTA
    // =========================================================================
    LearningModule(
      number: 2,
      title: 'Variabel & Konstanta',
      subtitle: 'Cara komputer menyimpan, memberi label, dan memperbarui data di dalam memori.',
      duration: '12 Menit Baca',
      icon: Icons.inventory_2_rounded,
      themeColor: Color(0xFF10B981),
      definition: 'Variabel adalah wadah penyimpanan data bernama di dalam memori komputer (RAM) yang nilainya dapat diakses maupun diubah selama program berjalan. Tanpa variabel, program tidak akan bisa mengingat nama pemain, skor pertandingan, maupun jumlah saldo pengguna.\n\nSelain variabel yang nilainya dinamis, terdapat pula Konstanta (Constant), yaitu wadah penyimpanan data yang nilainya bersifat tetap (immutable) sejak pertama kali dideklarasikan dan dilindungi oleh sistem agar tidak dapat diubah secara sengaja maupun tidak sengaja.',
      types: [
        ModuleTypeItem(
          name: '1. Deklarasi let (Variabel Modern)',
          description: 'Digunakan untuk membuat variabel yang nilainya dapat diperbarui (di-assign ulang) di baris kode selanjutnya. Memiliki cakupan blok (block-scoped) yang aman.',
          example: 'let skorPemain = 100;\nskorPemain = 150; // Valid',
        ),
        ModuleTypeItem(
          name: '2. Deklarasi const (Konstanta Tetap)',
          description: 'Digunakan untuk menyimpan nilai permanen yang tidak boleh berubah sepanjang siklus hidup program. Jika dipaksa diubah, program akan menghasilkan Error.',
          example: 'const pajakPPN = 0.11;\npajakPPN = 0.20; // Error!',
        ),
        ModuleTypeItem(
          name: '3. Deklarasi var (Variabel Lawas)',
          description: 'Cara deklarasi generasi lama sebelum standar ES6. Saat ini jarang digunakan pada proyek modern karena rawan menimbulkan kebocoran cakupan variabel (hoisting).',
          example: 'var statusLama = "Aktif";',
        ),
      ],
      dailyLifeAnalogy: 'Bayangkan kamu memiliki dua buah kotak penyimpanan di kamarmu. Kotak pertama ditempeli label "Uang Dompet Harian" (ini adalah variabel let): pagi ini isinya Rp50.000, siang hari berkurang menjadi Rp25.000 karena dipakai makan siang, dan sore hari bertambah lagi. Kotak kedua ditempeli label permanen "Nomor Induk Kependudukan / Tanggal Lahir" (ini adalah konstanta const): sejak pertama kali dicetak pada kartu identitasmu, nilainya terkunci dan tidak akan pernah berubah.',
      caseStudyStory: 'Sebuah aplikasi kantin digital sekolah perlu mencatat nama sekolah sebagai identitas tetap, serta melacak jumlah stok porsi nasi goreng yang terus berkurang setiap kali dibeli oleh siswa saat jam istirahat.',
      codeExample: '''const namaKantin = "Kantin Sehat SMKN 1";
let stokNasiGoreng = 25;

console.log(namaKantin);
console.log("Stok Awal:", stokNasiGoreng);

// Terjadi pembelian 3 porsi oleh siswa
stokNasiGoreng = 22;
console.log("Stok Sekarang:", stokNasiGoreng);''',
      codeOutput: '''Kantin Sehat SMKN 1
Stok Awal: 25
Stok Sekarang: 22''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: 'const namaKantin = "Kantin Sehat SMKN 1";',
          meaning: 'Deklarasi & Inisialisasi Konstanta',
          functionDesc: 'Mengalokasikan memori permanen bernama namaKantin karena identitas nama kantin tidak boleh berubah saat transaksi berlangsung.',
        ),
        CodeBreakdown(
          snippet: 'let stokNasiGoreng = 25;',
          meaning: 'Deklarasi Variabel Dinamis',
          functionDesc: 'Membuat variabel stokNasiGoreng dengan nilai awal 25 menggunakan kata kunci let agar angkanya bisa diperbarui setiap ada transaksi.',
        ),
        CodeBreakdown(
          snippet: 'stokNasiGoreng = 22;',
          meaning: 'Re-assignment (Pembaruan Nilai)',
          functionDesc: 'Mengganti nilai lama (25) di dalam memori stokNasiGoreng dengan nilai baru (22) tanpa perlu menulis ulang kata kunci let.',
        ),
        CodeBreakdown(
          snippet: 'console.log("Stok Sekarang:", stokNasiGoreng);',
          meaning: 'Pemanggilan Nilai Variabel ke Output',
          functionDesc: 'Mengambil isi terakhir dari wadah stokNasiGoreng (yaitu 22) dan menampilkannya berdampingan dengan label teks.',
        ),
      ],
      criticalQuestion: 'Dalam pembuatan aplikasi perbankan digital, seorang programmer pemula menyimpan "Nomor Rekening Nasabah" menggunakan variabel let, sedangkan "Saldo Tabungan" disimpan menggunakan const. Menurut analisis logikamu, masalah apa yang akan dialami nasabah ketika aplikasi tersebut digunakan?',
      criticalAnalysis: 'Nasabah tidak akan bisa melakukan setor tunai, tarik tunai, maupun transfer karena Saldo Tabungan disimpan sebagai const (tidak dapat diubah nilainya). Sebaliknya, Nomor Rekening yang seharusnya tetap justru berisiko tertimpa atau berubah karena disimpan dengan let. Penentuan antara let dan const harus didasarkan pada sifat mutabilitas data di dunia nyata.',
    ),

    // =========================================================================
    // MODUL 03: TIPE DATA FUNDAMENTAL
    // =========================================================================
    LearningModule(
      number: 3,
      title: 'Tipe Data Fundamental',
      subtitle: 'Memahami klasifikasi wujud data agar komputer tidak salah mengolah informasi.',
      duration: '12 Menit Baca',
      icon: Icons.category_rounded,
      themeColor: Color(0xFFF59E0B),
      definition: 'Tipe Data (Data Type) adalah atribut yang memberi tahu komputer mengenai jenis nilai apa yang sedang disimpan di dalam sebuah variabel, serta operasi apa saja yang sah dilakukan terhadap data tersebut. Komputer memperlakukan angka 10 dan teks "10" dengan cara yang sangat berbeda.\n\nJika dua buah angka 10 dijumlahkan (10 + 10), komputer menghasilkan nilai matematika 20. Namun, jika dua buah teks "10" digabungkan ("10" + "10"), komputer akan menyambung hurufnya menjadi "1010". Oleh sebab itu, pemahaman tipe data sangat krusial untuk mencegah kesalahan logika perhitungan.',
      types: [
        ModuleTypeItem(
          name: '1. String (Teks / Karakter)',
          description: 'Kumpulan karakter huruf, angka, atau simbol yang diapit oleh tanda kutip tunggal (\'...\') maupun kutip ganda ("...").',
          example: 'let jurusan = "PPLG / RPL";\nlet kodePos = "35145";',
        ),
        ModuleTypeItem(
          name: '2. Number (Angka Bulat & Desimal)',
          description: 'Representasi nilai numerik baik bilangan bulat (integer) maupun pecahan desimal (floating-point) yang ditulis tanpa tanda kutip.',
          example: 'let jumlahSiswa = 36;\nlet nilaiRataRata = 88.5;',
        ),
        ModuleTypeItem(
          name: '3. Boolean (Kebenaran Logika)',
          description: 'Tipe data biner yang hanya memiliki dua kemungkinan nilai mutlak: true (benar) atau false (salah). Menjadi fondasi utama pengambilan keputusan.',
          example: 'let sudahLulusUjian = true;\nlet akunTerkunci = false;',
        ),
        ModuleTypeItem(
          name: '4. Undefined & Null',
          description: 'Undefined berarti variabel sudah dibuat tetapi belum diisi nilai apa pun. Null berarti variabel sengaja dikosongkan nilainya oleh programmer.',
          example:
              'let nilaiBelumInput; // undefined\nlet pemenangUndian = null;',
        ),
      ],
      dailyLifeAnalogy: 'Ketika kamu mengisi formulir pendaftaran lomba secara daring, setiap kolom memiliki aturan jenis isiannya masing-masing: kolom "Nama Lengkap" hanya menerima huruf/teks (String), kolom "Umur" hanya menerima angka (Number), dan kotak centang "Saya bersedia mematuhi peraturan lomba" hanya memiliki dua status yaitu dicentang atau tidak dicentang (Boolean).',
      caseStudyStory: 'Sistem perpustakaan digital sekolah perlu memeriksa profil peminjaman buku milik seorang siswa dan memastikan tipe data dari setiap atributnya terbaca dengan benar oleh mesin menggunakan operator typeof.',
      codeExample: '''let judulBuku = "Algoritma & Struktur Data";
let lamaPinjamHari = 7;
let bebasDenda = true;
let tanggalKembali;

console.log(typeof judulBuku);
console.log(typeof lamaPinjamHari);
console.log(typeof bebasDenda);
console.log(typeof tanggalKembali);''',
      codeOutput: '''string
number
boolean
undefined''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: 'let judulBuku = "Algoritma & Struktur Data";',
          meaning: 'Inisialisasi Data String',
          functionDesc: 'Tanda kutip ganda menginstruksikan memori untuk menyimpan deretan karakter tersebut sebagai teks (string).',
        ),
        CodeBreakdown(
          snippet: 'let lamaPinjamHari = 7;',
          meaning: 'Inisialisasi Data Number',
          functionDesc: 'Angka 7 ditulis tanpa tanda kutip sehingga dapat dihitung secara matematis (misalnya ditambah masa perpanjangan pinjam).',
        ),
        CodeBreakdown(
          snippet: 'let bebasDenda = true;',
          meaning: 'Inisialisasi Data Boolean',
          functionDesc: 'Kata kunci true (tanpa tanda kutip) menandakan status logika aktif/benar pada akun peminjam.',
        ),
        CodeBreakdown(
          snippet: 'typeof judulBuku',
          meaning: 'Operator Inspeksi Tipe Data (typeof)',
          functionDesc: 'Mengecek dan mengembalikan nama tipe data dari variabel yang diperiksa dalam bentuk teks seperti "string", "number", atau "boolean".',
        ),
      ],
      criticalQuestion: 'Mengapa "Nomor Telepon" (contoh: 081234567890) pada aplikasi kontak ponsel selalu disimpan menggunakan tipe data String (Teks), padahal seluruh isinya terdiri dari angka 0 sampai 9? Apa yang akan terjadi pada angka 0 di depan jika disimpan sebagai tipe data Number?',
      criticalAnalysis: 'Dalam aturan matematika (Number), angka nol di paling depan bilangan bulat tidak memiliki nilai dan akan otomatis dihapus oleh komputer (081234567890 akan berubah menjadi 81234567890). Selain itu, nomor telepon tidak pernah dijumlahkan atau dikalikan secara matematis, serta sering memuat simbol seperti "+62" atau tanda hubung, sehingga wajib disimpan sebagai String.',
    ),

    // =========================================================================
    // MODUL 04: OPERATOR ARITMATIKA, PERBANDINGAN & LOGIKA
    // =========================================================================
    LearningModule(
      number: 4,
      title: 'Operator & Ekspresi Logika',
      subtitle: 'Instrumen kalkulasi matematika, komparasi nilai, dan penggabungan syarat logika.',
      duration: '15 Menit Baca',
      icon: Icons.calculate_rounded,
      themeColor: Color(0xFF8B5CF6),
      definition: 'Operator adalah simbol khusus yang digunakan untuk melakukan operasi tertentu terhadap satu atau lebih nilai (disebut operand) sehingga menghasilkan nilai baru. Dalam pemrograman, operator menjadi mesin penggerak utama untuk menghitung rumus matematika, membandingkan dua buah kondisi, hingga menggabungkan beberapa syarat sekaligus.\n\nMemahami prioritas operator (operator precedence) dan perbedaan ketelitian perbandingan (seperti == melawan ===) sangat penting agar aplikasi tidak salah mengambil kesimpulan.',
      types: [
        ModuleTypeItem(
          name: '1. Operator Aritmatika (+, -, *, /, %, **)',
          description: 'Digunakan untuk perhitungan matematika. Operator % (Modulus) menghasilkan sisa pembagian, sedangkan ** menghasilkan perpangkatan.',
          example: '10 % 3 menghasilkan 1 (karena 10 dibagi 3 bersisa 1).\n2 ** 3 menghasilkan 8.',
        ),
        ModuleTypeItem(
          name: '2. Operator Perbandingan (>, <, >=, <=, ==, ===, !=)',
          description: 'Membandingkan dua nilai dan selalu menghasilkan Boolean (true/false). Operator === (Strict Equal) membandingkan nilai sekaligus tipe datanya.',
          example: '10 == "10" bernilai true.\n10 === "10" bernilai false (karena Number != String).',
        ),
        ModuleTypeItem(
          name: '3. Operator Logika (&&, ||, !)',
          description: 'Operator && (AND) bernilai true hanya jika kedua syarat benar. Operator || (OR) bernilai true jika salah satu syarat benar. Operator ! (NOT) membalik nilai.',
          example: '(true && false) -> false\n(true || false) -> true\n!true -> false',
        ),
      ],
      dailyLifeAnalogy: 'Bayangkan syarat untuk bisa mengendarai sepeda motor ke sekolah: kamu harus "Memiliki SIM C" DAN "Memakai Helm Standar". Itu adalah cara kerja operator && (AND)—jika salah satu saja tidak terpenuhi, kamu tidak boleh berkendara. Berbeda ketika kasir minimarket berkata: "Pembayaran bisa menggunakan Uang Tunai ATAU QRIS". Itu adalah cara kerja operator || (OR)—cukup salah satu saja yang kamu miliki, transaksi tetap berhasil.',
      caseStudyStory: 'Panitia seleksi beasiswa prestasi SMK ingin membuat rumus otomatis untuk mengecek apakah seorang siswa memenuhi syarat lolos administrasi: nilai rata-rata rapor minimal 85 DAN tidak memiliki catatan pelanggaran tata tertib.',
      codeExample: '''let nilaiRapor = 88;
let bebasPelanggaran = true;

// Mengecek sisa bagi nomor urut peserta (Ganjil/Genap)
let sisaBagi = 15 % 2;

// Evaluasi syarat kelulusan beasiswa
let lolosSeleksi = (nilaiRapor >= 85) && bebasPelanggaran;

console.log("Sisa Bagi 15 % 2 :", sisaBagi);
console.log("Status Beasiswa  :", lolosSeleksi);
console.log("Uji Strict Equal :", 88 === "88");''',
      codeOutput: '''Sisa Bagi 15 % 2 : 1
Status Beasiswa  : true
Uji Strict Equal : false''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: 'let sisaBagi = 15 % 2;',
          meaning: 'Operasi Modulus (Sisa Pembagian)',
          functionDesc: 'Membagi 15 dengan 2 (hasil terdekat adalah 14) dan mengambil sisanya yaitu 1. Sangat sering dipakai untuk mengecek bilangan ganjil atau genap.',
        ),
        CodeBreakdown(
          snippet: '(nilaiRapor >= 85)',
          meaning: 'Ekspresi Perbandingan Lebih Besar Sama Dengan',
          functionDesc: 'Memeriksa apakah 88 lebih besar atau sama dengan 85. Karena benar, ekspresi ini menghasilkan nilai boolean true.',
        ),
        CodeBreakdown(
          snippet: '(nilaiRapor >= 85) && bebasPelanggaran',
          meaning: 'Operasi Logika Konjungsi (AND)',
          functionDesc: 'Menggabungkan dua syarat. Karena syarat kiri bernilai true dan variabel kanan juga true, maka hasil akhirnya adalah true.',
        ),
        CodeBreakdown(
          snippet: '88 === "88"',
          meaning: 'Perbandingan Ketat (Strict Equality)',
          functionDesc: 'Memeriksa kesamaan nilai dan tipe data. Menghasilkan false karena 88 di kiri bertipe Number sedangkan "88" di kanan bertipe String.',
        ),
      ],
      criticalQuestion: 'Sebuah wahana rollercoaster di taman hiburan memiliki aturan keamanan: pengunjung diizinkan naik jika "Tinggi badan minimal 140 cm" DAN "Tidak memiliki riwayat penyakit jantung". Jika programmer salah menulis kode menggunakan operator || (ATAU) alih-alih && (DAN), bahaya apa yang akan terjadi di lapangan?',
      criticalAnalysis: 'Dengan operator || (ATAU), pengunjung yang memiliki riwayat penyakit jantung tetap akan diizinkan naik asalkan tingginya di atas 140 cm, atau anak balita setinggi 90 cm diizinkan naik hanya karena tidak punya penyakit jantung. Kesalahan satu simbol operator logika dapat berakibat fatal pada keselamatan pengguna.',
    ),

    // =========================================================================
    // MODUL 05: KONDISI & PERCABANGAN
    // =========================================================================
    LearningModule(
      number: 5,
      title: 'Kondisi & Percabangan',
      subtitle: 'Memberikan kecerdasan pada program untuk mengambil keputusan berdasarkan situasi.',
      duration: '15 Menit Baca',
      icon: Icons.alt_route_rounded,
      themeColor: Color(0xFFEC4899),
      definition: 'Percabangan (Conditional Branching / Control Flow) adalah struktur kontrol yang memungkinkan program memilih jalur eksekusi kode yang berbeda berdasarkan hasil evaluasi suatu kondisi boolean (true atau false). Tanpa percabangan, program hanya akan berjalan lurus dan kaku tanpa mampu merespons situasi yang berubah-ubah.\n\nKetika kondisi di dalam tanda kurung bernilai true, blok kode di dalamnya akan dieksekusi. Jika bernilai false, komputer akan melompati blok tersebut dan beralih memeriksa kondisi alternatif berikutnya.',
      types: [
        ModuleTypeItem(
          name: '1. Struktur if - else Tunggal',
          description: 'Digunakan ketika hanya ada dua kemungkinan jalur keputusan: jika syarat terpenuhi jalankan blok A, jika tidak jalankan blok B.',
          example: 'if (nyawa > 0) { lanjutMain(); } else { gameOver(); }',
        ),
        ModuleTypeItem(
          name: '2. Struktur if - else if - else Majemuk',
          description: 'Digunakan ketika terdapat banyak tingkatan kondisi yang harus diperiksa secara berurutan dari atas ke bawah (seperti konversi nilai angka ke huruf A/B/C/D).',
          example: 'if (nilai >= 90) { ... } else if (nilai >= 75) { ... } else { ... }',
        ),
        ModuleTypeItem(
          name: '3. Struktur switch - case',
          description: 'Alternatif percabangan yang lebih rapi ketika kita mencocokkan satu variabel dengan banyak nilai pasti (exact match), dilengkapi kata kunci break.',
          example: 'switch(pilihanMenu) { case 1: ... break; default: ... }',
        ),
      ],
      dailyLifeAnalogy: 'Saat kamu bersiap berangkat ke sekolah di pagi hari, kamu melihat ke luar jendela. JIKA (if) langit sedang turun hujan deras, MAKA kamu memakai jas hujan. NAMUN JIKA (else if) cuaca hanya mendung berangin, MAKA kamu memakai jaket tebal. SELAIN ITU (else, artinya cuaca cerah), kamu cukup memakai seragam sekolah biasa. Keputusanmu bergantung sepenuhnya pada kondisi cuaca saat itu.',
      caseStudyStory: 'Sekolah ingin mengotomatiskan penentuan predikat kelulusan ujian praktik kejuruan siswa RPL berdasarkan skor akhir yang diperoleh siswa.',
      codeExample: '''let skorUjian = 82;
let predikat;

if (skorUjian >= 90) {
  predikat = "A (Sangat Kompeten)";
} else if (skorUjian >= 75) {
  predikat = "B (Kompeten)";
} else {
  predikat = "C (Perlu Remedial)";
}

console.log("Skor Siswa :", skorUjian);
console.log("Predikat   :", predikat);''',
      codeOutput: '''Skor Siswa : 82
Predikat   : B (Kompeten)''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: 'if (skorUjian >= 90)',
          meaning: 'Pengecekan Kondisi Pertama (Utama)',
          functionDesc: 'Menguji apakah nilai 82 >= 90. Karena hasilnya false, blok kode predikat A di dalamnya dilewati begitu saja oleh komputer.',
        ),
        CodeBreakdown(
          snippet: 'else if (skorUjian >= 75)',
          meaning: 'Pengecekan Kondisi Alternatif Kedua',
          functionDesc: 'Karena kondisi pertama gagal, komputer menguji apakah 82 >= 75. Hasilnya true, sehingga predikat diisi "B (Kompeten)" dan pengecekan selesai.',
        ),
        CodeBreakdown(
          snippet: 'else { predikat = "C (Perlu Remedial)"; }',
          meaning: 'Blok Penampung Terakhir (Fallback)',
          functionDesc: 'Blok yang otomatis dijalankan hanya apabila seluruh kondisi if dan else if di atasnya bernilai false.',
        ),
      ],
      criticalQuestion: 'Dalam menyusun kode penentuan predikat nilai di atas, seorang siswa menaruh syarat if (skorUjian >= 75) di baris paling atas, baru kemudian menulis else if (skorUjian >= 90) di bawahnya. Jika ada siswa yang mendapat nilai sempurna 95, mengapa program justru memberinya predikat B dan bukan A?',
      criticalAnalysis: 'Karena struktur if - else if dieksekusi secara berurutan dari atas ke bawah dan langsung berhenti begitu menemukan kondisi pertama yang bernilai true. Nilai 95 memenuhi syarat pertama (95 >= 75 adalah true), sehingga program langsung menetapkan predikat B dan tidak pernah memeriksa baris else if (>= 90) di bawahnya. Urutan kondisi harus disusun dari rentang yang paling spesifik/tinggi ke yang lebih umum.',
    ),

    // =========================================================================
    // MODUL 06: STRUKTUR PERULANGAN (LOOPING)
    // =========================================================================
    LearningModule(
      number: 6,
      title: 'Struktur Perulangan (Loop)',
      subtitle: 'Otomatisasi eksekusi perintah berulang kali secara efisien tanpa duplikasi kode.',
      duration: '15 Menit Baca',
      icon: Icons.PublishedWithChanges_rounded,
      themeColor: Color(0xFF06B6D4),
      definition: 'Perulangan (Looping / Iteration) adalah instruksi yang memerintahkan komputer untuk menjalankan suatu blok kode secara berulang-ulang selama kondisi tertentu masih bernilai benar (true). Bayangkan jika kamu diminta mencetak nomor antrean dari 1 sampai 1.000; tanpa perulangan, kamu harus menulis 1.000 baris console.log(). Dengan perulangan, tugas tersebut selesai hanya dalam 3 baris kode.\n\nSetiap perulangan yang sehat wajib memiliki tiga komponen: nilai awal (inisialisasi), syarat berhenti (kondisi terminasi), dan perubahan nilai pencacah (increment/decrement) agar tidak terjebak dalam perulangan tak berujung (Infinite Loop) yang membuat aplikasi macet.',
      types: [
        ModuleTypeItem(
          name: '1. Perulangan for (Counted Loop)',
          description: 'Digunakan ketika jumlah putaran perulangan sudah diketahui secara pasti sejak awal (memiliki batas awal, batas akhir, dan langkah kenaikan).',
          example: 'for (let i = 1; i <= 5; i++) { console.log(i); }',
        ),
        ModuleTypeItem(
          name: '2. Perulangan while (Uncounted Loop)',
          description: 'Mengecek syarat terlebih dahulu di awal; selama syarat bernilai true, blok kode akan terus diulang. Cocok ketika jumlah putaran bergantung pada kondisi dinamis.',
          example: 'while (baterai > 0) { jalankanRobot(); }',
        ),
        ModuleTypeItem(
          name: '3. Perulangan do - while',
          description: 'Menjalankan blok kode minimal satu kali terlebih dahulu, baru kemudian memeriksa syarat pengulangannya di bagian akhir.',
          example: 'do { tampilkanMenu(); } while (pilihan != "keluar");',
        ),
      ],
      dailyLifeAnalogy: 'Saat guru olahraga meminta kamu berlari mengelilingi lapangan upacara sebanyak 5 putaran: sebelum mulai, hitungan putaranmu adalah 0 (Inisialisasi). Setiap kali kamu menyelesaikan 1 keliling, hitungan di kepalamu bertambah 1 (Increment i++). Selama hitunganmu masih kurang dari atau sama dengan 5 (Kondisi i <= 5), kamu terus berlari. Begitu menyentuh putaran ke-5, kamu berhenti.',
      caseStudyStory: 'Di dalam gim Code Hunter, sistem ingin menghitung total akumulasi koin bonus dari 4 peti harta karun berurutan, di mana setiap peti ke-i memberikan koin sebesar (i * 10) keping.',
      codeExample: '''let totalKoin = 0;

for (let peti = 1; peti <= 4; peti++) {
  let koinPetiIni = peti * 10;
  totalKoin += koinPetiIni;
  console.log("Buka Peti", peti, "-> Dapat:", koinPetiIni);
}

console.log("Total Akumulasi Koin:", totalKoin);''',
      codeOutput: '''Buka Peti 1 -> Dapat: 10
Buka Peti 2 -> Dapat: 20
Buka Peti 3 -> Dapat: 30
Buka Peti 4 -> Dapat: 40
Total Akumulasi Koin: 100''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: 'let peti = 1;',
          meaning: 'Inisialisasi Variabel Pencacah (Counter)',
          functionDesc: 'Menetapkan titik mulai perulangan dari peti nomor 1. Dieksekusi satu kali saja saat loop dimulai.',
        ),
        CodeBreakdown(
          snippet: 'peti <= 4;',
          meaning: 'Kondisi Batas Perulangan (Loop Condition)',
          functionDesc: 'Sebelum memulai setiap putaran, komputer mengecek apakah nomor peti masih <= 4. Jika sudah mencapai 5 (false), loop langsung berhenti.',
        ),
        CodeBreakdown(
          snippet: 'peti++',
          meaning: 'Increment (Penambahan Nilai 1 per Putaran)',
          functionDesc: 'Singkatan dari peti = peti + 1. Menaikkan nomor pencacah setiap kali satu putaran blok selesai dijalankan.',
        ),
        CodeBreakdown(
          snippet: 'totalKoin += koinPetiIni;',
          meaning: 'Operator Penugasan Tambah (Addition Assignment)',
          functionDesc: 'Menambahkan koin dari peti saat ini ke dalam tabungan variabel totalKoin (sama dengan totalKoin = totalKoin + koinPetiIni).',
        ),
      ],
      criticalQuestion: 'Pada mesin pengisi air galon otomatis, komputer diprogram menggunakan perulangan while (volumeAir < 19Liter) untuk terus mengalirkan air. Apa yang akan terjadi di dunia nyata jika sensor pengukur volume air rusak sehingga nilai variabel volumeAir di dalam kode selalu tetap 0 dan tidak pernah bertambah?',
      criticalAnalysis: 'Kondisi (0 < 19) akan selalu bernilai true selamanya (Infinite Loop / Perulangan Tak Terhingga). Akibatnya, mesin tidak pernah mendapat sinyal berhenti dan air akan terus meluap membanjiri ruangan. Karena itulah dalam pemrograman sistem nyata, selalu ditambahkan batas waktu pengaman (timeout/break) untuk menghentikan loop jika sensor gagal merespons.',
    ),

    // =========================================================================
    // MODUL 07: FUNGSI & ARROW FUNCTION
    // =========================================================================
    LearningModule(
      number: 7,
      title: 'Fungsi & Modularitas',
      subtitle: 'Membungkus blok logika menjadi modul mandiri yang dapat dipanggil kapan saja.',
      duration: '14 Menit Baca',
      icon: Icons.functions_rounded,
      themeColor: Color(0xFF6366F1),
      definition: 'Fungsi (Function) adalah satu blok kode terorganisasi yang dirancang untuk melakukan satu tugas spesifik dan dapat dipanggil (digunakan kembali / reusable) berkali-kali dari berbagai bagian program. Prinsip utama penggunaan fungsi dalam rekayasa perangkat lunak adalah DRY (Don\'t Repeat Yourself)—jangan menulis ulang kode yang sama berulang-ulang.\n\nSebuah fungsi dapat menerima masukan data yang disebut Parameter/Argumen, mengolahnya di dalam tubuh fungsi, lalu mengembalikan hasil perhitungannya menggunakan kata kunci return.',
      types: [
        ModuleTypeItem(
          name: '1. Fungsi Deklaratif Standar (Function Declaration)',
          description: 'Fungsi klasik yang didefinisikan menggunakan kata kunci function diikuti nama fungsi, daftar parameter di dalam kurung, dan blok kurung kurawal.',
          example: 'function sapaSiswa(nama) {\n  return "Halo " + nama;\n}',
        ),
        ModuleTypeItem(
          name: '2. Fungsi dengan Nilai Kembalian (Return Value)',
          description: 'Fungsi yang memproses data dan menyerahkan hasil akhirnya kembali ke pemanggil menggunakan kata kunci return agar hasilnya bisa disimpan ke variabel lain.',
          example: 'function hitungLuas(p, l) {\n  return p * l;\n}',
        ),
        ModuleTypeItem(
          name: '3. Arrow Function (Fungsi Panah ES6)',
          description: 'Penulisan fungsi modern yang jauh lebih ringkas menggunakan simbol panah (=>). Jika hanya satu baris ekspresi, otomatis mengembalikan nilai tanpa kata return.',
          example: 'const kaliDua = (angka) => angka * 2;',
        ),
      ],
      dailyLifeAnalogy: 'Bayangkan sebuah mesin blender jus di dapurmu. Mesin blender tersebut adalah sebuah Fungsi. Buah jeruk dan es batu yang kamu masukkan ke dalamnya adalah Parameter (Input). Pisau pemutar di dalam mesin adalah Proses kode, sedangkan segelas jus jeruk segar yang dituang keluar dari blender adalah Return Value (Hasil Kembalian). Kamu cukup memiliki satu mesin blender untuk membuat jus berkali-kali dengan buah yang berbeda-beda.',
      caseStudyStory: 'Sebuah toko buku kejuruan membutuhkan fungsi khusus untuk menghitung harga akhir buku setelah dikurangi diskon pelajar, sehingga kasir cukup memasukkan harga asli dan potongan diskonnya saja.',
      codeExample: '''// Deklarasi Fungsi dengan 2 Parameter
function hitungHargaAkhir(hargaAsli, diskon) {
  let potongan = hargaAsli * (diskon / 100);
  return hargaAsli - potongan;
}

// Arrow Function untuk mencetak poin reward
const hitungPoin = (harga) => harga / 1000;

let bayarBuku1 = hitungHargaAkhir(100000, 20);
console.log("Total Bayar : Rp" + bayarBuku1);
console.log("Poin Reward :", hitungPoin(bayarBuku1));''',
      codeOutput: '''Total Bayar : Rp80000
Poin Reward : 80''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: 'function hitungHargaAkhir(hargaAsli, diskon)',
          meaning: 'Header Fungsi & Parameter Input',
          functionDesc: 'Mendefinisikan fungsi bernama hitungHargaAkhir yang membutuhkan dua nilai masukan: hargaAsli dan persentase diskon.',
        ),
        CodeBreakdown(
          snippet: 'return hargaAsli - potongan;',
          meaning: 'Instruksi Pengembalian Nilai (Return)',
          functionDesc: 'Mengirimkan hasil pengurangan keluar dari fungsi dan langsung menghentikan eksekusi fungsi tersebut.',
        ),
        CodeBreakdown(
          snippet: 'const hitungPoin = (harga) => harga / 1000;',
          meaning: 'Deklarasi Arrow Function Ringkas',
          functionDesc: 'Membuat fungsi satu baris yang menerima parameter harga dan langsung mengembalikan hasil baginya dengan 1000.',
        ),
        CodeBreakdown(
          snippet: 'hitungHargaAkhir(100000, 20);',
          meaning: 'Pemanggilan Fungsi (Function Call / Invocation)',
          functionDesc: 'Menjalankan fungsi dengan mengirimkan argumen nyata 100000 sebagai hargaAsli dan 20 sebagai diskon.',
        ),
      ],
      criticalQuestion: 'Di sebuah aplikasi e-commerce, rumus perhitungan ongkos kirim ditulis secara manual di 15 halaman berbeda (halaman keranjang, checkout, cetak invoice, riwayat pesanan, dll) tanpa menggunakan Fungsi. Ketika perusahaan ekspedisi menaikkan tarif dasar ongkir Rp1.000, masalah besar apa yang akan dihadapi oleh tim programmer?',
      criticalAnalysis: 'Tim programmer harus mencari dan mengubah rumus tersebut satu per satu di ke-15 halaman kode. Jika ada satu halaman saja yang terlewat diubah, maka nominal ongkos kirim di halaman keranjang dan halaman pembayaran akan berbeda (tidak sinkron). Dengan membungkus rumus ke dalam satu Fungsi terpusat, programmer cukup mengubah kodenya di satu tempat saja.',
    ),

    // =========================================================================
    // MODUL 08: ARRAY, OBJECT & PENANGANAN ERROR
    // =========================================================================
    LearningModule(
      number: 8,
      title: 'Array, Object & Error Handling',
      subtitle: 'Mengelola kumpulan data terstruktur dan menjaga aplikasi tetap stabil dari crash.',
      duration: '18 Menit Baca',
      icon: Icons.data_object_rounded,
      themeColor: Color(0xFFEF4444),
      definition: 'Dalam aplikasi nyata, kita jarang mengolah satu data tunggal. Kita membutuhkan struktur data koleksi: Array untuk menyimpan daftar nilai berurutan menggunakan nomor indeks (dimulai dari indeks 0), serta Object untuk menyimpan entitas data yang memiliki pasangan atribut dan nilai (key-value pairs).\n\nSelain mengelola struktur data kompleks, program yang tangguh juga wajib dilengkapi dengan Penanganan Eksepsi (Error Handling) menggunakan blok try - catch - finally. Mekanisme ini menangkap kesalahan tak terduga saat aplikasi berjalan (runtime error) agar aplikasi tidak tiba-tiba keluar sendiri (force close).',
      types: [
        ModuleTypeItem(
          name: '1. Array / List (Daftar Berindeks)',
          description: 'Ditulis menggunakan kurung siku [ ]. Elemen pertama selalu berada pada indeks ke-0. Dilengkapi metode seperti .push() (tambah akhir), .pop() (hapus akhir), dan .length.',
          example: 'let bahasa = ["Dart", "JS", "Python"];\nconsole.log(bahasa[0]); // "Dart"',
        ),
        ModuleTypeItem(
          name: '2. Object (Pasangan Properti Key-Value)',
          description: 'Ditulis menggunakan kurung kurawal { }. Merepresentasikan benda nyata yang memiliki banyak atribut spesifik di dalamnya.',
          example: 'let siswa = { nama: "Fida", kelas: "XI PPLG", nilai: 95 };\nconsole.log(siswa.nama);',
        ),
        ModuleTypeItem(
          name: '3. Blok try - catch - finally (Error Handling)',
          description: 'Blok try menguji kode yang berisiko gagal. Jika terjadi error, blok catch langsung menangkap dan menanganinya dengan aman tanpa menghentikan program.',
          example:
              'try { prosesData(); } catch (err) { tampilkanPesanAman(err); }',
        ),
      ],
      dailyLifeAnalogy: 'Bayangkan sebuah loker penyimpanan sepatu di perpustakaan yang diberi nomor urut 0, 1, 2, 3, dan seterusnya—itulah Array, di mana kamu mengambil barang berdasarkan nomor urut kotaknya. Sekarang bayangkan Kartu Pelajar milikmu yang di dalamnya tertulis label "Nama: Budi", "NISN: 12345", dan "Jurusan: PPLG"—itulah Object, di mana kamu memanggil datanya berdasarkan nama propertinya. Sedangkan try-catch ibarat jaring pengaman di bawah pemain akrobat sirkus: jika pemain terpeleset, jaring akan menangkapnya sehingga pertunjukan tidak berakhir menjadi bencana.',
      caseStudyStory: 'Sistem inventaris laboratorium komputer SMK ingin menyimpan daftar perangkat yang tersedia dalam Array of Objects, menambah perangkat baru, serta mengamankan proses pembacaan data menggunakan blok try-catch.',
      codeExample: '''let inventarisLab = [
  { kode: "PC-01", ramGB: 8 },
  { kode: "PC-02", ramGB: 16 }
];

// Menambahkan perangkat baru ke urutan terakhir Array
inventarisLab.push({ kode: "PC-03", ramGB: 16 });

try {
  console.log("Jumlah Unit :", inventarisLab.length);
  console.log("Kode Unit Pertama :", inventarisLab[0].kode);
  console.log("RAM Unit Ketiga   :", inventarisLab[2].ramGB, "GB");
} catch (error) {
  console.log("Terjadi gangguan pembacaan data:", error);
} finally {
  console.log("Status Pemeriksaan: Selesai.");
}''',
      codeOutput: '''Jumlah Unit : 3
Kode Unit Pertama : PC-01
RAM Unit Ketiga   : 16 GB
Status Pemeriksaan: Selesai.''',
      codeBreakdowns: [
        CodeBreakdown(
          snippet: 'let inventarisLab = [ { kode: "PC-01", ... }, ... ];',
          meaning: 'Struktur Array of Objects',
          functionDesc: 'Menggabungkan Array [ ] yang berisi beberapa Object { }. Struktur ini adalah format standar pertukaran data modern (JSON) di industri.',
        ),
        CodeBreakdown(
          snippet: 'inventarisLab.push({ kode: "PC-03", ramGB: 16 });',
          meaning: 'Metode Penambahan Elemen Array (.push)',
          functionDesc: 'Menyisipkan satu objek komputer baru ke posisi paling belakang daftar inventarisLab (menjadi indeks ke-2).',
        ),
        CodeBreakdown(
          snippet: 'inventarisLab[0].kode',
          meaning: 'Akses Indeks Array & Properti Object',
          functionDesc: 'Mengambil elemen pertama dari array (indeks 0), lalu mengakses nilai properti kode di dalamnya sehingga menghasilkan "PC-01".',
        ),
        CodeBreakdown(
          snippet: 'try { ... } catch (error) { ... } finally { ... }',
          meaning: 'Struktur Penanganan Eksepsi (Error Handling)',
          functionDesc: 'Menjalankan kode di dalam try dengan pengawasan. Jika muncul error, catch akan mengatasinya, dan blok finally selalu dijalankan di akhir.',
        ),
      ],
      criticalQuestion: 'Saat kamu sedang mengirim pesan di aplikasi WhatsApp di dalam lift lalu sinyal internet tiba-tiba terputus, mengapa aplikasi WhatsApp tidak langsung rusak/keluar sendiri (force close), melainkan hanya menampilkan ikon jam kecil dan otomatis mengirim ulang pesan saat sinyal kembali ada?',
      criticalAnalysis: 'Karena tim pengembang membungkus kode pengiriman jaringan dengan mekanisme Error Handling (try-catch). Ketika koneksi gagal (melempar Network Exception), blok catch menangkap kegagalan tersebut, menahan aplikasi agar tidak crash, mengubah status ikon pesan menjadi tertunda (pending), dan menjadwalkan pengiriman ulang ketika koneksi pulih.',
    ),
  ];

  void _openModuleReader(int index) {
    final module = _modules[index];

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return _ModuleReaderDialog(
          module: module,
          isAlreadyCompleted: index < globalCompletedModules,
          onComplete: () {
            setState(() {
              if (index == globalCompletedModules &&
                  globalCompletedModules < _modules.length) {
                globalCompletedModules++;
              }
            });
            Navigator.pop(dialogContext);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFF059669),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                content: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Modul 0${module.number} (${module.title}) telah diselesaikan!',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. LATAR BELAKANG DENGAN BLUR YANG DIKURANGI AGAR TETAP JERNIH
          Image.asset(
            'assets/images/bg/bg_jungle.png',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF0F172A)),
          ),
          ClipRect(
            child: BackdropFilter(
              // Blur dikurangi ke 3.5 agar pemandangan belakang tetap terlihat jelas
              filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
              child: Container(
                color: const Color(0xFF0F172A).withOpacity(0.28),
              ),
            ),
          ),

          // 2. KONTEN UTAMA
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER BAR CLEAN EDUTECH
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 14.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.45),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.white30, width: 1),
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MATERI PEMBELAJARAN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.2,
                                shadows: [
                                  Shadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Kurikulum Terstruktur Fundamental Pemrograman RPL / PPLG',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Indikator Penyelesaian Modul
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.white30),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.FactCheck_rounded,
                              color: Color(0xFF38BDF8),
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$globalCompletedModules / ${_modules.length} Modul Selesai',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // DAFTAR KARTU MODUL HORIZONTAL
                SizedBox(
                  height: 315,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _modules.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 20),
                    itemBuilder: (context, index) {
                      final module = _modules[index];
                      // Semua modul dibuka atau berurutan; di sini kita izinkan akses
                      // modul yang sudah terbuka (index <= globalCompletedModules)
                      final bool isCompleted = index < globalCompletedModules;
                      final bool isUnlocked = index <= globalCompletedModules;

                      return _buildModuleCard(
                        module: module,
                        index: index,
                        isCompleted: isCompleted,
                        isUnlocked: isUnlocked,
                      );
                    },
                  ),
                ),

                const Spacer(),

                // FOOTER PETUNJUK
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Geser ke kanan untuk menjelajahi seluruh modul pembelajaran',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
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

  Widget _buildModuleCard({
    required LearningModule module,
    required int index,
    required bool isCompleted,
    required bool isUnlocked,
  }) {
    final Color headerColor = isUnlocked
        ? module.themeColor
        : const Color(0xFF64748B);

    return InkWell(
      onTap: isUnlocked ? () => _openModuleReader(index) : null,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 255,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.22),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER WARNA KARTU
            Container(
              height: 108,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [headerColor, headerColor.withOpacity(0.75)],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -12,
                    bottom: -12,
                    child: Icon(
                      isUnlocked ? module.icon : Icons.lock_rounded,
                      size: 95,
                      color: Colors.white.withOpacity(0.14),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.22),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'MODUL 0${module.number}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                  if (isCompleted)
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: Color(0xFF059669),
                              size: 12,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'SELESAI',
                              style: TextStyle(
                                color: Color(0xFF059669),
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Center(
                    child: Icon(
                      isUnlocked ? module.icon : Icons.lock_outline_rounded,
                      size: 42,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // ISI KARTU
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          size: 12,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          module.duration,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      module.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: isUnlocked
                            ? const Color(0xFF0F172A)
                            : const Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isUnlocked ? module.subtitle : 'Selesaikan modul sebelumnya untuk membuka materi ini.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                        height: 1.4,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isUnlocked
                            ? () => _openModuleReader(index)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isUnlocked
                              ? module.themeColor.withOpacity(0.12)
                              : const Color(0xFFE2E8F0),
                          foregroundColor: isUnlocked
                              ? module.themeColor
                              : const Color(0xFF94A3B8),
                          disabledBackgroundColor: const Color(0xFFE2E8F0),
                          disabledForegroundColor: const Color(0xFF94A3B8),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          isUnlocked
                              ? (isCompleted
                                    ? 'PELAJARI ULANG'
                                    : 'MULAI BELAJAR')
                              : 'TERKUNCI',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.8,
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
      ),
    );
  }
}

// =============================================================================
// DIALOG PEMBACA MATERI BERGAYA CLEAN EDUTECH (RUANGGURU / ZENIUS STYLE)
// =============================================================================
class _ModuleReaderDialog extends StatefulWidget {
  final LearningModule module;
  final bool isAlreadyCompleted;
  final VoidCallback onComplete;

  const _ModuleReaderDialog({
    required this.module,
    required this.isAlreadyCompleted,
    required this.onComplete,
  });

  @override
  State<_ModuleReaderDialog> createState() => _ModuleReaderDialogState();
}

class _ModuleReaderDialogState extends State<_ModuleReaderDialog> {
  final TextEditingController _answerController = TextEditingController();
  bool _showCriticalAnalysis = false;

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.module;
    final screenSize = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        width: screenSize.width * 0.92,
        height: screenSize.height * 0.90,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 30,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          children: [
            // 1. HEADER STICKY
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: m.themeColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(m.icon, color: m.themeColor, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: m.themeColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'MODUL 0${m.number}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              m.duration,
                              style: const TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          m.title,
                          style: const TextStyle(
                            color: Color(0xFF0F172A),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF64748B),
                    ),
                    tooltip: 'Tutup Materi',
                  ),
                ],
              ),
            ),

            // 2. ISI MATERI LENGKAP (SCROLLABLE)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SUBTITLE BANNER
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: m.themeColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: m.themeColor.withOpacity(0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: m.themeColor,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              m.subtitle,
                              style: TextStyle(
                                color: m.themeColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // BAGIAN A: PENGERTIAN & KONSEP FUNDAMENTAL
                    _buildSectionHeader(
                      number: '01',
                      title: 'Pengertian & Konsep Fundamental',
                      color: m.themeColor,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: _cardDecoration(),
                      child: Text(
                        m.definition,
                        style: const TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 13.5,
                          height: 1.65,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // BAGIAN B: JENIS-JENIS & KLASIFIKASI
                    _buildSectionHeader(
                      number: '02',
                      title: 'Jenis-Jenis & Klasifikasi Utama',
                      color: m.themeColor,
                    ),
                    const SizedBox(height: 12),
                    ...m.types.map(
                      (t) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: _cardDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t.name,
                                style: const TextStyle(
                                  color: Color(0xFF0F172A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                t.description,
                                style: const TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 13,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F5F9),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFCBD5E1),
                                  ),
                                ),
                                child: Text(
                                  'Contoh: ${t.example}',
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // BAGIAN C: ANALOGI DALAM KEHIDUPAN SEHARI-HARI
                    _buildSectionHeader(
                      number: '03',
                      title: 'Analogi & Contoh dalam Kehidupan Sehari-hari',
                      color: m.themeColor,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFBBF7D0)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF16A34A).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.lightbulb_outline_rounded,
                              color: Color(0xFF15803D),
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              m.dailyLifeAnalogy,
                              style: const TextStyle(
                                color: Color(0xFF14532D),
                                fontSize: 13.5,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // BAGIAN D: STUDI KASUS DALAM KODE & OUTPUTNYA
                    _buildSectionHeader(
                      number: '04',
                      title: 'Studi Kasus Implementasi Kode & Output',
                      color: m.themeColor,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Skenario Studi Kasus:',
                            style: TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            m.caseStudyStory,
                            style: const TextStyle(
                              color: Color(0xFF475569),
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // KOTAK KODE EDITOR
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F172A),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF1E293B),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.code_rounded,
                                        color: Color(0xFF38BDF8),
                                        size: 16,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'studi_kasus.js — Kode Program',
                                        style: TextStyle(
                                          color: Color(0xFFCBD5E1),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SelectableText(
                                    m.codeExample,
                                    style: const TextStyle(
                                      fontFamily: 'monospace',
                                      color: Color(0xFFE2E8F0),
                                      fontSize: 13,
                                      height: 1.55,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),

                          // KOTAK OUTPUT TERMINAL
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFCBD5E1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.SubdirectoryArrowRight_rounded,
                                      size: 15,
                                      color: Color(0xFF059669),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'HASIL OUTPUT PROGRAM (TERMINAL):',
                                      style: TextStyle(
                                        color: Color(0xFF059669),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  m.codeOutput,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    color: Color(0xFF0F172A),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    height: 1.45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // BAGIAN E: BEDAH POTONGAN KODE (MAKNA & FUNGSINYA)
                    _buildSectionHeader(
                      number: '05',
                      title: 'Bedah Potongan Kode: Makna & Fungsinya',
                      color: m.themeColor,
                    ),
                    const SizedBox(height: 12),
                    ...m.codeBreakdowns.map(
                      (b) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: _cardDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F172A),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  b.snippet,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    color: Color(0xFF38BDF8),
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Makna Kode : ',
                                    style: TextStyle(
                                      color: Color(0xFF0F172A),
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      b.meaning,
                                      style: TextStyle(
                                        color: m.themeColor,
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Fungsi: ${b.functionDesc}',
                                style: const TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 12.5,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // BAGIAN F: 1 PERTANYAAN SINGKAT PEMANTIK BERPIKIR KRITIS
                    _buildSectionHeader(
                      number: '06',
                      title: 'Tantangan Berpikir Kritis (Kasus Sehari-hari)',
                      color: m.themeColor,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBEB),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFFDE68A),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.psychology_rounded,
                                color: Color(0xFFD97706),
                                size: 22,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'PERTANYAAN ANALISIS KRITIS',
                                style: TextStyle(
                                  color: Color(0xFFB45309),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            m.criticalQuestion,
                            style: const TextStyle(
                              color: Color(0xFF78350F),
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              height: 1.55,
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextField(
                            controller: _answerController,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF1E293B),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Tuliskan pendapat atau analisis singkatmu di sini...',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF94A3B8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xFFFCD34D),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xFFFCD34D),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _showCriticalAnalysis =
                                      !_showCriticalAnalysis;
                                });
                              },
                              icon: Icon(
                                _showCriticalAnalysis
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                size: 16,
                              ),
                              label: Text(
                                _showCriticalAnalysis
                                    ? 'Sembunyikan Kunci Analisis'
                                    : 'Periksa & Lihat Pembahasan Kritis',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFFB45309),
                                side: const BorderSide(
                                  color: Color(0xFFD97706),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          if (_showCriticalAnalysis) ...[
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFF59E0B),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Kunci Analisis Logika:',
                                    style: TextStyle(
                                      color: Color(0xFFB45309),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    m.criticalAnalysis,
                                    style: const TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 12.5,
                                      height: 1.55,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 3. FOOTER STICKY (TOMBOL TUTUP & TANDAI SELESAI)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                border: Border(
                  top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF64748B),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'TUTUP',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: widget.onComplete,
                    icon: const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 18,
                    ),
                    label: Text(
                      widget.isAlreadyCompleted
                          ? 'SELESAI DIPELAJARI'
                          : 'TANDAI SELESAI',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        letterSpacing: 0.6,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String number,
    required String title,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE2E8F0)),
    );
  }
}
