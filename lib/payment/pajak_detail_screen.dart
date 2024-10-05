import 'package:flutter/material.dart';

import 'qrpayment_screen.dart'; // Tambahkan import untuk screen QR code

class PajakDetailScreen extends StatelessWidget {
  final String namaPajak;
  final String kodePajak;

  const PajakDetailScreen({
    Key? key,
    required this.namaPajak,
    required this.kodePajak,
  }) : super(key: key);

  // Fungsi untuk mendapatkan jumlah bayaran berdasarkan kode pajak
  String getBayaran(String kode) {
    switch (kode) {
      case '001':
        return 'Rp 1.000.000';
      case '002':
        return 'Rp 500.000';
      case '003':
        return 'Rp 250.000';
      case '004':
        return 'Rp 750.000';
      case '005':
        return 'Rp 300.000';
      case '006':
        return 'Rp 100.000';
      case '007':
        return 'Rp 150.000';
      case '008':
        return 'Rp 200.000';
      case '009':
        return 'Rp 50.000';
      case '010':
        return 'Rp 400.000';
      default:
        return 'Jumlah tidak tersedia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = getBayaran(kodePajak);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail $namaPajak',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme:
            IconThemeData(color: Colors.white), // Mengubah warna ikon kembali
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namaPajak,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Kode Pajak: $kodePajak',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Jumlah Bayaran: $totalAmount',
              style: const TextStyle(fontSize: 22, color: Colors.green),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QRCodeScreen(totalAmount: totalAmount),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Bayar Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
