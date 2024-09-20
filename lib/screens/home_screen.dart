import 'package:flutter/material.dart';
import '../widgets/balance.dart';
import 'package:midterm_project/top-up/top_up_screen.dart';

import 'payment_screen.dart';
import 'package:midterm_project/screens/saldo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToPaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.blueAccent,
          title: const Balance(),
        ),
        backgroundColor: Colors.blueAccent,
        body: Container(
          margin: const EdgeInsets.only(
              top: 0.0, bottom: 15.0, left: 15, right: 15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color.fromARGB(255, 245, 245, 245)),
          width: 350,
          height: 305,
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                width: 300,
                height: 250,
                child: GridView.count(
                  childAspectRatio: 2.0,
                  padding: const EdgeInsets.only(top: 45.0, left: 0.0),
                  crossAxisCount: 2,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SaldoScreen()),
                              );
                            },
                            icon: const Icon(Icons.money)),
                        const Text('Isi Saldo')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.request_page)),
                        const Text('Minta Saldo')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TopUpScreen()),
                              );
                            },
                            icon: const Icon(Icons.shop_2)),
                        const Text('Top Up')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => navigateToPaymentScreen(context),
                            icon: const Icon(Icons.payments)),
                        const Text('Pembayaran')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
