import 'package:flutter/material.dart';
import 'package:midterm_project/payment/qrpayment_screen.dart';

class NetDetailScreen extends StatelessWidget {
  final String namaNet;
  final String kodeNet;

  const NetDetailScreen({
    Key? key,
    required this.namaNet,
    required this.kodeNet,
  }) : super(key: key);

  // Fungsi untuk mendapatkan jumlah bayaran berdasarkan kode Net
  String getBayaran(String kode) {
    switch (kode) {
      case '401':
        return 'Rp 1.000.000';
      case '402':
        return 'Rp 500.000';
      case '403':
        return 'Rp 250.000';
      case '404':
        return 'Rp 750.000';
      case '405':
        return 'Rp 300.000';
      case '406':
        return 'Rp 100.000';
      case '407':
        return 'Rp 150.000';
      case '408':
        return 'Rp 200.000';
      case '409':
        return 'Rp 50.000';
      case '410':
        return 'Rp 400.000';
      default:
        return 'Jumlah tidak tersedia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = getBayaran(kodeNet);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail $namaNet',
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
              namaNet,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Kode Net: $kodeNet',
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
