import 'package:flutter/material.dart';
import 'package:midterm_project/payment/net_detail_screen.dart';

class NetScreen extends StatelessWidget {
  const NetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar penyedia layanan internet dengan kode angka
    final List<Map<String, String>> daftarInternet = [
      {'nama': 'Indihome', 'kode': '401'},
      {'nama': 'First Media', 'kode': '402'},
      {'nama': 'Biznet', 'kode': '403'},
      {'nama': 'MNC Play', 'kode': '404'},
      {'nama': 'MyRepublic', 'kode': '405'},
      {'nama': 'CBN Fiber', 'kode': '406'},
      {'nama': 'Oxygen.id', 'kode': '407'},
      {'nama': 'IndiHome Fiber', 'kode': '408'},
      {'nama': 'XL Home', 'kode': '409'},
      {'nama': 'Megavision', 'kode': '410'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Penyedia Internet'),
        backgroundColor: Colors.blue,
      ),
      body: Scrollbar(
        thickness: 6,
        radius: const Radius.circular(10),
        child: ListView.builder(
          itemCount: daftarInternet.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(daftarInternet[index]['nama']!),
                subtitle: Text('Kode: ${daftarInternet[index]['kode']}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NetDetailScreen(
                        namaNet: daftarInternet[index]['nama']!,
                        kodeNet: daftarInternet[index]['kode']!,
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
