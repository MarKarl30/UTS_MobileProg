import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class TransferService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _keyUsername = 'username';
  static const String _keyProfileImage = 'profile_image';

  // fetch username dari storge lokal
  Future<String?> getUsername() async {
    return await _storage.read(key: _keyUsername);
  }

  // fetch profile image dari storage lokal
  Future<String?> getProfileImage() async {
    return await _storage.read(key: _keyProfileImage);
  }

  // hapus data user saat logout
  Future<void> clearData() async {
    await _storage.deleteAll();
  }

  // fetch user id dari storage lokal
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
}
