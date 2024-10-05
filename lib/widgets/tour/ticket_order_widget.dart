import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:midterm_project/widgets/banner.dart';
import 'package:midterm_project/widgets/footer.dart';
import 'package:midterm_project/screens/home_screen.dart';

class GenericTourScreen extends StatefulWidget {
  final String tourName;
  final String location;
  final List<String> bannerImagePaths;
  final String operationalHours;
  final List<String> termsAndConditions;
  final List<String> additionalInfo;
  final double adultTicketPrice; // Added ticket prices
  final double childTicketPrice;

  const GenericTourScreen({
    Key? key,
    required this.tourName,
    required this.location,
    required this.bannerImagePaths,
    required this.operationalHours,
    required this.termsAndConditions,
    required this.additionalInfo,
    required this.adultTicketPrice, // Added ticket prices
    required this.childTicketPrice,
  }) : super(key: key);

  @override
  _GenericTourScreenState createState() => _GenericTourScreenState();
}

class _GenericTourScreenState extends State<GenericTourScreen> {
  int adultTickets = 0;
  int childTickets = 0;
  final TextEditingController _pinController = TextEditingController();
  final String pin = "1234"; // Example PIN
  bool showAdditionalInfo = false;
  DateTime? selectedDate;
  final TextEditingController _emailController = TextEditingController();

  // Constants
  static const Color backgroundColor = Color.fromARGB(199, 3, 25, 49);
  static const Color buttonColor = Color.fromARGB(255, 24, 102, 228);
  static const Color textColor = Colors.white;
  static const Color greyTextColor = Colors.grey;

  void _confirmPurchase() {
    // Validate inputs
    if (selectedDate == null) {
      _showErrorNotification("Tanggal kunjungan harus dipilih.");
      return;
    }
    if (adultTickets + childTickets == 0) {
      _showErrorNotification("Minimal satu tiket harus dibeli.");
      return;
    }
    if (_emailController.text.isEmpty) {
      _showErrorNotification("Email harus diisi.");
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        final totalPrice = (adultTickets * widget.adultTicketPrice) +
            (childTickets * widget.childTicketPrice);
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: const Text("Konfirmasi Pembayaran",
              style: TextStyle(color: textColor)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Tanggal Kunjungan: ${DateFormat('dd/MM/yyyy').format(selectedDate ?? DateTime.now())}",
                  style: TextStyle(color: textColor)),
              const SizedBox(height: 10),
              if (adultTickets > 0)
                Text(
                    "Tiket Dewasa: $adultTickets x ${widget.adultTicketPrice} : Rp.  ${adultTickets * widget.adultTicketPrice}",
                    style: TextStyle(color: textColor)),
              const SizedBox(height: 5),
              if (childTickets > 0)
                Text(
                    "Tiket Anak: $childTickets x ${widget.childTicketPrice} : Rp. ${childTickets * widget.childTicketPrice}",
                    style: TextStyle(color: textColor)),
              const SizedBox(height: 20),
              Text("Total: Rp. $totalPrice",
                  style: TextStyle(color: textColor)),
              const SizedBox(height: 40),
              TextField(
                controller: _pinController,
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Masukkan PIN',
                  labelStyle: TextStyle(color: textColor),
                  filled: true,
                  fillColor: buttonColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_pinController.text == pin) {
                  _showSuccessNotification();
                  // Navigate to HomeScreen
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(), // Replace with your HomeScreen
                  ));
                } else {
                  _showErrorNotification("PIN salah, coba lagi.");
                  Navigator.of(context).pop();
                }
              },
              child:
                  const Text("Konfirmasi", style: TextStyle(color: textColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal", style: TextStyle(color: textColor)),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Pembayaran berhasil!")),
    );
  }

  void _showErrorNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tourName,
            style: const TextStyle(
                color: textColor, fontWeight: FontWeight.w800, fontSize: 17)),
        leading: const BackButton(color: textColor),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner
              BannerSlideShow(imagePaths: widget.bannerImagePaths),
              const SizedBox(height: 20),

              // Location and Operational Hours
              Text(widget.location,
                  style: const TextStyle(color: textColor, fontSize: 20)),
              const SizedBox(height: 10),
              Text('Jam Operasional: Setiap hari, ${widget.operationalHours}',
                  style: const TextStyle(color: greyTextColor)),
              const SizedBox(height: 50),

              // Date Picker with Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tanggal Kunjungan:',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.blue),
                    onPressed: () => _selectDate(context),
                  ),
                  Text(
                      selectedDate == null
                          ? ''
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                      style: const TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 50),

              // Email input with Icon
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Email',
                  labelStyle: TextStyle(color: textColor),
                  filled: true,
                  fillColor: const Color.fromARGB(248, 48, 90, 154),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.email,
                      color: textColor), // Email icon added here
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 50),

              // Terms and Conditions
              _buildTermsAndConditionsSection(),
              const SizedBox(height: 50),

              // Ticket Quantity
              _buildTicketQuantitySection(),
              const SizedBox(height: 30),

              // Buy Ticket Button
              ElevatedButton(
                onPressed: _confirmPurchase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text("Beli Tiket",
                    style: TextStyle(color: textColor)),
              ),
              const SizedBox(height: 100),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditionsSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Syarat dan Ketentuan:',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 30),
          ...widget.termsAndConditions.map((item) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '- $item',
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(height: 5),
                ],
              )),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              setState(() {
                showAdditionalInfo = !showAdditionalInfo;
              });
            },
            child: Text(
              showAdditionalInfo ? 'Sembunyikan' : 'Lihat lebih lanjut',
              style: TextStyle(color: buttonColor),
            ),
          ),
          if (showAdditionalInfo) ...[
            const Text(
              'Informasi Tambahan:',
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...widget.additionalInfo.map((info) => Text(
                  '- $info',
                  style: TextStyle(color: textColor),
                )),
          ],
        ],
      ),
    );
  }

  Widget _buildTicketQuantitySection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color.fromARGB(249, 19, 45, 84),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Opsi Tiket',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTicketCounter("Dewasa", adultTickets, (value) {
                setState(() {
                  adultTickets = value;
                });
              }, Icons.person),
              _buildTicketCounter("Anak", childTickets, (value) {
                setState(() {
                  childTickets = value;
                });
              }, Icons.child_care),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCounter(
      String title, int count, ValueChanged<int> onChanged, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon,
                color: textColor), // Display the icon for each ticket type
            const SizedBox(width: 8), // Spacing between icon and title
            Text(title, style: const TextStyle(color: textColor, fontSize: 16)),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove,
                  color: Colors.red), // Red for subtraction
              onPressed: () {
                if (count > 0) {
                  onChanged(count - 1);
                }
              },
            ),
            Text(count.toString(),
                style: const TextStyle(color: textColor, fontSize: 20)),
            IconButton(
              icon: const Icon(Icons.add,
                  color: Colors.green), // Green for addition
              onPressed: () {
                onChanged(count + 1);
              },
            ),
          ],
        ),
      ],
    );
  }
}
