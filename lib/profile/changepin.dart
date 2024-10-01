// profile/change_pin.dart
import 'package:flutter/material.dart';
import 'package:midterm_project/profile/service/profileservice.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({Key? key}) : super(key: key);

  @override
  _ChangePinScreenState createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final StorageService _storageService = StorageService();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  // Add this variable to show a message when the operation is successful or failed
  String _message = '';

  void _changePin() async {
    String newPin = _pinController.text;
    String confirmPin = _confirmPinController.text;

    // Validate PIN
    if (newPin.isEmpty || confirmPin.isEmpty) {
      setState(() {
        _message = 'PIN cannot be empty.';
      });
      return;
    }

    if (newPin != confirmPin) {
      setState(() {
        _message = 'PINs do not match.';
      });
      return;
    }

    // Save the new PIN
    await _storageService.savePin(newPin);
    setState(() {
      _message = 'PIN changed successfully.';
    });

    // Optionally, you might want to navigate back after a successful change
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _pinController,
              decoration: const InputDecoration(
                labelText: 'New PIN',
                hintText: 'Enter new PIN',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPinController,
              decoration: const InputDecoration(
                labelText: 'Confirm PIN',
                hintText: 'Re-enter new PIN',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePin,
              child: const Text('Change PIN'),
            ),
            const SizedBox(height: 10),
            Text(
              _message,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
