import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:midterm_project/screens/user-auth/register_screen.dart';
import 'package:midterm_project/screens/user-auth/verify_otp_screen.dart';

void navigateToRegisterScreen(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Register()),
  );
}

void navigateToOtpScreen(BuildContext context, String phoneNumber) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => VerifyOtp(phoneNumber: phoneNumber)),
  );
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  bool enableOtpBtn = false;
  bool isLoading = false; 

 
  Future<void> checkPhoneNumber(BuildContext context, String phoneNumber) async {
    setState(() {
      isLoading = true;
    });

    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('phone', isEqualTo: phoneNumber)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        navigateToOtpScreen(context, phoneNumber);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Phone number not registered.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/login_img.png'),
              const SizedBox(height: 16),
              const Text(
                'Login Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              InternationalPhoneNumberInput(
                onInputValidated: (value) {
                  setState(() {
                    enableOtpBtn = value;
                  });
                },
                onInputChanged: (value) {
                  setState(() {
                    phoneNumber = value.phoneNumber!;
                  });
                },
                formatInput: true,
                autoFocus: true,
                keyboardType: TextInputType.phone,
                selectorConfig: const SelectorConfig(
                  useEmoji: true,
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                inputDecoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              if (isLoading)
                const Center(child: CircularProgressIndicator()),

              ElevatedButton(
                onPressed: enableOtpBtn && !isLoading
                    ? () {
                        checkPhoneNumber(context, phoneNumber);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: enableOtpBtn ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Don\'t have an account yet?',
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () => navigateToRegisterScreen(context),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
