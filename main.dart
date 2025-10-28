import 'package:flutter/material.dart';



void main() {

  runApp(const KalkulatorApp());

}



class KalkulatorApp extends StatelessWidget {

  const KalkulatorApp({super.key});



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Kalkulator Sederhana',

      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),

      home: const KalkulatorPage(),

    );

  }

}



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



  void _tekanAngka(String angka) {

    setState(() {

      if (_resetDisplay) {

        _display = '0';

        _resetDisplay = false;

      }

      if (_display == '0' && angka != '.') {

        _display = angka;

      } else {

        if (angka == '.' && _display.contains('.')) return;

        _display += angka;

      }

    });

  }



  void _hapus() {

    setState(() {

      _display = '0';

      _angkaPertama = null;

      _operator = null;

      _resetDisplay = false;

    });

  }



  void _pilihOperator(String op) {

    setState(() {

      _angkaPertama = double.tryParse(_display);

      _operator = op;

      _resetDisplay = true;

    });

  }



  void _hitung() {

    if (_operator == null || _angkaPertama == null) return;

    double angkaKedua = double.tryParse(_display) ?? 0;

    double hasil = 0;



    switch (_operator) {

      case '+':

        hasil = _angkaPertama! + angkaKedua;

        break;

      case '-':

        hasil = _angkaPertama! - angkaKedua;

        break;

      case '×':

        hasil = _angkaPertama! * angkaKedua;

        break;

      case '÷':

        if (angkaKedua == 0) {

          _display = 'Error';

          _resetDisplay = true;

          setState(() {});

          return;

        }

        hasil = _angkaPertama! / angkaKedua;

        break;

    }



    setState(() {

      _display = hasil.toString().replaceAll(RegExp(r'\.0$'), '');

      _angkaPertama = null;

      _operator = null;

      _resetDisplay = true;

    });

  }



  Widget _tombol(String teks, {Color? warna, void Function()? onTekan, int flex = 1}) {

    return Expanded(

      flex: flex,

      child: Padding(

        padding: const EdgeInsets.all(6.0),

        child: ElevatedButton(

          onPressed: onTekan,

          style: ElevatedButton.styleFrom(

            backgroundColor: warna ?? Colors.grey[200],

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

            padding: const EdgeInsets.all(20),

          ),

          child: Text(

            teks,

            style: TextStyle(fontSize: 24, color: warna == null ? Colors.black : Colors.white),

          ),

        ),

      ),

    );

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      body: SafeArea(

        child: Column(

          children: [

            // Tampilan layar kalkulator

            Expanded(

              child: Container(

                alignment: Alignment.bottomRight,

                padding: const EdgeInsets.all(24),

                child: Text(

                  _display,

                  style: const TextStyle(fontSize: 48, color: Colors.white),

                ),

              ),

            ),



            // Tombol-tombol kalkulator

            Column(

              children: [

                Row(

                  children: [

                    _tombol('C', warna: Colors.red, onTekan: _hapus),

                    _tombol('÷', warna: Colors.blue, onTekan: () => _pilihOperator('÷')),

                    _tombol('×', warna: Colors.blue, onTekan: () => _pilihOperator('×')),

                    _tombol('-', warna: Colors.blue, onTekan: () => _pilihOperator('-')),

                  ],

                ),

                Row(

                  children: [

                    _tombol('7', onTekan: () => _tekanAngka('7')),

                    _tombol('8', onTekan: () => _tekanAngka('8')),

                    _tombol('9', onTekan: () => _tekanAngka('9')),

                    _tombol('+', warna: Colors.blue, onTekan: () => _pilihOperator('+')),

                  ],

                ),

                Row(

                  children: [

                    _tombol('4', onTekan: () => _tekanAngka('4')),

                    _tombol('5', onTekan: () => _tekanAngka('5')),

                    _tombol('6', onTekan: () => _tekanAngka('6')),

                    _tombol('=', warna: Colors.orange, onTekan: _hitung),

                  ],

                ),

                Row(

                  children: [

                    _tombol('1', onTekan: () => _tekanAngka('1')),

                    _tombol('2', onTekan: () => _tekanAngka('2')),

                    _tombol('3', onTekan: () => _tekanAngka('3')),

                    _tombol('.', onTekan: () => _tekanAngka('.')),

                  ],

                ),

                Row(

                  children: [

                    _tombol('0', flex: 2, onTekan: () => _tekanAngka('0')),

                  ],

                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

}