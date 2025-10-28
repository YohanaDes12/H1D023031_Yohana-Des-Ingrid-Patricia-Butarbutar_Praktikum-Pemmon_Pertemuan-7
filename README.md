### TUGAS-6-PERTEMUAN-7_PRAKTIKUM-PEMROGRAMAN-MOBILE

---
## 💻 Kalkulator Sederhana Berbasis Flutter UI
✨ Deskripsi Proyek Singkat

Aplikasi ini merupakan kalkulator aritmetika dasar yang dibangun menggunakan framework Flutter.
Aplikasi ini menampilkan antarmuka pengguna (User Interface) yang sederhana namun responsif, memungkinkan pengguna melakukan empat operasi matematika utama: penjumlahan, pengurangan, perkalian, dan pembagian.

Seluruh logika perhitungan serta komponen antarmuka (widget) diimplementasikan secara terpadu dalam satu file utama, yaitu main.dart.
Proyek ini cocok digunakan sebagai contoh dasar untuk memahami konsep dasar pengembangan aplikasi mobile dengan Flutter.

## 🙋 Identitas Pengembang

- **Nama:** Yohana Des Ingrid Patricia Butarbutar
- **NIM:** H1D023031
- **Program Studi:** Informatika
- **Universitas:** Universitas Jenderal Soedirman
- **Shift Awal:** A
- **Shift Baru:** E

## 🛠️ Struktur Kode dan Penjelasan Fungsi

Kode ini diorganisir dengan menggunakan konsep StatefulWidget khas Flutter, yang memungkinkan tampilan (UI) berubah sesuai kondisi data (state management).

1. Titik Masuk Aplikasi (main() dan KalkulatorApp)
void main() {
  runApp(const KalkulatorApp());
}


import 'package:flutter/material.dart';
Mengimpor pustaka utama Flutter yang digunakan untuk membangun UI.

KalkulatorApp (StatelessWidget)
Merupakan wadah utama aplikasi. Di dalamnya diatur pengaturan aplikasi seperti judul (title), tema visual (ThemeData), serta penghapusan label debug banner.

2. Pengelolaan Status (State Management)
class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});
  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _display = '0';
  double? _angkaPertama;
  String? _operator;
  bool _resetDisplay = false;
}


Bagian ini mengelola seluruh status aplikasi serta logika utama kalkulator.
Beberapa variabel penting:

_display digunakan untuk menampilkan angka pada layar kalkulator.

_angkaPertama menyimpan nilai operand pertama.

_operator menyimpan simbol operasi matematika (+, -, ×, ÷).

_resetDisplay menjadi indikator kapan tampilan perlu direset sebelum menerima input berikutnya.

3. Logika Interaksi Pengguna (Methods)
void _tekanAngka(String angka)


Digunakan untuk memperbarui nilai _display setiap kali pengguna menekan tombol angka atau titik desimal.
Menangani input seperti “.” agar tidak bisa diketik dua kali dan mencegah angka dimulai dengan nol kecuali nol itu sendiri.

void _hapus()


Mengembalikan semua variabel ke nilai awal. Fungsinya sama seperti tombol C (Clear) pada kalkulator biasa.

void _pilihOperator(String op)


Menyimpan angka pertama dan operator yang dipilih, kemudian menyiapkan tampilan untuk menerima angka kedua dengan mengatur _resetDisplay = true.

void _hitung()

Menjalankan perhitungan berdasarkan operator yang tersimpan dan angka kedua yang dimasukkan pengguna.
Menggunakan struktur switch untuk memilih operasi matematika yang sesuai.
Termasuk penanganan pembagian dengan nol, di mana hasilnya akan menampilkan “Error”.

4. Komponen Antarmuka (UI Building)

Widget _tombol(String teks, {Color? warna, void Function()? onTekan, int flex = 1})

Merupakan widget pembantu yang digunakan untuk membentuk tombol-tombol kalkulator.
Widget ini mengatur tampilan seperti warna, bentuk, ukuran, serta aksi yang terjadi saat tombol ditekan.

Widget build(BuildContext context)


Berfungsi menyusun keseluruhan tampilan aplikasi.
Menggunakan struktur Scaffold dengan komponen utama:

Bagian atas: menampilkan hasil perhitungan dalam Text, rata kanan, dengan font besar dan warna putih.

Bagian bawah: berisi kumpulan tombol yang ditata menggunakan kombinasi Column dan Row membentuk grid 4x4.
Tombol 0 diperluas lebarnya dengan flex: 2 untuk tampilan yang lebih proporsional.

## 🖼️ Tampilan Aplikasi

Aplikasi menggunakan tema gelap (dark theme) dengan skema warna berikut:

Tombol angka dan desimal: abu-abu muda

Tombol operator: biru

Tombol sama dengan (=): oranye

Tombol hapus (C): merah

**a. Layout tombol kalkulator:**

-------------------------------------------------
|   C (merah)  |  ÷ (biru)  |  × (biru)  |  - (biru)   |
-------------------------------------------------
|      7       |     8      |     9      |   + (biru)  |
-------------------------------------------------
|      4       |     5      |     6      |  = (oranye) |
-------------------------------------------------
|      1       |     2      |     3      |      .      |
-------------------------------------------------
|                0  (dua kolom lebar)                  |
-------------------------------------------------


**b. Tampilan visual di layar aplikasi:**

----------------------------------------------
|                                   0         |
|---------------------------------------------|
| [  C  ]  [  ÷  ]  [  ×  ]  [  -  ]          |
| [  7  ]  [  8  ]  [  9  ]  [  +  ]          |
| [  4  ]  [  5  ]  [  6  ]  [  =  ]          |
| [  1  ]  [  2  ]  [  3  ]  [  .  ]          |
| [             0  (lebar)             ]      |
----------------------------------------------

<img width="552" height="853" alt="image" src="https://github.com/user-attachments/assets/29a308b2-fd14-483f-83c5-cb0ceb869c76" />


## 🚀 Kesimpulan Pembelajaran

Proyek ini memberikan pemahaman mendasar dalam pengembangan aplikasi Flutter, khususnya pada aspek:

Pemanfaatan StatefulWidget untuk menciptakan UI dinamis yang merespons interaksi pengguna.

Penerapan logika kontrol program menggunakan struktur kondisi (if, switch) dalam proses perhitungan.

Penyusunan antarmuka responsif dengan kombinasi Column, Row, dan Expanded agar tata letak menyesuaikan ukuran layar.
