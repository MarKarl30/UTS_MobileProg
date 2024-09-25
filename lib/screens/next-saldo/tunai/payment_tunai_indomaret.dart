import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/instructionItem_widget.dart';

import '/widgets/currency_formatter.dart';

class PaymentTunaiIndomaret extends StatefulWidget {
  const PaymentTunaiIndomaret({super.key});

  @override
  State<PaymentTunaiIndomaret> createState() => _PaymentTunaiIndomaretState();
}

class _PaymentTunaiIndomaretState extends State<PaymentTunaiIndomaret> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    // Membuat listener saat user memilih text field
    // atau sedang focus dalam text field
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Melakukan dispose pada controller dan focus node
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showErrorMessage() {
    // Mengeluarkan notifikasi saat user menekan
    // icon button next di text field
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Terjadi masalah, Coba lagi dalam beberapa saat.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: Colors.blueAccent,
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'Indomaret',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1.0),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nominal Top Up",
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontSize: 15,
                        ),
                      ),
                      TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          CurrencyInputFormatter(
                            decimalPlaces: 0,
                          ),
                        ],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Rp 0',
                          suffixIcon: _isTextFieldFocused
                              ? IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios),
                                  onPressed: () {
                                    // Mengeluarkan error saat icon next ditekan user
                                    _showErrorMessage();
                                  },
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Admin Fee: Rp 1.500",
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Minimum Top Up: Rp 10.000",
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(height: 10),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "Cara top up saldo di Indomaret",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const InstructionItem(
                          number: '1', text: 'Masukkan jumlah top up.'),
                      const InstructionItem(
                          number: '2',
                          text: 'Berikan kode pembayaran kepada kasir.'),
                      const InstructionItem(
                          number: '3', text: 'Bayar tagihan pembelian saldo.'),
                      const InstructionItem(
                          number: '4',
                          text: 'Saldo akan diterima dalam 1x24 jam.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
