import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:midterm_project/screens/home_screen.dart';
import 'package:midterm_project/widgets/navigation.dart';

void navigateToHomeScreen(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomeScreen()));
}

void navigateToNavigation(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Navigation()));
}


class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    // Define the base style for the pin fields
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(0, 0, 0, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0), // Light gray color for background
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    // Define focused state styling
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xFFBDBDBD), // Slightly darker gray for focused field
    );

    // Define submitted state styling
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.phoneNumber,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "In order to complete your phone verification, please enter the 6-digit code sent to your phone number.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onChanged: (value) {
                  setState(() {
                    otpCode = value;
                  });
                },
                onCompleted: (value) {
                  navigateToHomeScreen(context);
                  navigateToNavigation(context);
                },
              ),
              const SizedBox(height:30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Resend',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
