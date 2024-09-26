import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Pastikan impor ini ada

class QRCodeScreen extends StatelessWidget {
  final String totalAmount;

  const QRCodeScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Pembayaran',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme:
            IconThemeData(color: Colors.black), // Mengubah warna ikon kembali
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
              data:
                  'Total yang harus dibayar: $totalAmount', // Pastikan parameter ini benar
              version: QrVersions.auto,
              size: 250.0,
            ),
          ],
        ),
      ),
    );
  }
}
