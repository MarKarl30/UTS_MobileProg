import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  bool currentIndex = true;
  @override
  Widget build(BuildContext context) {
    var text = [
      // list of text which the text get form here
      const Text(
        'Rp 50.000',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      const Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
    ];
    return Row(
      children: <Widget>[
        RichText(
            text: const TextSpan(children: [
          WidgetSpan(
              child: Icon(
            Icons.account_balance_wallet,
            size: 16,
            color: Colors.white,
          )),
        ])),
        Container(
          margin: const EdgeInsets.only(left: 5.0),
          child: Row(
            children: [
              currentIndex ? text[0] : text[1],
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = !currentIndex;
                  });
                  ;
                },
                icon: Icon(
                    currentIndex ? Icons.visibility : Icons.visibility_off),
                color: Colors.white,
                iconSize: 16,
              )
            ],
          ),
        )
      ],
    );
  }
}
