import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/games/top_up_item_widget.dart';

class MobileLegendsTopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data untuk Mobile Legends
    final List<String> categories = ['Diamonds', 'Starlight Membership'];
    final Map<String, List<Map<String, dynamic>>> topUpOptions = {
      'Diamonds': [
        {'name': '50 Diamonds', 'price': 13000},
        {'name': '100 Diamonds', 'price': 23000},
        {'name': '250 Diamonds', 'price': 46000},
        {'name': '500 Diamonds', 'price': 60000},
      ],
      'Starlight Membership': [
        {'name': '1 Month Membership', 'price': 30000},
        {'name': '3 Months Membership', 'price': 80000},
      ],
    };

    return GenericTopUpScreen(
      gameName: 'Mobile Legends',
      categories: categories,
      topUpOptions: topUpOptions,
      bannerImagePaths: [
        "assets/images/banner/games/mobile_legends/diamonds.png",
        "assets/images/banner/games/mobile_legends/starlight.png", // Add more images as needed
      ],
    );
  }
}
