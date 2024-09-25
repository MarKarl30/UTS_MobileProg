import 'package:flutter/material.dart';
import 'package:midterm_project/payment/payment_screen.dart';
import 'package:midterm_project/screens/saldo_screen.dart';
import 'package:midterm_project/screens/top-up/top_up_screen.dart';
import 'package:midterm_project/screens/transfer_screen.dart';
import 'package:midterm_project/widgets/banner.dart';

import '../widgets/balance.dart';

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
            toolbarHeight: 80,
            backgroundColor: const Color(0xFFFF8FAB),
            title: const SizedBox(
              height: 100,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Balance(),
              ),
            ),
          ),
          backgroundColor: const Color(0xFFFF8FAB),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                child: const BannerSlideShow(
                  imagePaths: [
                    "assets/images/banner/streamings/disney.png",
                    "assets/images/banner/games/promo1.png",
                    "assets/images/banner/streamings/netflix.png",
                    "assets/images/banner/games/valorant.png",
                    "assets/images/banner/streamings/viu.png",
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  width: 350,
                  height: 80,
                  child: Stack(
                    children: [
                      GridView.count(
                        childAspectRatio: 4.5,
                        crossAxisCount: 1,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SaldoScreen()),
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
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TransferScreen()),
                                        );
                                      },
                                      icon: const Icon(Icons.send)),
                                  const Text('Transfer')
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
                                              builder: (context) =>
                                                  const TopUpScreen()),
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
                                      onPressed: () =>
                                          navigateToPaymentScreen(context),
                                      icon: const Icon(Icons.payments)),
                                  const Text('Pembayaran')
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
