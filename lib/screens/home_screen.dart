import 'package:flutter/material.dart';

// Payment
import 'package:midterm_project/payment/bpjs_screen.dart';
import 'package:midterm_project/payment/ecommerce_screen.dart';
import 'package:midterm_project/payment/net_screen.dart';
import 'package:midterm_project/payment/pajak_screen.dart';
import 'package:midterm_project/payment/pendidikan_screen.dart';
import 'package:midterm_project/payment/pln_screen.dart';

// Screen
import 'package:midterm_project/screens/saldo_screen.dart';
import 'package:midterm_project/screens/transfer_screen.dart';
import 'package:midterm_project/screens/minta_saldo_screen.dart';
import 'package:midterm_project/screens/top-up/top_up_screen.dart';
import 'package:midterm_project/screens/inbox_screen.dart'; 

// Slide Show
import 'package:midterm_project/widgets/banner.dart';

// Balance
import '../widgets/balance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 65,
            backgroundColor: Colors.blueAccent,
            title: const SizedBox(
              height: 55,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Balance(),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications), // Inbox icon
                color: Colors.white,
                onPressed: () {
                  // Navigate to InboxScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InboxScreen()),
                  );
                },
              ),
            ],
          )
        ],
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 370,
                height: 60,
                margin: const EdgeInsets.only(
                    top: 5.0, bottom: 15.0, left: 10.0, right: 10.0),
                color: Colors.blueAccent,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 5.0, right: 10.0),
                      decoration: const BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.white, width: 0.7))),
                      child: const Column(
                        children: [
                          Text(
                            'Uang Masuk',
                            style: TextStyle(
                                color: Color.fromARGB(255, 238, 235, 235)),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text('Rp 300.000',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0, left: 10.0),
                      child: Column(
                        children: [
                          Text('Uang Keluar',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 238, 235, 235))),
                          SizedBox(
                            height: 7,
                          ),
                          Text('Rp 450.000',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0))
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              width: 370,
              height: 80,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
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
                                          const MintaSaldoScreen()),
                                );
                              },
                              icon: const Icon(Icons.request_quote)),
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
                                      builder: (context) =>
                                          const TopUpScreen()),
                                );
                              },
                              icon: const Icon(Icons.shop_2)),
                          const Text('Top Up')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
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
                    top: 25.0, bottom: 40.0, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 3))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                width: 370,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                      child: const Text(
                        'Pembayaran',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    GridView.count(
                      padding: const EdgeInsets.only(top: 40.0),
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.5,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PendidikanScreen()),
                                  );
                                },
                                icon: const Icon(Icons.school)),
                            const Text('Pendidikan')
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
                                            const PajakScreen()),
                                  );
                                },
                                icon: const Icon(Icons.account_balance)),
                            const Text('Pajak')
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
                                            const NetScreen()),
                                  );
                                },
                                icon: const Icon(Icons.wifi)),
                            const Text('Internet')
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
                                            const BPJSScreen()),
                                  );
                                },
                                icon: const Icon(Icons.local_hospital)),
                            const Text('BPJS')
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
                                            const EcommerceScreen()),
                                  );
                                },
                                icon: const Icon(Icons.shopping_cart)),
                            const Text('E-commerce')
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
                                            const PLNScreen()),
                                  );
                                },
                                icon: const Icon(Icons.flash_on)),
                            const Text('PLN')
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        )),
      ),
      backgroundColor: Colors.blueAccent,
    ));
  }
}
