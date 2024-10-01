import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _keyUsername = 'username';
  static const String _keyOtp = 'otp';
  static const String _keyPin = 'pin'; // Key for PIN
  static const String _keyProfileImage = 'profile_image';

  // Save profile image path or URL
  Future<void> saveProfileImage(String imagePath) async {
    await _storage.write(key: _keyProfileImage, value: imagePath);
  }

  // Get profile image path or URL
  Future<String?> getProfileImage() async {
    return await _storage.read(key: _keyProfileImage);
  }

  // Save username
  Future<void> saveUsername(String username) async {
    await _storage.write(key: _keyUsername, value: username);
  }

  // Get username
  Future<String?> getUsername() async {
    return await _storage.read(key: _keyUsername);
  }

  // New method to fetch username from Firestore
  Future<String?> getUsernameFromFirestore(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        return userDoc['name']; // Assuming the field for username is 'name'
      }
    } catch (e) {
      print('Error fetching username: $e');
    }
    return null;
  }

  // Save OTP
  Future<void> saveOtp(String otp) async {
    await _storage.write(key: _keyOtp, value: otp);
  }

  // Get OTP
  Future<String?> getOtp() async {
    return await _storage.read(key: _keyOtp);
  }

  // Save PIN
  Future<void> savePin(String pin) async {
    await _storage.write(key: _keyPin, value: pin);
  }

  // Get PIN
  Future<String?> getPin() async {
    return await _storage.read(key: _keyPin);
  }

  // Clear all data (e.g., when logging out)
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  Future<String?> getUserId() async {
    // Return the user ID from local storage
    // This could be based on your authentication implementation
    return 'user_id'; // Replace this with actual user ID retrieval logic
  }
}
