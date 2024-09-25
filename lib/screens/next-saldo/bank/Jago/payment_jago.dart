import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/instructionItem_widget.dart';

class PaymentJago extends StatelessWidget {
  const PaymentJago({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: const Color(0xFFFF8FAB),
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'Jago',
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
                      'Cara isi saldo:',
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
                        number: '1', text: 'Login ke aplikasi Jago.'),
                    InstructionItem(
                        number: '2',
                        text:
                            'Di halaman Beranda, pilih Top Up e-Wallet > Kontak Baru > FundWallet.'),
                    InstructionItem(
                        number: '3',
                        text:
                            'Pilih kontak atau masukkan nomor telepon yang terdaftar pada aplikasi FundWallet.'),
                    InstructionItem(
                        number: '4',
                        text:
                            'Masukkan jumlah saldo FundWallet yang ingin diisi dan pilih Kantong sumber dana.'),
                    InstructionItem(
                        number: '5',
                        text:
                            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses pengisian saldo FundWallet .'),
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
