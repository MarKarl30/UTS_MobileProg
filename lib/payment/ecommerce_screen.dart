import 'package:flutter/material.dart';
import 'package:midterm_project/payment/ecommerce_detail_screen.dart';

class EcommerceScreen extends StatelessWidget {
  const EcommerceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar e-commerce dengan kode angka
    final List<Map<String, String>> daftarEcommerce = [
      {'nama': 'Tokopedia', 'kode': '501'},
      {'nama': 'Shopee', 'kode': '502'},
      {'nama': 'Bukalapak', 'kode': '503'},
      {'nama': 'Lazada', 'kode': '504'},
      {'nama': 'Blibli', 'kode': '505'},
      {'nama': 'JD.ID', 'kode': '506'},
      {'nama': 'Zalora', 'kode': '507'},
      {'nama': 'Bhinneka', 'kode': '508'},
      {'nama': 'Orami', 'kode': '509'},
      {'nama': 'Sociolla', 'kode': '510'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar E-commerce',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Scrollbar(
        thickness: 6,
        radius: const Radius.circular(10),
        child: ListView.builder(
          itemCount: daftarEcommerce.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(daftarEcommerce[index]['nama']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EcommerceDetailScreen(
                        namaEcommerce: daftarEcommerce[index]['nama']!,
                        kodeEcommerce: daftarEcommerce[index]['kode']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
