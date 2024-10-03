import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/games/top_up_item_widget.dart';

class GenshinImpactTopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data untuk Pubg mobile
    final List<String> categories = ['Primogems', 'Weekly Pass'];
    final Map<String, List<Map<String, dynamic>>> topUpOptions = {
      'Primogems': [
        {'name': '50 Primo', 'price': 13000},
        {'name': '100 Primo', 'price': 23000},
        {'name': '250 Primo', 'price': 46000},
        {'name': '500 Primo', 'price': 60000},
      ],
      'Weekly Pass': [
        {'name': '1 Week', 'price': 30000},
        {'name': '3 Weeks', 'price': 80000},
      ],
    };

    return GenericTopUpScreen(
      gameName: 'Genshin Impact',
      categories: categories,
      topUpOptions: topUpOptions,
      bannerImagePaths: [
        "assets/images/banner/games/genshin_impact/welkin.png",
        "assets/images/banner/games/genshin_impact/primogems.png", // Add more images as needed
      ],
    );
  }
}
