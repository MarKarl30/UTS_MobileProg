import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:midterm_project/screens/user-auth/login_screen.dart';
import 'package:midterm_project/screens/user-auth/verify_otp_screen.dart';
import 'package:midterm_project/widgets/register_text_field.dart';

void navigateToOtpScreen(BuildContext context, String phoneNumber) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => VerifyOtp(phoneNumber: phoneNumber)),
  );
}

void navigateToLoginScreen(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SignIn()),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();
  bool _obscurePassword = true;
  String phoneNumber = "";
  bool enableOtpBtn = false;

  PhoneNumber number = PhoneNumber(isoCode: 'US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/register_img.jpg'),
                const SizedBox(height: 16),
                const Text(
                  'Sign Up Now!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24.0),
                CustomTextField(
                  controller: textController,
                  hintText: 'Enter Full Name (Sesuai KTP)',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  obscurePassword: false,
                  onPasswordToggle: (value) {},
                ),
                const SizedBox(height: 16.0),

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
                    hintText: 'Enter Phone Number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter Email (optional)',
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obscurePassword: false,
                  onPasswordToggle: (value) {},
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: pinController,
                  hintText: 'Create PIN',
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a PIN';
                    } else if (value.length < 6) {
                      return 'PIN must be at least 6 digits';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'PIN must be a number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  obscurePassword: _obscurePassword,
                  onPasswordToggle: (value) {
                    setState(() {
                      _obscurePassword = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: confirmPinController,
                  hintText: 'Confirm PIN',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your PIN';
                    } else if (value != pinController.text) {
                      return 'PINs do not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  obscurePassword: _obscurePassword,
                  onPasswordToggle: (value) {
                    setState(() {
                      _obscurePassword = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: enableOtpBtn
                      ? () async {
                          if (_formKey.currentState!.validate()) {
                            showLoadingDialog(context);
                            try {
                              await createUser(
                                name: textController.text.trim(),
                                phoneNumber: phoneNumber.trim(),
                                email: emailController.text.trim(),
                                pin: pinController.text.trim(),
                                context: context,
                              );
                            } catch (e) {
                              Navigator.pop(context);
                            }
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: enableOtpBtn ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Already have an account?',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    navigateToLoginScreen(context);
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUser({
    required String name,
    required String phoneNumber,
    required String email,
    required String pin,
    required BuildContext context, // To allow navigation and dialogs
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pinController.text.trim(),
      );

      // Get the current user
      User? user = userCredential.user;

      if (user != null) {
        // Store user details in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.email).set({
          'name': name,
          'phone': phoneNumber,
          'email': email,
          'pin': pin,
          'createdAt': Timestamp.now(),
        });

        if (context.mounted) {
          Navigator.pop(context); // Close the loading dialog
          navigateToOtpScreen(context, phoneNumber); // Navigate to OTP screen
        }
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the loading dialog if an error occurs
      displayMessage(e.code); // Display the error code
    }
  }

  void displayMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
