import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Notifikasi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          margin: const EdgeInsets.all(1.0),
          child: Stack(
            children: [
              ListView(
                children: [
                  Container(
                      color: const Color.fromARGB(255, 230, 227, 227),
                      child: const ListTile(
                        title: Text('Bulan ini'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Transfer Gagal'),
                        subtitle: Text('29 September 2024 19:11'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Transfer Berhasil'),
                        subtitle: Text('24 September 2024 12:11'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Top Up Berhasil'),
                        subtitle: Text('24 September 2024 12:01'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Isi Saldo Berhasil'),
                        subtitle: Text('24 September 2024 11:54'),
                      )),
                  Container(
                      color: const Color.fromARGB(255, 230, 227, 227),
                      child: const ListTile(
                        title: Text('Agustus'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Top Up Berhasil'),
                        subtitle: Text('27 Agustus 2024 16:08'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Isi Saldo Berhasil'),
                        subtitle: Text('27 Agustus 2024 15:54'),
                      )),
                ],
              )
            ],
          )),
    ));
  }
}
