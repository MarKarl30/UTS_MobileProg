import 'package:flutter/material.dart';

class PaymentPermata extends StatelessWidget {
  const PaymentPermata({super.key});

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Fitur belum tersedia.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: const Color(0xFFFF8FAB),
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'PermataBank',
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
              _showErrorDialog(context);
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('m-banking',
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showErrorDialog(context);
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('Internet banking',
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showErrorDialog(context);
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('ATM',
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showErrorDialog(context);
            },
          ),
          const Divider(height: 5),
        ],
      ),
    ));
  }
}
