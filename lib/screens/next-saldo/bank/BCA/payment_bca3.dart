import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/instructionItem_widget.dart';

class PaymentBca3 extends StatelessWidget {
  const PaymentBca3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: const Color(0xFFFF8FAB),
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
                      'BIAYA ADMIN Rp 1.000, MINIMUM ISI Rp 10.000',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10), // spasi text
                    InstructionItem(number: '1', text: 'Login ke KLIK BCA.'),
                    InstructionItem(
                        number: '2',
                        text:
                            'Pilih FUND TRANSFER > TRANSFER TO BCA VIRTUAL ACCOUNT.'),
                    InstructionItem(
                        number: '3',
                        text:
                            'Masukkan kode perusahaan untuk FundWallet: 25001 dan nomor HP yang terdaftar pada aplikasi FundWallet (contoh: 25001 0811XXXXXX).'),
                    InstructionItem(
                        number: '4',
                        text:
                            'Masukkan jumlah saldo FundWallet yang ingin diisi.'),
                    InstructionItem(
                        number: '5',
                        text:
                            'Ikuti petunjuk selanjutnya untuk menyelesaikan proses pengisian saldo FundWallet.'),
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
