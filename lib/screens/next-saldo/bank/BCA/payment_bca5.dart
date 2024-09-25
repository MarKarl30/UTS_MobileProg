import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard
import 'package:midterm_project/widgets/instructionItem_widget.dart';

class PaymentBca5 extends StatelessWidget {
  const PaymentBca5({super.key});

  @override
  Widget build(BuildContext context) {
    // Snackar untuk menampilkan alert "Berhasil disalin"
    void showCopiedSnackbar(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil disalin'),
          duration: Duration(seconds: 2),
        ),
      );
    }

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
              // Box untuk nomor virtual account
              Container(
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1.0),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "VIRTUAL ACCOUNT NO.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "25001 08000000000",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Copy string No VA ke clipboard
                            Clipboard.setData(
                              const ClipboardData(text: "25001 08000000000"),
                            );

                            // Mengeluarkan alert "Berhasil disalin" saat tombol salin ditekan
                            showCopiedSnackbar(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          child: const Text(
                            'Salin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

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
                    SizedBox(height: 7), // spasi text
                    InstructionItem(number: '1', text: 'Pilih m-BCA.'),
                    InstructionItem(
                        number: '2', text: 'Pilih M-PAYMENT > OTHERS/LAINNYA.'),
                    InstructionItem(
                        number: '3', text: 'Ketik TVA lalu tekan OK.'),
                    InstructionItem(
                        number: '4',
                        text:
                            'Masukkan kode perusahaan untuk FundWallet: 25001 dan nomor HP yang terdaftar pada aplikasi FundWallet (contoh: 25001 0811XXXXXX)'),
                    InstructionItem(
                        number: '5',
                        text:
                            'Masukkan jumlah saldo FundWallet yang ingin diisi.'),
                    InstructionItem(
                        number: '6',
                        text: 'Masukkan PIN BCA kamu lalu tekan OK.'),
                    InstructionItem(
                        number: '7',
                        text: 'Kamu akan menerima SMS konfirmasi.'),
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
