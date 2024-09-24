import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../widgets/currency_formatter.dart';

class MintaSaldoScreen extends StatefulWidget {
  const MintaSaldoScreen({super.key});

  @override
  State<MintaSaldoScreen> createState() => _MintaSaldoScreenState();
}

class _MintaSaldoScreenState extends State<MintaSaldoScreen> {
  final TextEditingController jumlahController = TextEditingController();
  String qrData = '';

  void dispose() {
    // Clean up the controller when the widget is disposed.
    jumlahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
            'Minta dari QRIS',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        body: Center(
          heightFactor: 1.05,
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: [
                Center(
                  heightFactor: 1.3,
                  child: QrImageView(
                    data: qrData,
                    size: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Center(
                    child: TextField(
                      controller: jumlahController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [CurrencyInputFormatter()],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Jumlah Uang',
                        hintText: 'Tentukkan Jumlah',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      setState(() {
                        qrData = jumlahController.text;
                      });
                    },
                    child: const Text(
                      'KONFIRMASI',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
