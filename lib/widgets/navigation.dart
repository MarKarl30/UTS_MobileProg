import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/history_screen.dart';
import '../screens/inbox_screen.dart';
import '../profile/profile.dart';

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
    const InboxScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screen,
        ),
        bottomNavigationBar: Container(
          color: currentIndex == 0 ? Colors.blueAccent : Colors.white,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                iconSize: 24,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                showUnselectedLabels: false,
                onTap: (index) => setState(() => currentIndex = index),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'Histori',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Notifikasi',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle), label: 'Profil')
                ],
              ),
            ),
          ),
        ));
  }
}
