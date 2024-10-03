import 'package:flutter/material.dart';
import 'package:midterm_project/screens/top-up/ewallet/ovo.dart';
import 'package:midterm_project/screens/top-up/ewallet/gopay.dart';
import 'package:midterm_project/screens/top-up/ewallet/isaku.dart';
import 'package:midterm_project/screens/top-up/ewallet/spay.dart';

class EWalletTopUpScreen extends StatelessWidget {
  const EWalletTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Color.fromARGB(200, 0, 0, 0)),
        backgroundColor: const Color.fromARGB(183, 233, 232, 232),
        title: const Text("Transaksi E-Wallet",
            style: TextStyle(
              fontWeight: FontWeight.w800,
            )),
      ),
      backgroundColor: const Color.fromARGB(243, 246, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                    color: const Color.fromARGB(255, 0, 0, 0), width: 3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 62, 62, 62).withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "E-Wallet",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Transfer cepat ke e-wallet lain",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      eWalletOption(context, "assets/icons/e-wallet/ovo.png",
                          OvoTopUpScreen()),
                      eWalletOption(context, "assets/icons/e-wallet/gopay.png",
                          GopayTopUpScreen()),
                      eWalletOption(context, "assets/icons/e-wallet/spay.png",
                          SpayTopUpScreen()),
                      eWalletOption(context, "assets/icons/e-wallet/isaku.png",
                          IsakuTopUpScreen()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eWalletOption(
      BuildContext context, String imagePath, Widget nextScreen) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective top-up screen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 100, height: 90),
        ],
      ),
    );
  }
}
