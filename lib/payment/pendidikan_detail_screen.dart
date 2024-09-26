import 'package:flutter/material.dart';

import 'payment_method_screen.dart'; // Tambahkan import untuk screen metode pembayaran

class PendidikanDetailScreen extends StatelessWidget {
  final String namaPendidikan;
  final String kodePendidikan;

  const PendidikanDetailScreen({
    Key? key,
    required this.namaPendidikan,
    required this.kodePendidikan,
  }) : super(key: key);

  // Fungsi untuk mendapatkan jumlah bayaran berdasarkan kode pendidikan
  String getBayaran(String kode) {
    switch (kode) {
      case '101':
        return 'Rp 1.000.000';
      case '102':
        return 'Rp 500.000';
      case '103':
        return 'Rp 250.000';
      case '104':
        return 'Rp 750.000';
      case '105':
        return 'Rp 300.000';
      case '106':
        return 'Rp 100.000';
      default:
        return 'Jumlah tidak tersedia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = getBayaran(kodePendidikan);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $namaPendidikan'),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namaPendidikan,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Kode Pendidikan: $kodePendidikan',
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
                        PaymentMethodScreen(totalAmount: totalAmount),
                  ),
                );
              },
              child: const Text('Bayar Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
