import 'package:flutter/material.dart';

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

  // List untuk item Pulsa dan Data
  final List<String> _pulsaOptions = [
    'Rp 10.000,00',
    'Rp 20.000,00',
    'Rp 50.000,00',
    'Rp 100.000,00'
  ];
  final List<String> _dataOptions = [
    'AON 1GB - 15rb',
    'AON 4GB - 50rb',
    'AON 10GB - 100rb',
    'Promo 2GB - 15rb',
    'Promo 4GB - 40rb',
    'Regular 2GB - 30rb',
    'Regular 5GB - 70rb',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up Pulsa & Data"),
        backgroundColor: const Color.fromARGB(183, 233, 232, 232),
      ),
      backgroundColor: const Color.fromARGB(243, 246, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            // Input nomor telepon
            const SizedBox(height: 10.0),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone,
                    color: const Color.fromARGB(179, 40, 39, 39)),
                hintText: "No. Telp",
                hintStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                choiceChipWidget("Pulsa"),
                choiceChipWidget("Data"),
              ],
            ),
            const SizedBox(height: 20.0),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _selectedCategory == 'Pulsa'
                  ? _pulsaOptions.map((amount) => topUpItem(amount)).toList()
                  : _dataOptions.map((amount) => topUpItem(amount)).toList(),
            ),
            const SizedBox(height: 80.0),
            // Konfirmasi pembayaran
            const SizedBox(height: 10.0),
            TextField(
              controller: _pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.lock, color: const Color.fromARGB(179, 0, 0, 0)),
                hintText: "PIN",
                hintStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 60.0),

            //button untuk konfirmasi
            ElevatedButton(
              onPressed: () {
                // Aksi konfirmasi top-up
                _confirmTopUp();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                padding: const EdgeInsets.all(15.0),
              ),
              child: const Text(
                "Top-up Sekarang!",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //widget untuk menentukan category apa yang dipilih (pulsa dan data) secara interaktif
  Widget choiceChipWidget(String category) {
    return ChoiceChip(
      label: Text(category),
      selected: _selectedCategory == category,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = category;
        });
      },
      selectedColor: const Color.fromARGB(255, 111, 120, 118),
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      labelStyle: const TextStyle(color: Colors.white),
    );
  }

  //widget untuk item topup pulsa ataupun data
  Widget topUpItem(String amount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAmount = amount;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _selectedAmount == amount
              ? const Color.fromARGB(255, 44, 48, 48)
              : Color.fromARGB(255, 25, 25, 25),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _confirmTopUp() {
    // Memeriksa input apakah sudah valid sesuai dengan ketentuan untuk melakukan konfirmasi top-up
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

    //Menampilkan massage berupa item top-up yang berhasil dilakukan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            "Top-up $_selectedCategory sebesar $_selectedAmount berhasil!",
          ),
          behavior: SnackBarBehavior.floating),
    );
  }
}
