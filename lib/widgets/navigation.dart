import 'package:flutter/material.dart';
import '../screens/qr_code_scanner.dart';
import '../screens/home_screen.dart';
import '../screens/history_screen.dart';
import '../profile/profile.dart';
import '../screens/wallet/wallet_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screen = [
    const HomeScreen(),
    const HistoryScreen(),
    const QrCodeScanner(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: currentIndex,
        children: screen,
      ),
      bottomNavigationBar: Container(
        color: (currentIndex == 0)
            ? Colors.blueAccent
            : (currentIndex == 2)
                ? Colors.black54.withOpacity(0.0)
                : Colors.white,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomAppBar(
                height: 70,
                shape: const CircularNotchedRectangle(),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildNavBarItem(Icons.home, 'Home', 0),
                    buildNavBarItem(Icons.history, 'History', 1),
                    const SizedBox(width: 20),
                    buildNavBarItem(Icons.wallet_rounded, 'Wallet', 3),
                    buildNavBarItem(Icons.account_circle, 'Profile', 4),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.white,
          child: InkWell(
              onTap: () => _onItemTapped(2),
              child: const SizedBox(
                  width: 67,
                  height: 67,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.qr_code_2,
                          size: 30,
                          color: Colors.black,
                        ),
                        Text(
                          'Pay',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.black : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
                color: currentIndex == index ? Colors.black : Colors.grey),
          )
        ],
      ),
    );
  }
}
