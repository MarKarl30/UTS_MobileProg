import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/card.dart';
import 'package:midterm_project/widgets/search_bar.dart';
import 'package:midterm_project/screens/top-up/tour/orchid_forest_screen.dart';
import 'package:midterm_project/screens/top-up/tour/dufan_screen.dart';

class ToursTopUpScreen extends StatefulWidget {
  const ToursTopUpScreen({super.key});

  @override
  _ToursTopUpScreenState createState() => _ToursTopUpScreenState();
}

class _ToursTopUpScreenState extends State<ToursTopUpScreen> {
  List<Map<String, dynamic>> tours = [
    {'name': 'Dufan Ancol', 'imagePath': 'assets/icons/tours/dufan.png'},
    {
      'name': 'Kidzania',
      'imagePath': 'assets/icons/tours/kidzania.png',
      'isAvailable': false
    },
    {
      'name': 'Orchid Forest',
      'imagePath': 'assets/icons/tours/orchid.png',
    },
    {
      'name': 'Wahoo',
      'imagePath': 'assets/icons/tours/wahoo.png',
      'isAvailable': false
    },
  ];

  List<Map<String, dynamic>> filteredTours = [];

  @override
  void initState() {
    super.initState();
    filteredTours = tours; // Initially show all platforms
  }

  void _searchTours(String query) {
    setState(() {
      filteredTours = tours.where((tour) {
        final nameLower = tour['name'].toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(199, 3, 25, 49),
        title: const Text("Tiiket Wisata",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 17,
            )),
      ),
      backgroundColor: const Color.fromARGB(199, 3, 25, 49),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SearchItem(onSearch: _searchTours), // Add search bar
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: filteredTours.map((tour) {
                return GestureDetector(
                  onTap: () {
                    if (tour['name'] == 'Orchid Forest') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrchidForestScreen(),
                        ),
                      );
                    }

                    if (tour['name'] == 'Dufan Ancol') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DufanAncolScreen(),
                        ),
                      );
                    }
                    // Add other tour navigation logic here
                  },
                  child: ItemCard(
                    name: tour['name'],
                    imagePath: tour['imagePath'],
                    isAvailable: tour['isAvailable'] ?? true,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
