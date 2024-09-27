import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midterm_project/screens/splash_screen.dart';
import 'package:midterm_project/screens/user-auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FundWallet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(child: SignIn()), // Use SplashScreen with Navigation as child
    );
  }
}
