import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:midterm_project/screens/home_screen.dart';
import 'package:midterm_project/widgets/navigation.dart';


void navigateToHomeScreen(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
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

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String otpCode = "";
  late Timer _timer;
  int _start = 15; // Countdown timer in seconds
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 15;
    _isButtonDisabled = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isButtonDisabled = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(0, 0, 0, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0), 
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    // Define focused state styling
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xFFBDBDBD), 
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
              const SizedBox(height: 30),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: _isButtonDisabled
                      ? const LinearGradient(
                          colors: [Colors.grey, Colors.grey],
                        )
                      : const LinearGradient(
                          colors: [Colors.blue, Colors.lightBlueAccent],
                        ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: _isButtonDisabled
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.4),
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                          ),
                        ],
                ),
                child: ElevatedButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                          startTimer(); 
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledBackgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  ),
                  child: Text(
                    _isButtonDisabled
                        ? 'Resend in $_start seconds'
                        : 'Resend',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
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
