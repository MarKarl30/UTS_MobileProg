import 'package:flutter/material.dart';
import 'package:midterm_project/top-up/pulsa-data/pulsa_data_screen.dart';
import 'package:midterm_project/top-up/games/games_screen.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
            )),
        backgroundColor: const Color.fromARGB(255, 158, 158, 158),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            // Container untuk layanan digital
            Container(
              margin: const EdgeInsets.only(bottom: 50.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 19, 19, 19),
                border: Border.all(color: Colors.grey.shade300, width: 2),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 158, 158, 158)
                        .withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Layanan Digital",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 25.0),
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
                        child: topUpItem(Icons.phone_android, 'Pulsa & Data'),
                      ),
                      topUpItem(Icons.account_balance_wallet, 'E-Money'),
                      topUpItem(Icons.card_giftcard, 'Voucher Game'),
                      topUpItem(Icons.swap_horiz, 'Transfer'),
                    ],
                  ),
                ],
              ),
            ),
            // Box untuk kategori Aktivitas & Hiburan
            Container(
              margin: const EdgeInsets.only(bottom: 40.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 19, 19, 19),
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255), width: 2),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 10,
                  ),
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
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 25.0),
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
                        child: topUpItem(Icons.videogame_asset, 'Games'),
                      ),
                      topUpItem(Icons.ondemand_video, 'Streaming'),
                      topUpItem(Icons.local_activity, 'Tiket Wisata'),
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

  Widget topUpItem(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, size: 30, color: const Color.fromARGB(255, 6, 236, 240)),
        const SizedBox(height: 10),
        Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            )),
      ],
    );
  }
}
