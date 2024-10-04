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
              'Inbox',
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.only(bottom: 15.0),
            children: [
              Container(
                  color: const Color.fromARGB(255, 230, 227, 227),
                  child: const ListTile(
                    title: Text(
                      'Bulan ini',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Minta Saldo Berhasil'),
                    subtitle: Text('3 Oktober 2024 13:02'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Berhasil'),
                    subtitle: Text('2 Oktober 2024 18:31'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pembayaran Berhasil'),
                    subtitle: Text('1 Oktober 2024 13:23'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pembayaran Berhasil'),
                    subtitle: Text('1 Oktober 2024 13:13'),
                  )),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pembayaran Gagal'),
                    subtitle: Text('1 Oktober 2024 13:11'),
                  )),
              Container(
                  color: const Color.fromARGB(255, 230, 227, 227),
                  child: const ListTile(
                    title: Text(
                      'September',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Berhasil'),
                    subtitle: Text('29 September 2024 21:08'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Berhasil'),
                    subtitle: Text('25 September 2024 18:34'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Berhasil'),
                    subtitle: Text('16 September 2024 09:35'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Gagal'),
                    subtitle: Text('16 September 2024 09:35'),
                  )),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pembayaran Berhasil'),
                    subtitle: Text('4 September 2024 11:58'),
                  )),
              Container(
                  color: const Color.fromARGB(255, 230, 227, 227),
                  child: const ListTile(
                    title: Text(
                      'Agustus',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Berhasil'),
                    subtitle: Text('26 Agustus 2024 19:28'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Gagal'),
                    subtitle: Text('26 Agustus 2024 19:26'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pembayaran Berhasil'),
                    subtitle: Text('19 Agustus 2024 20:31'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top up Berhasil'),
                    subtitle: Text('8 Agustus 2024 12:19'),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey))),
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Top Up Berhasil'),
                    subtitle: Text('1 Agustus 2024 19:06'),
                  )),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pembayaran Berhasil'),
                    subtitle: Text('1 Agustus 2024 18:59'),
                  )),
              Container(
                  color: const Color.fromARGB(255, 230, 227, 227),
                  child: const ListTile(
                    title: Text('Juli', style: TextStyle(fontSize: 18.0)),
                  )),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Isi Saldo Berhasil'),
                    subtitle: Text('30 Juli 2024 18:54'),
                  )),
            ],
          )),
    );
  }
}
