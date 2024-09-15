import 'package:flutter/material.dart';

class SaldoScreen extends StatefulWidget {
  const SaldoScreen({super.key});

  @override
  _SaldoScreenState createState() => _SaldoScreenState();
}

class _SaldoScreenState extends State<SaldoScreen> {
  bool _isBalanceVisible = true; // This controls whether the balance is visible

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: const Color.fromARGB(183, 233, 232, 232),
          leading: const BackButton(color: Color.fromARGB(200, 0, 0, 0)),
          title: const Text(
            "Isi Saldo",
            style: TextStyle(
              color: Color.fromARGB(200, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(243, 246, 245, 245),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container Info Saldo
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/saldo_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1.0),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 350,
                height: 175,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 3.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 8.0),
                          IconButton(
                            icon: Icon(
                              _isBalanceVisible
                                  ? Icons.visibility // eye icon
                                  : Icons.visibility_off, // closed eye icon
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isBalanceVisible =
                                    !_isBalanceVisible; // toggle visibility
                              });
                            },
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: _isBalanceVisible
                                      ? "Rp. 50.000"
                                      : "Rp. ---",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container Pembayaran via Tunai
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1.0),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 350,
                height: 290,
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: RichText(
                        text: const TextSpan(
                          text: "Bayar tunai",
                          style: TextStyle(
                            color: Color.fromARGB(150, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: RichText(
                        text: const TextSpan(
                          text: "Di minimarket, warung atau agen terdekat",
                          style: TextStyle(
                            color: Color.fromARGB(150, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/toko/icon_indomaret.png'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'Indomaret',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/toko/icon_alfamart.png'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'Alfamart',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/toko/icon_alfamidi.png'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'Alfamidi',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/toko/icon_lawson.jpg'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'Lawson',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/toko/icon_familymart.png'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'FamilyMart',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/toko/icon_mitratoped.jpg'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'Tokopedia',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container Pembayaran via Bank
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1.0),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 350,
                height: 310,
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: RichText(
                        text: const TextSpan(
                          text: "Lewat bank",
                          style: TextStyle(
                            color: Color.fromARGB(150, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: RichText(
                        text: const TextSpan(
                          text:
                              "Dari ATM, mobile banking atau internet banking",
                          style: TextStyle(
                            color: Color.fromARGB(150, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/bank/icon_mandiri.png'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'Mandiri',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/bank/icon_bca.jpg'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'BCA',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/bank/icon_bni.jpg'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'BNI',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/bank/icon_bri.png'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'BRI',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/bank/icon_jago.jpg'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'Jago',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/bank/icon_permata.jpg'),
                                  iconSize: 50,
                                ),
                              ),
                              const Text(
                                'PermataBank',
                                style: TextStyle(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
