import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Histori',
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
                  title: Text('Bulan ini',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  trailing: Text(
                    '-Rp 450.000',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Minta Saldo'),
                  trailing: Text(
                    '+Rp 300.000',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                  subtitle: Text('3 Oktober 2024 13:02'),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Mobile Legend'),
                  trailing: Text(
                    '-Rp 200.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('2 Oktober 2024 18:31'),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  shape: Border(
                    bottom: BorderSide(width: 0.7, color: Colors.grey),
                  ),
                  title: Text('KFC'),
                  trailing: Text(
                    '-Rp 200.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('1 Oktober 2024 13:23'),
                )),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Lawson'),
                  trailing: Text(
                    '-Rp 50.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('1 Oktober 2024 13:13'),
                )),
            Container(
                color: const Color.fromARGB(255, 230, 227, 227),
                child: const ListTile(
                  title: Text('September',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  trailing: Text(
                    '-Rp 1.350.000',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Hoyoverse Corporation'),
                  trailing: Text(
                    '-Rp 80.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('29 September 2024 21:08'),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Pulsa'),
                  trailing: Text(
                    '-Rp 150.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('25 September 2024 18:34'),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Dufan Ancol'),
                  trailing: Text(
                    '-Rp 120.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('16 September 2024 09:38'),
                )),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Pajak'),
                  trailing: Text(
                    '-Rp 1.000.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('4 September 2024 11:58'),
                )),
            Container(
                color: const Color.fromARGB(255, 230, 227, 227),
                child: const ListTile(
                  title: Text('Agustus',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  trailing: Text(
                    '-Rp 1.200.000',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Pulsa'),
                  trailing: Text(
                    '-Rp 150.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('26 Agustus 2024 19:28'),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Tokopedia'),
                  trailing: Text(
                    '-Rp 450.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('19 Agustus 2024 20:31'),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Ovo'),
                  trailing: Text(
                    '-Rp 100.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('8 Agustus 2024 12:19'),
                )),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.7, color: Colors.grey))),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('Netflix'),
                  trailing: Text(
                    '-Rp 200.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('1 Agustus 2024 19:06'),
                )),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  shape: Border(
                    bottom: BorderSide(width: 0.7, color: Colors.grey),
                  ),
                  title: Text('Universitas Tarumanagara'),
                  trailing: Text(
                    '-Rp 300.000',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  subtitle: Text('1 Agustus 2024 18:59'),
                )),
            Container(
                color: const Color.fromARGB(255, 230, 227, 227),
                child: const ListTile(
                  title: Text('Juli',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  trailing: Text(
                    '-Rp 0',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: const ListTile(
                  title: Text('BCA'),
                  trailing: Text(
                    '+Rp 3.000.000',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                  subtitle: Text('30 Juli 2024 18:54'),
                )),
          ],
        ),
      ),
    );
  }
}
