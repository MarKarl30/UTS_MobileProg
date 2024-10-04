import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:midterm_project/screens/wallet/wallet_screen.dart';
import 'package:midterm_project/widgets/navigation.dart';

void navigateToWalletScreen(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const WalletScreen()),
    (Route<dynamic> route) => false,
  );
}

void navigateToNavigation(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const Navigation()),
    (Route<dynamic> route) => false,
  );
}

class CreditCardInputScreen extends StatefulWidget {
  const CreditCardInputScreen({Key? key}) : super(key: key);

  @override
  _CreditCardInputScreenState createState() => _CreditCardInputScreenState();
}

class _CreditCardInputScreenState extends State<CreditCardInputScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Wallet',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              isChipVisible: true,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: false,
              isHolderNameVisible: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey, 
                      obscureCvv: true, 
                      obscureNumber: false, 
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        navigateToWalletScreen(context);
                        navigateToNavigation(context);
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
