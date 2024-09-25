import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/instructionItem_widget.dart';

class PaymentTunaiAlfamart extends StatelessWidget {
  const PaymentTunaiAlfamart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: const Color(0xFFFF8FAB),
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'Alfamart',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Payment Info Container
              Container(
                padding: const EdgeInsets.all(18.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cara isi saldo via tunai:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'BIAYA ADMIN Rp 2.500, MINIMUM ISI Rp 10.000',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10), // spasi text
                    InstructionItem(
                        number: '1',
                        text: 'Minta bantuan kasir untuk isi saldo.'),
                    InstructionItem(
                        number: '2',
                        text: 'Berikan nomor HP yang terdaftar di akun Anda.'),
                    InstructionItem(
                        number: '3',
                        text: 'Berikan nominal saldo yang ingin diisi.'),
                    InstructionItem(
                        number: '4',
                        text:
                            'Lakukan pembayaran sesuai nominal saldo yang ingin diisi.'),
                    InstructionItem(
                        number: '5',
                        text: 'Kasir akan mengisi saldo ke akun e-wallet.'),
                    InstructionItem(
                        number: '6',
                        text:
                            'Simpan struk pembayaran sebagai bukti transaksi.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
