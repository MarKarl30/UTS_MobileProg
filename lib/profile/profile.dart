import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:midterm_project/profile/changenotlp.dart';
import 'package:midterm_project/profile/changepin.dart';
import 'package:midterm_project/profile/edit.dart';
import 'package:midterm_project/profile/service/profileservice.dart';
import 'package:midterm_project/screens/user-auth/login_screen.dart';

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
  String _username = ''; // Will hold the username from Firestore
  String _profileImage = 'https://via.placeholder.com/150'; // Default profile image
  String? _userId;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    _userId = await _storageService.getUserId(); // Get the user ID
    if (_userId != null) {
      // Fetch the username from Firestore
      String? username = await _storageService.getUsernameFromFirestore(_userId!);
      String? profileImage = await _storageService.getProfileImage();
      setState(() {
        _username = username ?? ''; // Update username or set to empty if null
        _profileImage = profileImage ?? _profileImage; // Update profile image or keep default
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
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
                    backgroundImage: _profileImage.isNotEmpty
                        ? FileImage(File(_profileImage)) // Show selected image
                        : const NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  _username.isNotEmpty ? _username : 'Username not set', // Display username
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
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
                leading: const Icon(Icons.phone),
                title: const Text('Ubah No Telepon'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePhoneScreen()),
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
