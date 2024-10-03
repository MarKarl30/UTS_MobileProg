import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/ewallet/e_wallet_transfer_widget.dart';

class GopayTopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan EWalletTransferWidget dengan parameter gambar
    return EWalletTransferWidget(
      bannerImage: "assets/images/banner/ewallet/gopay.png",
      backgroundColor: const Color.fromARGB(255, 30, 110, 137),
      uniqueCode: "GPY12",
    );
  }
}
