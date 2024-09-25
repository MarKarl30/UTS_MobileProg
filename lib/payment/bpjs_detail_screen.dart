import 'package:flutter/material.dart';

import 'payment_method_screen.dart'; // Tambahkan import untuk screen metode pembayaran

class BPJSDetailScreen extends StatelessWidget {
  final String namaBPJS;
  final String kodeBPJS;

  const BPJSDetailScreen({
    Key? key,
    required this.namaBPJS,
    required this.kodeBPJS,
  }) : super(key: key);

  // Fungsi untuk mendapatkan jumlah bayaran berdasarkan kode BPJS
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
      default:
        return 'Jumlah tidak tersedia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = getBayaran(kodeBPJS);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $namaBPJS'),
        backgroundColor: const Color(0xFFFF8FAB),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namaBPJS,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Kode BPJS: $kodeBPJS',
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
                    builder: (context) => PaymentMethodScreen(totalAmount: totalAmount),
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
