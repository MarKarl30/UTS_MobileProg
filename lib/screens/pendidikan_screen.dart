import 'package:flutter/material.dart';

class PendidikanScreen extends StatefulWidget {
  const PendidikanScreen({super.key});

  @override
  _PendidikanScreenState createState() => _PendidikanScreenState();
}

class _PendidikanScreenState extends State<PendidikanScreen> {
  final TextEditingController _controller = TextEditingController();
  String _paymentAmount = '';

  void _checkPaymentCode() {
    if (_controller.text == '0000') {
      setState(() {
        _paymentAmount = 'Rp 200.000';
      });
    } else {
      setState(() {
        _paymentAmount = 'Kode salah';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran Pendidikan'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Masukkan Kode Pembayaran'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kode',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _checkPaymentCode,
              child: const Text('Next'),
            ),
            const SizedBox(height: 20),
            Text(_paymentAmount, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
