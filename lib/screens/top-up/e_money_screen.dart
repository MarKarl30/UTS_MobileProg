import 'package:flutter/material.dart';

class EMoneyTopUpScreen extends StatelessWidget {
  const EMoneyTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for input fields
    final TextEditingController _accountController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();
    final TextEditingController _pinController = TextEditingController();

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
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                    color: const Color.fromARGB(255, 0, 0, 0), width: 3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 62, 62, 62).withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Bank Penyedia e-Money
                  const Text(
                    "Bank Penyedia:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  bankOption("assets/icons/bank/icon_bca.jpg", "BCA e-Money"),
                  const SizedBox(height: 8),
                  bankOption("assets/icons/bank/icon_bri.png", "BRI e-Money"),
                  const SizedBox(height: 30),

                  // Nomor Kartu Bank
                  const Text(
                    "Nomor Kartu:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _accountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nomor',
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Jumlah Nominal
                  const Text(
                    "Jumlah Nominal:",
                    style: TextStyle(
                      fontSize: 16,
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
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Informasi dan ketentuan
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Informasi:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                            "1. Sebelum isi saldo, pastikan HP dan kartu Anda mendukung fitur NFC.",
                            style: TextStyle(fontSize: 14)),
                        SizedBox(height: 15),
                        const Text(
                            "2. Pastikan Anda menahan kartunya di area NFC.",
                            style: TextStyle(fontSize: 14)),
                        SizedBox(height: 15),
                        const Text(
                            "3. Saldo maksimum kartu e-Money sebesar Rp 2.000.000,00.",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30), // Add spacing before the button

                  // PIN Input
                  const Text(
                    "Masukkan PIN",
                    style: TextStyle(
                      fontSize: 16,
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
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Konfirmasi Button
                  Center(
                    // Memusatkan tombol
                    child: ElevatedButton(
                      onPressed: () {
                        // Validasi semua input
                        if (_accountController.text.isEmpty ||
                            _amountController.text.isEmpty ||
                            _pinController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Semua field harus diisi!'),
                            ),
                          );
                        } else {
                          // Menampilkan dialog konfirmasi
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
                                      // Jika pengguna mengkonfirmasi, tampilkan SnackBar dan tutup dialog
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

                                      // Menutup dialog
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Konfirmasi'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Warna latar belakang tombol
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15), // Padding tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Membuat sudut melengkung
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18, // Ukuran font
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Warna teks
                        ),
                      ),
                      child: const Text("Konfirmasi"), // Teks tombol
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

  // Widget untuk mengatur konten bank
  Widget bankOption(String imagePath, String bankName) {
    return Row(
      children: [
        Image.asset(imagePath, width: 40, height: 40), // Ukuran logo bank
        const SizedBox(width: 10), // Jarak antara logo dan nama bank
        Text(
          bankName,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
