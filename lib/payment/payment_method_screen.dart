import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String totalAmount;

  const PaymentMethodScreen({Key? key, required this.totalAmount})
      : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          _buildPaymentOption('BCA', 'assets/icons/bank/icon_bca.jpg'),
          _buildPaymentOption('Mandiri', 'assets/icons/bank/icon_mandiri.png'),
          _buildPaymentOption('OVO', 'assets/icons/e-wallet/ovo.png'),
          _buildPaymentOption('GoPay', 'assets/icons/e-wallet/gopay.png'),
          SizedBox(height: 20),
          Text(
            'Total yang harus dibayar: ${widget.totalAmount}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectedMethod.isEmpty
                ? null
                : () {
                    // Tambahkan logika untuk konfirmasi pembayaran
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Pembayaran dikonfirmasi'),
                          behavior: SnackBarBehavior.floating),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Background color biru
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: Text(
              'Confirm Payment',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
              height:
                  20), // Menambahkan SizedBox untuk memberikan jarak di bawah tombol
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String method, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: _selectedMethod == method ? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Radio<String>(
          value: method,
          groupValue: _selectedMethod,
          onChanged: (String? value) {
            setState(() {
              _selectedMethod = value!;
            });
          },
          activeColor: Colors.blue,
        ),
        title: Text(method),
        trailing: Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        onTap: () {
          setState(() {
            _selectedMethod = method;
          });
        },
      ),
    );
  }
}
