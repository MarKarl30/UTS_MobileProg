import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/ewallet/e_wallet_transfer_widget.dart';

class IsakuTopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan EWalletTransferWidget dengan parameter gambar
    return EWalletTransferWidget(
      bannerImage: "assets/images/banner/ewallet/isaku.png",
      backgroundColor: const Color.fromARGB(255, 76, 136, 188),
      uniqueCode: "3583",
    );
  }
}
