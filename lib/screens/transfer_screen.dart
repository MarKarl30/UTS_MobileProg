import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Transfer',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    ));
  }
}
