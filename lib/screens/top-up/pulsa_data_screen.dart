import 'package:flutter/material.dart';
import 'package:midterm_project/screens/home_screen.dart';

class PulsaDataTopUpScreen extends StatefulWidget {
  const PulsaDataTopUpScreen({super.key});

  @override
  _PulsaDataTopUpScreenState createState() => _PulsaDataTopUpScreenState();
}

class _PulsaDataTopUpScreenState extends State<PulsaDataTopUpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCategory = 'Pulsa';
  String _selectedAmount = '';
  final TextEditingController _pinController = TextEditingController();

  // List for items
  final List<Map<String, dynamic>> _pulsaOptions = [
    {'amount': 'Rp 10.000,00', 'icon': Icons.phone_iphone},
    {'amount': 'Rp 20.000,00', 'icon': Icons.phone_android},
    {'amount': 'Rp 50.000,00', 'icon': Icons.phone},
    {'amount': 'Rp 100.000,00', 'icon': Icons.phone_bluetooth_speaker},
  ];
  final List<Map<String, dynamic>> _dataOptions = [
    {'amount': 'AON 1GB - 15rb', 'icon': Icons.wifi},
    {'amount': 'AON 4GB - 50rb', 'icon': Icons.wifi_tethering},
    {'amount': 'AON 10GB - 100rb', 'icon': Icons.signal_wifi_4_bar},
    {'amount': 'Promo 2GB - 15rb', 'icon': Icons.signal_wifi_4_bar},
    {'amount': 'Promo 4GB - 40rb', 'icon': Icons.signal_wifi_4_bar},
    {'amount': 'Regular 2GB - 30rb', 'icon': Icons.signal_wifi_off},
    {'amount': 'Regular 5GB - 70rb', 'icon': Icons.signal_wifi_off},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.blue,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Pulsa & Data",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 10.0),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.blue),
                hintText: "No. Telp",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            // Category selection with icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                choiceChipWidget("Pulsa", Icons.sim_card),
                choiceChipWidget("Data", Icons.wifi),
              ],
            ),
            const SizedBox(height: 50.0),
            // List for top-up options
            Column(
              children: _selectedCategory == 'Pulsa'
                  ? _pulsaOptions.map((option) => topUpItem(option)).toList()
                  : _dataOptions.map((option) => topUpItem(option)).toList(),
            ),
            const SizedBox(height: 50.0),
            // Purchase confirmation
            TextField(
              controller: _pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.blue),
                hintText: "PIN",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // Purchase confirmation button
            ElevatedButton(
              onPressed: () {
                _confirmTopUp();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(15.0),
              ),
              child: const Text(
                "Konfirmasi",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget fot deciding which category is active now for more responsiveness
  Widget choiceChipWidget(String category, IconData icon) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white), // Icon for category
          const SizedBox(width: 5),
          Text(category),
        ],
      ),
      selected: _selectedCategory == category,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = category;
        });
      },
      selectedColor: Colors.blue,
      backgroundColor: Colors.blueGrey[800],
      labelStyle: const TextStyle(color: Colors.white),
    );
  }

  // Widget for items
  Widget topUpItem(Map<String, dynamic> option) {
    bool isSelected =
        _selectedAmount == option['amount']; // Check if this option is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAmount = option['amount'];
        });
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        color: isSelected ? Colors.blue[700] : Colors.blueGrey[800],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              // Circular checkmark icon
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Colors.green
                      : Colors.transparent, // Change color when selected
                  border: Border.all(
                    color: isSelected
                        ? Colors.green
                        : Colors.white, // Border color
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check,
                        color: Colors.white, size: 16) // Checkmark icon
                    : null, // No icon if not selected
              ),
              const SizedBox(width: 10),
              Text(
                option['amount'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Spacer(), // Spacing to push the text to the left
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white), // Arrow icon for selection indication
            ],
          ),
        ),
      ),
    );
  }

  void _confirmTopUp() {
    // Validate the input
    if (_phoneNumberController.text.isEmpty ||
        _selectedAmount.isEmpty ||
        _pinController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Harap lengkapi semua informasi!"),
            behavior: SnackBarBehavior.floating),
      );
      return;
    }

    // Validate for correct pin
    const String correctPin = '123456'; // Set the correct PIN here
    if (_pinController.text != correctPin) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("PIN yang dimasukkan salah!"),
            behavior: SnackBarBehavior.floating),
      );
      return;
    }

    // Display snackbar message for the succed item purchased
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Top-up $_selectedCategory sebesar $_selectedAmount berhasil!",
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );

    // Navigate to HomeScreen after a delay
    Future.delayed(const Duration(seconds: 0), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }
}
