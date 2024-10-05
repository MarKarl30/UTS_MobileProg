import 'package:flutter/material.dart';

import 'pajak_detail_screen.dart';

class PajakScreen extends StatelessWidget {
  const PajakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar pajak dengan kode angka
    final List<Map<String, String>> daftarPajak = [
      {'nama': 'Pajak Penghasilan (PPh)', 'kode': '001'},
      {'nama': 'Pajak Pertambahan Nilai (PPN)', 'kode': '002'},
      {'nama': 'Pajak Bumi dan Bangunan (PBB)', 'kode': '003'},
      {'nama': 'Pajak Kendaraan Bermotor', 'kode': '004'},
      {'nama': 'Pajak/PNBP/Cukai', 'kode': '005'},
      {'nama': 'BPHTB', 'kode': '006'},
      {'nama': 'Pajak Daerah', 'kode': '007'},
      {'nama': 'SAMSAT SUMUT', 'kode': '008'},
      {'nama': 'e-PBB', 'kode': '009'},
      {'nama': 'Bea Meterai', 'kode': '010'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Pajak',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme:
            IconThemeData(color: Colors.white), // Mengubah warna ikon kembali
      ),
      body: ListView.builder(
        itemCount: daftarPajak.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(daftarPajak[index]['nama']!),
              // Hapus subtitle yang menampilkan kode pajak
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PajakDetailScreen(
                      namaPajak: daftarPajak[index]['nama']!,
                      kodePajak: daftarPajak[index]['kode']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
