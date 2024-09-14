import 'package:flutter/material.dart';

class GamesTopUpScreen extends StatelessWidget {
  const GamesTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up Games",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
            )),
        backgroundColor: const Color.fromARGB(255, 158, 158, 158),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 19, 19, 19),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
          ),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              gameItem("Mobile Legends", "assets/images/mobile_legends.png"),
              gameItem("PUBG Mobile", "assets/images/pubg.png"),
              gameItem("Free Fire", "assets/images/free_fire.png"),
              gameItem("Growtopia", "assets/images/growtopia.png"),
              gameItem("Genshin Impact", "assets/images/genshin_impact.png"),
              gameItem("Honkai Impact", "assets/images/honkai_impact.png"),
              gameItem("Honor of Kings", "assets/images/honor_of_kings.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget gameItem(String name, String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 100, height: 80),
          const SizedBox(height: 10),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
