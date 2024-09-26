import 'package:flutter/material.dart';
import 'package:midterm_project/profile/service/profileservice.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final StorageService _storageService = StorageService();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) {
      String? storedPassword = await _storageService.getPassword();

      if (_oldPasswordController.text != storedPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Kata sandi lama salah'),
              behavior: SnackBarBehavior.floating),
        );
        return;
      }

      if (_newPasswordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Kata sandi baru tidak cocok'),
              behavior: SnackBarBehavior.floating),
        );
        return;
      }

      await _storageService.savePassword(_newPasswordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Kata sandi berhasil diubah'),
            behavior: SnackBarBehavior.floating),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'Ubah Kata Sandi',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _oldPasswordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Kata Sandi Lama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan kata sandi lama';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Kata Sandi Baru'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan kata sandi baru';
                    }
                    if (value.length < 6) {
                      return 'Kata sandi harus minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Konfirmasi Kata Sandi Baru'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan konfirmasi kata sandi baru';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _changePassword,
                  child: const Text('Ubah Kata Sandi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
