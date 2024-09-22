import 'package:flutter/material.dart';

class EMoneyTopUpScreen extends StatelessWidget {
  const EMoneyTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar untuk menampilkan tombol back dan title page
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan nomor kartu',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Widget unutk mengatur konten bank
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
