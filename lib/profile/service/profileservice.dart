import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _keyUsername = 'username';
  static const String _keyOtp = 'otp';
  static const String _keyPassword = 'password'; // Tambahkan kunci untuk password

  // Menyimpan nama pengguna
  Future<void> saveUsername(String username) async {
    await _storage.write(key: _keyUsername, value: username);
  }

  // Mengambil nama pengguna
  Future<String?> getUsername() async {
    return await _storage.read(key: _keyUsername);
  }

  // Menyimpan OTP
  Future<void> saveOtp(String otp) async {
    await _storage.write(key: _keyOtp, value: otp);
  }

  // Mengambil OTP
  Future<String?> getOtp() async {
    return await _storage.read(key: _keyOtp);
  }

  // Menyimpan Password
  Future<void> savePassword(String password) async {
    await _storage.write(key: _keyPassword, value: password);
  }

  // Mengambil Password
  Future<String?> getPassword() async {
    return await _storage.read(key: _keyPassword);
  }

  // Menghapus semua data (misalnya saat logout)
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}