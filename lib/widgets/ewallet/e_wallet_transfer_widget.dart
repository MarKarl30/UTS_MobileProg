import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/navigation.dart';

class EWalletTransferWidget extends StatefulWidget {
  final String bannerImage;
  final Color backgroundColor;
  final String uniqueCode;

  EWalletTransferWidget({
    required this.bannerImage,
    required this.backgroundColor,
    required this.uniqueCode,
  });

  @override
  _EWalletTransferWidgetState createState() => _EWalletTransferWidgetState();
}

class _EWalletTransferWidgetState extends State<EWalletTransferWidget> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  bool _isBalanceVisible = true; // Toggles balance visibility
  final String _balance = "50.000,00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Color.fromARGB(199, 255, 255, 255)),
        title: const Text("Transfer E-Wallet",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            )),
        backgroundColor: widget.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: widget.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner image
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    widget.bannerImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                // Display balance with toggle visibility
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: widget.backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _isBalanceVisible ? "Rp $_balance" : "Rp ****",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isBalanceVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isBalanceVisible = !_isBalanceVisible;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Input field for e-wallet account number
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 219, 226, 228),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nomor Akun Tujuan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(widget.uniqueCode,
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _accountController,
                              keyboardType:
                                  TextInputType.number, // Allow only numbers
                              decoration: InputDecoration(
                                hintText: "Nomor",
                                prefixIcon: const Icon(Icons
                                    .account_circle), // Icon for account number
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Input field for transfer amount
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 219, 226, 228),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Jumlah Transfer",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Rp.",
                          prefixIcon: const Icon(Icons.money),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Transfer button
                ElevatedButton(
                  onPressed: () {
                    _showTransactionDetails(context);
                  },
                  child: const Text('Transfer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Show transaction details in a bottom sheet
  void _showTransactionDetails(BuildContext context) {
    final double amount = double.tryParse(
            _amountController.text.replaceAll('.', '').replaceAll(',', '.')) ??
        0; // Convert amount to double

    // Check if account number is numeric
    final String accountNumber = _accountController.text;
    final bool isAccountNumberValid = RegExp(r'^[0-9]+$')
        .hasMatch(accountNumber); // Regex to check for numeric values

    if (accountNumber.isNotEmpty && isAccountNumberValid && amount >= 10000) {
      // Proceed if all validations pass
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Detail Transaksi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("Jumlah Transfer: Rp ${_amountController.text}"),
                const Text("Biaya Admin: Rp 2.000,00"),
                const SizedBox(height: 20),

                // PIN input field
                const Text("Masukkan PIN", style: TextStyle(fontSize: 16)),
                TextField(
                  controller: _pinController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "PIN",
                  ),
                ),
                const SizedBox(height: 20),

                // Confirmation button
                ElevatedButton(
                  onPressed: () {
                    _handleConfirmTransaction(context);
                  },
                  child: const Text('Konfirmasi'),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Prepare error messages based on the invalid input
      String message = "";
      if (accountNumber.isEmpty) {
        message = "Harap isi nomor akun tujuan";
      } else if (!isAccountNumberValid) {
        message = "Nomor akun tujuan hanya boleh berupa angka";
      } else if (amount < 10000) {
        message = "Jumlah transfer minimal Rp 10.000,00";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  // Handle transaction confirmation logic
  void _handleConfirmTransaction(BuildContext context) {
    final String pin = _pinController.text;

    if (pin.isNotEmpty && pin == "1234") {
      // Validate pin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Berhasil mentransfer Rp ${_amountController.text} ke akun ${_accountController.text}",
          ),
        ),
      );

      // Redirect user to HomeScreen after succeed doing transaction
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Navigation(),
        ),
      );
    } else if (pin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Harap masukkan PIN")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("PIN yang anda masukkan salah, harap coba lagi"),
        ),
      );
    }
  }
}
