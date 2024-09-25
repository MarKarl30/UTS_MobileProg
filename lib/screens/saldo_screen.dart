import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/payment_option_widget.dart'; // Impor widget baru

// Pembayaran via bank
import 'next-saldo/bank/BCA/payment_bca.dart';
import 'next-saldo/bank/BNI/payment_bni.dart';
import 'next-saldo/bank/BRI/payment_bri.dart';
import 'next-saldo/bank/Jago/payment_jago.dart';
import 'next-saldo/bank/Mandiri/payment_mandiri.dart';
import 'next-saldo/bank/PermataBank/payment_permata.dart';

// Pembayaran tunai
import 'next-saldo/tunai/payment_tunai_alfamart.dart';
import 'next-saldo/tunai/payment_tunai_familymart.dart';
import 'next-saldo/tunai/payment_tunai_indomaret.dart';
import 'next-saldo/tunai/payment_tunai_lawson.dart';
import 'next-saldo/tunai/payment_tunai_tokopedia.dart';
import 'next-saldo/tunai/payment_tunai_alfamidi.dart';

class SaldoScreen extends StatefulWidget {
  const SaldoScreen({super.key});

  @override
  _SaldoScreenState createState() => _SaldoScreenState();
}

class _SaldoScreenState extends State<SaldoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: const Color(0xFFFF8FAB),
          leading: const BackButton(color: Colors.white),
          title: const Text(
            "Isi Saldo",
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
                // Payment Section Container
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bayar tunai",
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Di minimarket, warung atau agen terdekat",
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Baris pertama item pembayaran (Tunai)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/toko/icon_indomaret.png',
                            name: 'Indomaret',
                            pagePath: PaymentTunaiIndomaret(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/toko/icon_alfamart.png',
                            name: 'Alfamart',
                            pagePath: PaymentTunaiAlfamart(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/toko/icon_alfamidi.png',
                            name: 'Alfamidi',
                            pagePath: PaymentTunaiAlfamidi(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Baris kedua item pembayaran (Tunai)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/toko/icon_lawson.jpg',
                            name: 'Lawson',
                            pagePath: PaymentTunaiLawson(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/toko/icon_familymart.png',
                            name: 'FamilyMart',
                            pagePath: PaymentTunaiFamilymart(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/toko/icon_mitratoped.jpg',
                            name: 'Tokopedia',
                            pagePath: PaymentTunaiTokopedia(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container pembayaran via bank
                Container(
                  margin: const EdgeInsets.only(
                      top: 5.0, left: 15.0, right: 15.0, bottom: 20.0),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lewat bank",
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Dari ATM, mobile banking atau internet banking",
                        style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Baris pertama item pembayaran (Bank)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/bank/icon_bca.jpg',
                            name: 'BCA',
                            pagePath: PaymentBca(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/bank/icon_bri.png',
                            name: 'BRI',
                            pagePath: PaymentBri(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/bank/icon_bni.jpg',
                            name: 'BNI',
                            pagePath: PaymentBni(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Baris kedua item pembayaran (Bank)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/bank/icon_mandiri.png',
                            name: 'Mandiri',
                            pagePath: PaymentMandiri(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/bank/icon_jago.jpg',
                            name: 'Jago',
                            pagePath: PaymentJago(),
                          ),
                          PaymentOptionWidget(
                            assetPath: 'assets/icons/bank/icon_permata.jpg',
                            name: 'Permata',
                            pagePath: PaymentPermata(),
                          ),
                        ],
                      ),
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
