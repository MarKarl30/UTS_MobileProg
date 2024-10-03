import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:midterm_project/widgets/banner.dart';

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

  // Constants
  static const Color backgroundColor = Color.fromARGB(199, 3, 25, 49);
  static const Color buttonColor = Color.fromARGB(255, 24, 102, 228);
  static const Color textColor = Colors.white;
  static const Color greyTextColor = Colors.grey;

  void _confirmPurchase() {
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
                  Navigator.of(context).pop();
                } else {
                  _showErrorNotification();
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

  void _showErrorNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("PIN salah, coba lagi.")),
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
              const SizedBox(height: 20),

              // Date Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tanggal Kunjungan:',
                      style: TextStyle(color: textColor)),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                        selectedDate == null
                            ? 'Pilih Tanggal'
                            : DateFormat('dd/MM/yyyy').format(selectedDate!),
                        style: const TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Terms and Conditions
              _buildTermsAndConditionsSection(),
              const SizedBox(height: 20),

              // Ticket Quantity
              _buildTicketQuantitySection(),
              const SizedBox(height: 20),

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
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...widget.termsAndConditions.map((item) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• $item', style: const TextStyle(color: textColor)),
                  const SizedBox(height: 6), // Add spacing between items
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
              showAdditionalInfo ? 'Tutup Informasi' : 'Informasi Selengkapnya',
              style: TextStyle(
                color: buttonColor, // Use the same color as "Pilih Tanggal"
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          if (showAdditionalInfo) ...[
            const SizedBox(height: 10),
            const Text(
              'Cara Penggunaan E-Ticket:',
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...widget.additionalInfo.map((info) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• $info', style: const TextStyle(color: textColor)),
                    const SizedBox(height: 6), // Add spacing between items
                  ],
                )),
          ],
        ],
      ),
    );
  }

  Widget _buildTicketQuantitySection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 53, 85),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jumlah Tiket:',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Adult tickets section
          Row(
            children: [
              const Icon(Icons.person,
                  color: textColor), // Icon for adult tickets
              const SizedBox(width: 10),
              Text("Tiket Dewasa: ", style: TextStyle(color: textColor)),
              IconButton(
                icon: const Icon(Icons.remove, color: textColor),
                onPressed: () {
                  setState(() {
                    if (adultTickets > 0) adultTickets--;
                  });
                },
              ),
              Text('$adultTickets', style: TextStyle(color: textColor)),
              IconButton(
                icon: const Icon(Icons.add, color: textColor),
                onPressed: () {
                  setState(() {
                    adultTickets++;
                  });
                },
              ),
            ],
          ),
          // Price for adult tickets
          Text(
            'Rp. ${widget.adultTicketPrice}',
            style: TextStyle(color: textColor),
          ),
          const SizedBox(height: 10), // Spacing between sections

          // Child tickets section
          Row(
            children: [
              const Icon(Icons.child_care,
                  color: textColor), // Icon for child tickets
              const SizedBox(width: 10),
              Text("Tiket Anak: ", style: TextStyle(color: textColor)),
              IconButton(
                icon: const Icon(Icons.remove, color: textColor),
                onPressed: () {
                  setState(() {
                    if (childTickets > 0) childTickets--;
                  });
                },
              ),
              Text('$childTickets', style: TextStyle(color: textColor)),
              IconButton(
                icon: const Icon(Icons.add, color: textColor),
                onPressed: () {
                  setState(() {
                    childTickets++;
                  });
                },
              ),
            ],
          ),
          // Price for child tickets
          Text(
            'Rp. ${widget.childTicketPrice}',
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
