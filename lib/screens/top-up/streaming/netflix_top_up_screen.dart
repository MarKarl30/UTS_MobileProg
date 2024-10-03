import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/streaming/top_up_item_widget.dart';

class NetflixTopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data untuk Netflix
    final List<String> categories = [
      'Handphone',
      'Laptop',
      'TV',
      'Laptop & Handphone',
      'Semua Device'
    ];
    final Map<String, List<Map<String, dynamic>>> topUpOptions = {
      'Handphone': [
        {'name': 'Paket HD 780P', 'price': 50000},
        {'name': 'Paket 1080P', 'price': 80000},
        {'name': 'Paket 2K', 'price': 100000},
      ],
      'Laptop': [
        {'name': 'Paket HD 780P', 'price': 60000},
        {'name': 'Paket 1080P', 'price': 90000},
        {'name': 'Paket 2K', 'price': 110000},
      ],
      'TV': [
        {'name': 'Paket HD 780P', 'price': 70000},
        {'name': 'Paket 1080P', 'price': 100000},
        {'name': 'Paket 2K', 'price': 120000},
      ],
      'Laptop & Handphone': [
        {'name': 'Paket HD 780P', 'price': 75000},
        {'name': 'Paket 1080P', 'price': 105000},
        {'name': 'Paket 2K', 'price': 125000},
      ],
      'Semua Device': [
        {'name': 'Paket HD 780P', 'price': 80000},
        {'name': 'Paket 1080P', 'price': 110000},
        {'name': 'Paket 2K', 'price': 130000},
      ],
    };

    return GenericTopUpScreen(
      streamName: 'Netflix',
      categories: categories,
      topUpOptions: topUpOptions,
      bannerImagePaths: [
        "assets/images/banner/streamings/netflix/netflix1.png",
        "assets/images/banner/streamings/netflix/netflix2.png",
      ],
    );
  }
}
