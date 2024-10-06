import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/navigation.dart';

class EMoneyTopUpScreen extends StatelessWidget {
  const EMoneyTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for input fields
    final TextEditingController _accountController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();
    final TextEditingController _pinController = TextEditingController();

    // Predefined PIN for demonstration purposes
    const String correctPin = "1234";

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Color.fromARGB(200, 0, 0, 0)),
        backgroundColor: const Color.fromARGB(183, 233, 232, 232),
        title: const Text(
          "Transaksi E-Money",
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(243, 246, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black54, width: 1.5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Uang Elektronik",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Bank that support e-money
                  const Text(
                    "Bank Penyedia:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  bankOption("assets/icons/bank/icon_bca.jpg", "BCA e-Money"),
                  const SizedBox(height: 8),
                  bankOption("assets/icons/bank/icon_bri.png", "BRI e-Money"),
                  const SizedBox(height: 30),

                  //  Bank card number
                  const Text(
                    "Nomor Kartu:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _accountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nomor',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  //transfer amounts
                  const Text(
                    "Jumlah Nominal:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Rp.',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // information and term
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Informasi:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "1. Sebelum isi saldo, pastikan HP dan kartu Anda mendukung fitur NFC.",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "2. Pastikan Anda menahan kartunya di area NFC.",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "3. Saldo maksimum kartu e-Money sebesar Rp 2.000.000,00.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // PIN Input
                  const Text(
                    "Masukkan PIN",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'PIN',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Error message for incorrect PIN
                  if (_pinController.text.isNotEmpty &&
                      _pinController.text != correctPin)
                    const Text(
                      "PIN yang dimasukkan salah!",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  const SizedBox(height: 30),

                  // confirmation button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // inputs validation
                        if (_accountController.text.isEmpty ||
                            _amountController.text.isEmpty ||
                            _pinController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Semua field harus diisi!'),
                            ),
                          );
                        } else if (_pinController.text != correctPin) {
                          // Validate PIN
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('PIN yang dimasukkan salah!'),
                            ),
                          );
                        } else if (!RegExp(r'^[0-9]+$')
                                .hasMatch(_accountController.text) ||
                            !RegExp(r'^[0-9]+$')
                                .hasMatch(_amountController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Nomor kartu dan jumlah nominal harus berupa angka!'),
                            ),
                          );
                        } else {
                          // Check minimum amount
                          double amount =
                              double.tryParse(_amountController.text) ?? 0.0;
                          if (amount < 10000) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Jumlah nominal minimal Rp 10.000,00!'),
                              ),
                            );
                          } else {
                            // show confirmation dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Konfirmasi Transaksi'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          'Nomor Kartu: ${_accountController.text}'),
                                      Text(
                                          'Jumlah: Rp ${_amountController.text}'),
                                      const SizedBox(height: 15),
                                      const Text(
                                          'Apakah Anda yakin ingin melanjutkan?'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Menutup dialog tanpa melanjutkan
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // when the purchase succesful
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Transaksi berhasil! Jumlah: Rp ${_amountController.text}, PIN: ${_pinController.text}'),
                                          ),
                                        );

                                        // Clear inputs
                                        _accountController.clear();
                                        _amountController.clear();
                                        _pinController.clear();

                                        // close dialog
                                        Navigator.of(context).pop();

                                        // Navigate to HomeScreen
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Navigation(),
                                          ),
                                        );
                                      },
                                      child: const Text('Konfirmasi'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Konfirmasi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bankOption(String assetPath, String bankName) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 10),
        Text(
          bankName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
