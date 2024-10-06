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
        toolbarHeight: 56,
        backgroundColor: Colors.blueAccent,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Top Up",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
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
                        color: Colors.black.withOpacity(0.35),
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

            // Container for layanan digital
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: const Color.fromARGB(255, 0, 0, 0), width: 1),
                borderRadius: BorderRadius.circular(20),
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
            // container for aktivitas & hiburan
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: const Color.fromARGB(241, 3, 25, 49),
                borderRadius: BorderRadius.circular(20),
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

  //widget for section tup up layanan digital
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

  //widget for section top-up aktivitas & hiburan category
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
