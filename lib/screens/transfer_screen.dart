import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
      toolbarHeight: 56,
      backgroundColor: const Color.fromARGB(255, 33, 150, 243),
      leading: BackButton(color: const Color.fromARGB(255, 255, 255, 255)),
    )));
  }
}
