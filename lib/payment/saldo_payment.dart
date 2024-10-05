import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan impor ini

class SaldoPaymentScreen extends StatefulWidget {
  final double totalAmount;

  SaldoPaymentScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  _SaldoPaymentScreenState createState() => _SaldoPaymentScreenState();
}

class _SaldoPaymentScreenState extends State<SaldoPaymentScreen> {
  double currentBalance = 500000.0;

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran Saldo',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saldo Anda:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  currencyFormat.format(currentBalance),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  currencyFormat.format(widget.totalAmount),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Spacer(), // Tambahkan Spacer di sini
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (currentBalance >= widget.totalAmount) {
                      currentBalance -= widget.totalAmount;
                      // Tampilkan notifikasi pembayaran berhasil
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pembayaran berhasil!'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      // Tampilkan notifikasi pembayaran gagal
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pembayaran gagal: Saldo tidak cukup'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Bayar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
