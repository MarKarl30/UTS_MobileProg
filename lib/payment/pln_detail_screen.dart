import 'package:flutter/material.dart';
import 'package:midterm_project/payment/qrpayment_screen.dart';

class PLNDetailScreen extends StatelessWidget {
  final String namaPLN;
  final String kodePLN;

  const PLNDetailScreen({
    Key? key,
    required this.namaPLN,
    required this.kodePLN,
  }) : super(key: key);

  // Fungsi untuk mendapatkan jumlah bayaran berdasarkan kode PLN
  String getBayaran(String kode) {
    switch (kode) {
      case '301':
        return 'Rp 1.000.000';
      case '302':
        return 'Rp 500.000';
      case '303':
        return 'Rp 250.000';
      case '304':
        return 'Rp 750.000';
      case '305':
        return 'Rp 300.000';
      case '306':
        return 'Rp 100.000';
      case '307':
        return 'Rp 150.000';
      case '308':
        return 'Rp 200.000';
      case '309':
        return 'Rp 50.000';
      case '310':
        return 'Rp 400.000';
      default:
        return 'Jumlah tidak tersedia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = getBayaran(kodePLN);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail $namaPLN',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namaPLN,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Kode PLN: $kodePLN',
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
