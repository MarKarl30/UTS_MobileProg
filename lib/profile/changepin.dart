import 'package:flutter/material.dart';
import 'package:midterm_project/profile/service/profileservice.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  _ChangePinScreenState createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final _formKey = GlobalKey<FormState>();
  final StorageService _storageService = StorageService();
  final TextEditingController _oldPinController = TextEditingController();
  final TextEditingController _newPinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  Future<void> _changePin() async {
    if (_formKey.currentState!.validate()) {
      String? storedPin = await _storageService.getPin();

      if (_oldPinController.text != storedPin) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PIN lama salah')),
        );
        return;
      }

      if (_newPinController.text != _confirmPinController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PIN baru tidak cocok')),
        );
        return;
      }

      await _storageService.savePin(_newPinController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PIN berhasil diubah')),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF8FAB),
          title: const Text('Ubah PIN', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _oldPinController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'PIN Lama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan PIN lama';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _newPinController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'PIN Baru'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan PIN baru';
                    }
                    if (value.length < 4) {
                      return 'PIN harus minimal 4 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPinController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Konfirmasi PIN Baru'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan konfirmasi PIN baru';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _changePin,
                  child: const Text('Ubah PIN'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
