import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransferService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _keyUsername = 'username';
  static const String _keyProfileImage = 'profile_image';

  // fetch username dari storge lokal
  // tidak digunakan
  /*
  Future<String?> getUsername() async {
    return await _storage.read(key: _keyUsername);
  }*/

  // fetch profile image dari storage lokal
  Future<String?> getProfileImage() async {
    return await _storage.read(key: _keyProfileImage);
  }

  // hapus data user saat logout
  Future<void> clearData() async {
    await _storage.deleteAll();
  }

  // fetch user id
  Future<String?> getUserId() async {
    return 'user_id';
  }

  // fetch kontak lokal
  Future<List<Contact>> getContacts() async {
    final PermissionStatus permissionStatus =
        await Permission.contacts.request();
    if (permissionStatus != PermissionStatus.granted) {
      throw Exception('Permission not granted');
    }
    final Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    return contacts.toList(); // mengubah dari iterable ke list
  }

  // fetch user details dari firestore
  Future<Map<String, dynamic>> fetchUserDetails() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.email)
          .get();

      if (userDoc.exists) {
        final String userName = userDoc['name'] ?? 'No name found';
        return {
          'userName': userName,
        };
      }
    }
    return {};
  }
}
