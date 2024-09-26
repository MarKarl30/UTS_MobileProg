import 'package:flutter/material.dart';

import 'pendidikan_detail_screen.dart'; // Tambahkan import untuk screen detail pendidikan

class PendidikanScreen extends StatelessWidget {
  const PendidikanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar pendidikan dengan kode angka
    final List<Map<String, String>> daftarPendidikan = [
      {'nama': 'Bina Bangsa School', 'kode': '101'},
      {'nama': 'Bandung Independent School', 'kode': '102'},
      {'nama': 'UNIVERSITAS TARUMANAGARA', 'kode': '103'},
      {'nama': 'INSTITUT TEKNOLOGI PLN', 'kode': '104'},
      {'nama': 'Kanisius Surakarta', 'kode': '105'},
      {'nama': 'FT UNPAS', 'kode': '106'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pendidikan'),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Scrollbar(
        thickness: 6,
        radius: const Radius.circular(10),
        child: ListView.builder(
          itemCount: daftarPendidikan.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(daftarPendidikan[index]['nama']!),
                subtitle: Text('Kode: ${daftarPendidikan[index]['kode']}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PendidikanDetailScreen(
                        namaPendidikan: daftarPendidikan[index]['nama']!,
                        kodePendidikan: daftarPendidikan[index]['kode']!,
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
