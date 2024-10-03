import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/banner.dart';
import 'package:midterm_project/widgets/card.dart';
import 'package:midterm_project/widgets/search_bar.dart';
import 'package:midterm_project/screens/top-up/games/mobile-legends_top_up_screen.dart';
import 'package:midterm_project/screens/top-up/games/pubg_top_up_screen.dart';
import 'package:midterm_project/screens/top-up/games/genshin-impact_top_up_screen.dart';

class GamesTopUpScreen extends StatefulWidget {
  const GamesTopUpScreen({super.key});

  @override
  _GamesTopUpScreenState createState() => _GamesTopUpScreenState();
}

class _GamesTopUpScreenState extends State<GamesTopUpScreen> {
  List<Map<String, dynamic>> games = [
    {
      'name': 'Mobile Legends',
      'imagePath': 'assets/icons/games/mobile_legends.png'
    },
    {'name': 'PUBG Mobile', 'imagePath': 'assets/icons/games/pubg.png'},
    {
      'name': 'Genshin Impact',
      'imagePath': 'assets/icons/games/genshin_impact.png'
    },
    {
      'name': 'Growtopia',
      'imagePath': 'assets/icons/games/growtopia.png',
      'isAvailable': false
    },
    {
      'name': 'Honkai Impact 3rd',
      'imagePath': 'assets/icons/games/honkai_impact.png',
      'isAvailable': false
    },
    {
      'name': 'Free Fire',
      'imagePath': 'assets/icons/games/free_fire.png',
      'isAvailable': false
    },
    {
      'name': 'Honor of Kings',
      'imagePath': 'assets/icons/games/honor_of_kings.png',
      'isAvailable': false
    },
  ];

  List<Map<String, dynamic>> filteredGames = [];

  @override
  void initState() {
    super.initState();
    filteredGames = games;
  }

  void _searchGames(String query) {
    setState(() {
      filteredGames = games.where((game) {
        final nameLower = game['name'].toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(199, 3, 25, 49),
        title: const Text("Top Up Games",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 17,
            )),
      ),
      backgroundColor: const Color.fromARGB(199, 3, 25, 49),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            BannerSlideShow(
              imagePaths: [
                "assets/images/banner/games/promo1.png",
                "assets/images/banner/games/valorant.png",
              ],
            ),
            const SizedBox(height: 20),
            SearchItem(onSearch: _searchGames),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: filteredGames.map((game) {
                return GestureDetector(
                  onTap: () {
                    if (game['name'] == 'Mobile Legends') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobileLegendsTopUpScreen(),
                        ),
                      );
                    }

                    if (game['name'] == 'PUBG Mobile') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PubgTopUpScreen(),
                        ),
                      );
                    }

                    if (game['name'] == 'Genshin Impact') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenshinImpactTopUpScreen(),
                        ),
                      );
                    }
                  },
                  child: ItemCard(
                    name: game['name'],
                    imagePath: game['imagePath'],
                    isAvailable: game['isAvailable'] ?? true,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
