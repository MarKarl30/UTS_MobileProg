import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/streaming/top_up_item_widget.dart';

class ViuTopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data untuk Netflix
    final List<String> categories = [
      'Handphone',
      'Laptop',
      'TV',
      'Semua Device'
    ];
    final Map<String, List<Map<String, dynamic>>> topUpOptions = {
      'Handphone': [
        {'name': 'VIU Watch HD 780P', 'price': 40000},
        {'name': 'VIU Watch 1080P', 'price': 70000},
        {'name': 'VIU Watch 2K', 'price': 100000},
      ],
      'Laptop': [
        {'name': 'VIU Watch HD 780P', 'price': 50000},
        {'name': 'VIU Watch 1080P', 'price': 80000},
        {'name': 'VIU Watch 2K', 'price': 110000},
      ],
      'TV': [
        {'name': 'VIU Watch HD 780P', 'price': 70000},
        {'name': 'VIU Watch 1080P', 'price': 100000},
        {'name': 'VIU Watch 2K', 'price': 120000},
      ],
      'Semua Device': [
        {'name': 'VIU Watch HD 780P', 'price': 90000},
        {'name': 'VIU Watch 1080P', 'price': 120000},
        {'name': 'VIU Watch 2K', 'price': 150000},
      ],
    };

    return GenericTopUpScreen(
      streamName: 'VIU',
      categories: categories,
      topUpOptions: topUpOptions,
      bannerImagePaths: [
        "assets/images/banner/streamings/viu/viu1.png",
        "assets/images/banner/streamings/viu/viu2.png",
      ],
    );
  }
}
