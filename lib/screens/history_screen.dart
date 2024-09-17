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
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  Container(
                      color: const Color.fromARGB(255, 230, 227, 227),
                      child: const ListTile(
                        title: Text('Bulan ini'),
                        trailing: Text(
                          '-Rp 200.000',
                          style: TextStyle(color: Colors.red),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        shape: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey),
                        ),
                        title: Text('Transfer'),
                        trailing: Text(
                          '-Rp 135.000',
                          style: TextStyle(color: Colors.red),
                        ),
                        subtitle: Text('24 September 2024 12:11'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        shape: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey),
                        ),
                        title: Text('Valve Corporation'),
                        trailing: Text(
                          '-Rp 45.000',
                          style: TextStyle(color: Colors.red),
                        ),
                        subtitle: Text('24 September 2024 12:01'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        title: Text('m-BCA'),
                        trailing: Text(
                          '+Rp 250.000',
                          style: TextStyle(color: Colors.green),
                        ),
                        subtitle: Text('24 September 2024 11:54'),
                      )),
                  Container(
                      color: const Color.fromARGB(255, 230, 227, 227),
                      child: const ListTile(
                        title: Text('Agustus'),
                        trailing: Text(
                          '-Rp 80.000',
                          style: TextStyle(color: Colors.red),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        shape: Border(
                          bottom: BorderSide(width: 0.7, color: Colors.grey),
                        ),
                        title: Text('Hoyoverse Corporation'),
                        trailing: Text(
                          '-Rp 80.000',
                          style: TextStyle(color: Colors.red),
                        ),
                        subtitle: Text('27 Agustus 2024 16:08'),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: const ListTile(
                        title: Text('m-BCA'),
                        trailing: Text(
                          '+Rp 80.000',
                          style: TextStyle(color: Colors.green),
                        ),
                        subtitle: Text('27 Agustus 2024 15:54'),
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
