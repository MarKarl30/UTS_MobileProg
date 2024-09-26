import 'package:flutter/material.dart';

import 'payment_method_screen.dart'; // Tambahkan import untuk screen metode pembayaran

class EcommerceDetailScreen extends StatelessWidget {
  final String namaEcommerce;
  final String kodeEcommerce;

  const EcommerceDetailScreen({
    Key? key,
    required this.namaEcommerce,
    required this.kodeEcommerce,
  }) : super(key: key);

  // Fungsi untuk mendapatkan jumlah bayaran berdasarkan kode eCommerce
  String getBayaran(String kode) {
    switch (kode) {
      case '501':
        return 'Rp 1.000.000';
      case '502':
        return 'Rp 500.000';
      case '503':
        return 'Rp 250.000';
      case '504':
        return 'Rp 750.000';
      case '505':
        return 'Rp 300.000';
      case '506':
        return 'Rp 100.000';
      case '507':
        return 'Rp 150.000';
      case '508':
        return 'Rp 200.000';
      case '509':
        return 'Rp 50.000';
      case '510':
        return 'Rp 400.000';
      default:
        return 'Jumlah tidak tersedia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = getBayaran(kodeEcommerce);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $namaEcommerce'),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namaEcommerce,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Kode eCommerce: $kodeEcommerce',
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
