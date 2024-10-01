// profile/change_phone.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm_project/profile/service/profileservice.dart';

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen({Key? key}) : super(key: key);

  @override
  _ChangePhoneScreenState createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  final StorageService _storageService = StorageService();
  final TextEditingController _phoneController = TextEditingController();
  String _message = '';

  void _changePhone() async {
    String newPhone = _phoneController.text;

    if (newPhone.isEmpty) {
      setState(() {
        _message = 'Phone number cannot be empty.';
      });
      return;
    }

    // Retrieve user ID to update the phone number in Firestore
    String? userId = await _storageService.getUserId();
    if (userId != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'phone': newPhone,
        });

        setState(() {
          _message = 'Phone number changed successfully.';
        });

        // Optionally, navigate back after success
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      } catch (e) {
        setState(() {
          _message = 'Failed to update phone number: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'New Phone Number',
                hintText: 'Enter new phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePhone,
              child: const Text('Change Phone Number'),
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
