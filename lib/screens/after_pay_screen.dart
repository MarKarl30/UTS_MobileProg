import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/navigation.dart';

class AfterPayScreen extends StatelessWidget {
  const AfterPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pembayaran Berhasil',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                onPressed: () {
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(builder: (context) => const Navigation()),
                  );
                },
                child: const Text(
                  'Back to Home',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    ));
  }
}
