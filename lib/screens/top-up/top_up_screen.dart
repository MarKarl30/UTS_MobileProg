import 'package:flutter/material.dart';
import 'package:midterm_project/screens/top-up/pulsa_data_screen.dart';
import 'package:midterm_project/screens/top-up/games_screen.dart';
import 'package:midterm_project/screens/top-up/streaming_screen.dart';
import 'package:midterm_project/screens/top-up/tours_screen.dart';
import 'package:midterm_project/screens/top-up/e_wallet_screen.dart';
import 'package:midterm_project/screens/top-up/e_money_screen.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(183, 233, 232, 232),
        title: const Text("Top Up",
            style: TextStyle(
              fontWeight: FontWeight.w800,
            )),
      ),
      backgroundColor: const Color.fromARGB(243, 246, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              width: double.infinity,
              height: 234,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/collaboration.png",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Steam Wallet Collaboration!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Mendatang pada 29 Oktober, 2024.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container untuk layanan digital
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              padding: const EdgeInsets.all(30),
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
                    "Layanan Digital",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Transaksi digital serba instan",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 35),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PulsaDataTopUpScreen()),
                          );
                        },
                        child: topUpLayananDigital(
                            Icons.phone_android, 'Pulsa & Data'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EWalletTopUpScreen()),
                          );
                        },
                        child: topUpLayananDigital(
                            Icons.account_balance_wallet, 'E-Wallet'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EMoneyTopUpScreen()),
                          );
                        },
                        child: topUpLayananDigital(Icons.money, 'E-Money'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Box untuk kategori Aktivitas & Hiburan
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 19, 19, 19),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 62, 62, 62)
                          .withOpacity(0.3)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Aktivitas & Hiburan",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Ngapain aja jadi lebih mudah",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 229, 224, 224)),
                  ),
                  const SizedBox(height: 35),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GamesTopUpScreen()),
                          );
                        },
                        child: topUpAktivitasHiburan(
                            Icons.videogame_asset, 'Games'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const StreamingsTopUpScreen()),
                          );
                        },
                        child: topUpAktivitasHiburan(
                            Icons.ondemand_video, 'Streaming'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ToursTopUpScreen()),
                          );
                        },
                        child: topUpAktivitasHiburan(
                            Icons.local_activity, 'Tiket Wisata'),
                      ),
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

  //widget untuk section top-up kategori layanan digital
  Widget topUpLayananDigital(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, size: 30, color: const Color.fromARGB(255, 0, 0, 0)),
        const SizedBox(height: 10),
        Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 120, 117, 117),
              fontSize: 12,
            )),
      ],
    );
  }

  //widget untuk section top-up kategori aktivitas dan hiburan
  Widget topUpAktivitasHiburan(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData,
            size: 30, color: const Color.fromARGB(255, 255, 255, 255)),
        const SizedBox(height: 10),
        Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 174, 171, 171),
              fontSize: 12,
            )),
      ],
    );
  }
}
