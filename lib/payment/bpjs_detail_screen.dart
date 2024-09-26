import 'package:flutter/material.dart';
import 'package:midterm_project/payment/qrpayment_screen.dart';

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
      case '201':
        return 'Rp 1.000.000';
      case '202':
        return 'Rp 500.000';
      case '203':
        return 'Rp 250.000';
      case '204':
        return 'Rp 750.000';
      case '205':
        return 'Rp 300.000';
      case '206':
        return 'Rp 100.000';
      case '207':
        return 'Rp 150.000';
      case '208':
        return 'Rp 200.000';
      case '209':
        return 'Rp 50.000';
      case '210':
        return 'Rp 400.000';
      default:
        return 'Jumlah tidak tersedia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = getBayaran(kodeBPJS);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail $namaBPJS',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namaBPJS,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
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
                    builder: (context) =>
                        QRCodeScreen(totalAmount: totalAmount),
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
