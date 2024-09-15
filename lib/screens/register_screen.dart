import 'package:flutter/material.dart';
import 'package:midterm_project/screens/login_screen.dart';
import 'package:midterm_project/screens/home_screen.dart';
import 'package:midterm_project/widgets/navigation.dart';

void navigateToLoginScreen(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SignIn()),
  );
}

void navigateToHomeScreen(BuildContext context) {
  Navigator.pushReplacement(context,
  MaterialPageRoute(builder: (context) => const HomeScreen())
  );
}

void navigateToNavigation(BuildContext context) {
  Navigator.pushReplacement(context,
  MaterialPageRoute(builder: (context) => const Navigation())
  );
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final textController = TextEditingController();
  final pinController = TextEditingController(); 
  final confirmPinController = TextEditingController(); 
  bool _obscurePassword = true; 

  // Function to build a TextField to avoid repetition
  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
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
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword; // Toggle password visibility
                  });
                },
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              buildTextField(
                controller: textController,
                hintText: 'Enter Phone Number',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox (height: 7.0),
              const Text('Verify Phone Number'),
              const SizedBox(height: 10),
              buildTextField(
                controller: textController,
                hintText: 'Enter Email (optional)',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const Text('Verify Email'),
              const SizedBox(height: 16),
              buildTextField(
                controller: pinController,
                keyboardType: TextInputType.number,
                hintText: 'Create PIN',
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: confirmPinController,
                keyboardType: TextInputType.number,
                hintText: 'Confirm PIN',
                obscureText: true,
              ),
              TextButton(
                onPressed: () {
                  navigateToHomeScreen(context);
                  navigateToNavigation(context);
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'Continue Without Account?',
                  textAlign: TextAlign.center,
                ),
              ),
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
    );
  }
}
