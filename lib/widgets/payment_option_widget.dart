import 'package:flutter/material.dart';

class PaymentOptionWidget extends StatelessWidget {
  final String assetPath;
  final String name;
  final Widget pagePath;

  const PaymentOptionWidget({
    Key? key,
    required this.assetPath,
    required this.name,
    required this.pagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromARGB(255, 250, 248, 248),
            ),
            child: SizedBox(
              width: 65,
              height: 65,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pagePath),
                  );
                },
                icon: Image.asset(assetPath),
                iconSize: 50,
              ),
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: Color.fromARGB(150, 0, 0, 0),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
