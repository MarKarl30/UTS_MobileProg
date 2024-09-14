import 'package:flutter/material.dart';

class TagihanScreen extends StatefulWidget {
  const TagihanScreen({super.key});

  @override
  _TagihanScreenState createState() => _TagihanScreenState();
}

class _TagihanScreenState extends State<TagihanScreen> {
  final TextEditingController _controller = TextEditingController();
  String _paymentAmount = '';

  void _checkPaymentCode() {
    if (_controller.text == '0000') {
      setState(() {
        _paymentAmount = 'Rp 100.000';
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
        title: const Text('Pembayaran Tagihan'),
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
