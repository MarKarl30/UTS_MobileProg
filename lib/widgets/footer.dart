import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icons/social/instagram.png',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Image.asset(
                  'assets/icons/social/x.png',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Image.asset(
                  'assets/icons/social/tiktok.png',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "© 2024 . Properti milik FundWallet",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
