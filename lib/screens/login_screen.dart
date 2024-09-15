import 'package:flutter/material.dart';
import 'package:midterm_project/screens/register_screen.dart';

void navigateToRegisterScreen(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Register()),
  );
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  bool _obscurePassword = true; // Controls whether password is obscured or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/login_img.png'),
              const SizedBox(height: 16),
              const Text(
                'Login Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: 'Enter Phone Number or Email',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox (height: 10.0),
              const Text('Request for OTP'),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                obscureText: _obscurePassword, // Controls password visibility
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword; // Toggle password visibility
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: 'Enter One-Time Password',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), 
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14.0), 
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            const SizedBox(height: 24.0),
            const Text(
              'Don\'t have an account yet?',
              textAlign: TextAlign.center,
            ),
              TextButton(
                onPressed: () {
                  navigateToRegisterScreen(context);
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
