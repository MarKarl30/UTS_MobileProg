import 'package:flutter/material.dart';

class NextPaymentScreen extends StatelessWidget {
  final bool isSuccess;

  const NextPaymentScreen({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSuccess ? 'Pembayaran Berhasil' : 'Pembayaran Gagal'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          isSuccess
              ? 'Pembayaran Anda Berhasil!'
              : 'Saldo Anda Tidak Mencukupi!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
