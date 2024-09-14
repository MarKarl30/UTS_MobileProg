import 'package:flutter/material.dart';

import 'pendidikan_screen.dart';
import 'tagihan_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  void navigateToTagihan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TagihanScreen()),
    );
  }

  void navigateToPendidikan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PendidikanScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20), // Memberi jarak dari AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () => navigateToTagihan(context),
                      icon: const Icon(Icons.receipt),
                      iconSize: 50,
                    ),
                    const Text('Tagihan')
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () => navigateToPendidikan(context),
                      icon: const Icon(Icons.school),
                      iconSize: 50,
                    ),
                    const Text('Pendidikan')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
