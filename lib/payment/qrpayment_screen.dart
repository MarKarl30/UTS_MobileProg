import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'saldo_payment.dart';

class QRCodeScreen extends StatelessWidget {
  final String totalAmount;

  const QRCodeScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Pembayaran',
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
            Padding(
              padding: const EdgeInsets.only(
                  bottom:
                      20.0), // Menambahkan padding untuk memindahkan teks ke atas
              child: Text(
                'Scan QR Code untuk membayar',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            QrImageView(
              data: 'Total yang harus dibayar: $totalAmount',
              version: QrVersions.auto,
              size: 250.0,
            ),
            SizedBox(height: 20), // Menambahkan jarak antara QR code dan tombol
            ElevatedButton(
              onPressed: () {
                // Menghapus simbol mata uang dan pemisah ribuan
                String cleanedAmount =
                    totalAmount.replaceAll(RegExp(r'[^\d]'), '');
                double amount = double.parse(cleanedAmount);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SaldoPaymentScreen(
                      totalAmount: amount,
                    ),
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
              child: Text('Bayar dengan saldo'),
            ),
          ],
        ),
      ),
    );
  }
}
