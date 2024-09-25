import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/instructionItem_widget.dart';

class PaymentBca1 extends StatelessWidget {
  const PaymentBca1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: Colors.blueAccent,
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'BCA',
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
                      'Cara isi saldo via bank:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'BIAYA ADMIN GRATIS, MINIMUM ISI Rp 10.000',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10), // spasi text
                    InstructionItem(
                        number: '1',
                        text: 'Pilih opsi transfer di aplikasi BCA.'),
                    InstructionItem(
                        number: '2',
                        text: 'Ketik jumlah nominal yang mau di top up.'),
                    InstructionItem(number: '3', text: 'Klik review transfer.'),
                    InstructionItem(
                        number: '4',
                        text: 'Klik pilih metode dan pilih Virtual Account.'),
                    InstructionItem(
                        number: '5',
                        text: 'Pilih VA yang sama dengan akun anda.'),
                    InstructionItem(
                        number: '6', text: 'Tekan tombol transfer.'),
                    InstructionItem(
                        number: '7',
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
