import 'package:flutter/material.dart';

// Opsi pembyaran via bank BCA
import 'package:midterm_project/screens/next-saldo/bank/BCA/payment_bca1.dart';
import 'package:midterm_project/screens/next-saldo/bank/BCA/payment_bca2.dart';
import 'package:midterm_project/screens/next-saldo/bank/BCA/payment_bca3.dart';
import 'package:midterm_project/screens/next-saldo/bank/BCA/payment_bca4.dart';
import 'package:midterm_project/screens/next-saldo/bank/BCA/payment_bca5.dart';

class PaymentBca extends StatelessWidget {
  const PaymentBca({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: Colors.blueAccent,
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'BCA',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Virtual Account (FREE for Tabungan)',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentBca1()),
                );
              },
            ),
            const Divider(height: 5),
            ListTile(
              title: const Text('m-banking',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentBca2()),
                );
              },
            ),
            const Divider(height: 5),
            ListTile(
              title: const Text('Internet banking',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentBca3()),
                );
              },
            ),
            const Divider(height: 5),
            ListTile(
              title: const Text('ATM',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentBca4()),
                );
              },
            ),
            const Divider(height: 5),
            ListTile(
              title: const Text('SIM Toolkit',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentBca5()),
                );
              },
            ),
            const Divider(height: 5),
          ],
        ),
      ),
    );
  }
}
