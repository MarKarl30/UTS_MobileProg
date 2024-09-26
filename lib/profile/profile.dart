import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:midterm_project/screens/login_screen.dart';
import 'package:midterm_project/profile/edit.dart';
import 'package:midterm_project/profile/changepw.dart';
import 'package:midterm_project/profile/service/profileservice.dart';
import 'package:midterm_project/profile/changepin.dart';

void navigateToLoginScreen(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SignIn()),
  );
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final StorageService _storageService = StorageService();
  String _username = 'Nama Pengguna';
  String _email = 'email@example.com';
  String? _profileImage; // Profile image path
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    String? username = await _storageService.getUsername();
    String? profileImage = await _storageService.getProfileImage();

    setState(() {
      if (username != null && username.isNotEmpty) {
        _username = username;
      }
      if (profileImage != null && profileImage.isNotEmpty) {
        _profileImage = profileImage;
      }
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = image.path;
      });
      await _storageService.saveProfileImage(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Profil',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage, // Pick image on tap
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(File(_profileImage!)) // Show selected image
                        : const NetworkImage('https://via.placeholder.com/150')
                            as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  _username,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  _email,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const Divider(height: 40),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Profil'),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileEditScreen()),
                  );
                  _loadProfileData(); // Refresh username after returning
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Ubah Kata Sandi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.pin),
                title: const Text('Ubah PIN'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePinScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Keluar'),
                onTap: () async {
                  await _storageService.clearAll();
                  navigateToLoginScreen(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
