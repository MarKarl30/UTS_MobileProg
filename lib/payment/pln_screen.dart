import 'package:flutter/material.dart';

class PLNScreen extends StatelessWidget {
  const PLNScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar layanan PLN dengan kode angka
    final List<Map<String, String>> daftarPLN = [
      {'nama': 'Tagihan Listrik Pascabayar', 'kode': '301'},
      {'nama': 'Token Listrik Prabayar', 'kode': '302'},
      {'nama': 'Pemasangan Baru', 'kode': '303'},
      {'nama': 'Penambahan Daya', 'kode': '304'},
      {'nama': 'Perubahan Nama Pelanggan', 'kode': '305'},
      {'nama': 'Penyambungan Sementara', 'kode': '306'},
      {'nama': 'Tagihan Susulan', 'kode': '307'},
      {'nama': 'Biaya Penyambungan', 'kode': '308'},
      {'nama': 'Sertifikat Laik Operasi (SLO)', 'kode': '309'},
      {'nama': 'Penggantian kWh Meter', 'kode': '310'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan PLN'),
        backgroundColor: Colors.blue,
      ),
      body: Scrollbar(
        thickness: 6,
        radius: const Radius.circular(10),
        child: ListView.builder(
          itemCount: daftarPLN.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(daftarPLN[index]['nama']!),
                subtitle: Text('Kode: ${daftarPLN[index]['kode']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
