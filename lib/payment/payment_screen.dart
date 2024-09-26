import 'package:flutter/material.dart';

import 'bpjs_screen.dart';
import 'ecommerce_screen.dart';
import 'net_screen.dart';
import 'pajak_screen.dart';
import 'pendidikan_screen.dart';
import 'pln_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  void navigateToPajak(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PajakScreen()),
    );
  }

  void navigateToPendidikan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PendidikanScreen()),
    );
  }

  void navigateToBPJS(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BPJSScreen()),
    );
  }

  void navigateToNet(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NetScreen()),
    );
  }

  void navigateToEcommerce(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EcommerceScreen()),
    );
  }

  void navigateToPLN(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PLNScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconColumn(context, Icons.account_balance, 'Pajak',
                    () => navigateToPajak(context)),
                _buildIconColumn(context, Icons.school, 'Pendidikan',
                    () => navigateToPendidikan(context)),
                _buildIconColumn(context, Icons.local_hospital, 'BPJS',
                    () => navigateToBPJS(context)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconColumn(context, Icons.flash_on, 'PLN',
                    () => navigateToPLN(context)),
                _buildIconColumn(context, Icons.wifi, 'Internet',
                    () => navigateToNet(context)),
                _buildIconColumn(context, Icons.shopping_cart, 'E-commerce',
                    () => navigateToEcommerce(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconColumn(BuildContext context, IconData icon, String label,
      VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 50,
          onPressed: onPressed,
        ),
        Text(label),
      ],
    );
  }
}
