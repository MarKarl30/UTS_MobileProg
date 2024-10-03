import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/games/top_up_item_widget.dart';

class PubgTopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data untuk Pubg mobile
    final List<String> categories = ['UC', 'Season Pass'];
    final Map<String, List<Map<String, dynamic>>> topUpOptions = {
      'UC': [
        {'name': '50 UC', 'price': 13000},
        {'name': '100 UC', 'price': 23000},
        {'name': '250 UC', 'price': 46000},
        {'name': '500 UC', 'price': 60000},
      ],
      'Season Pass': [
        {'name': '1 Season', 'price': 30000},
        {'name': '3 Seasons', 'price': 80000},
      ],
    };

    return GenericTopUpScreen(
      gameName: 'PUBG',
      categories: categories,
      topUpOptions: topUpOptions,
      bannerImagePaths: [
        "assets/images/banner/games/pubg/uc.png",
        "assets/images/banner/games/pubg/season_pass.png", // Add more images as needed
      ],
    );
  }
}
