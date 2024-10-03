import 'package:flutter/material.dart';

class EWalletTransferWidget extends StatefulWidget {
  final String bannerImage; // Banner image for the wallet
  final Color backgroundColor; // Background color for the UI
  final String uniqueCode; // Unique code for each e-wallet

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
  final String _balance = "50.000,00"; // Example balance

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
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 228, 220, 220)
                            .withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(9, 9),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Nomor Akun Tujuan",
                          style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Text(widget.uniqueCode,
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _accountController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: "Nomor",
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
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 228, 220, 220)
                            .withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(9, 9),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Jumlah Transfer",
                          style: TextStyle(fontSize: 16)),
                      TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Rp.",
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
    if (_accountController.text.isNotEmpty &&
        _amountController.text.isNotEmpty) {
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Harap isi nomor akun dan jumlah transfer")),
      );
    }
  }

  // Handle transaction confirmation logic
  void _handleConfirmTransaction(BuildContext context) {
    final String pin = _pinController.text;

    if (pin.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Berhasil mentransfer Rp${_amountController.text} ke akun ${_accountController.text}"),
        ),
      );
      Navigator.pop(context); // Close the bottom sheet
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Harap masukkan PIN")),
      );
    }
  }
}
