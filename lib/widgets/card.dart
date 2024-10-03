import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isAvailable;

  const ItemCard({
    Key? key,
    required this.name,
    required this.imagePath,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 146,
          height: 84,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 19, 19, 19),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.fill, // Mengisi seluruh container dengan stretch
                  color: isAvailable ? null : Colors.grey.withOpacity(0.7),
                  colorBlendMode: isAvailable ? null : BlendMode.dstATop,
                ),
                if (!isAvailable)
                  Container(
                    color: Colors.black.withOpacity(
                        0.7), // Lapisan gelap jika item tidak tersedia
                  ),
              ],
            ),
          ),
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
