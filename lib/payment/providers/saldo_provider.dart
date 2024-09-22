import 'package:flutter/foundation.dart';

class SaldoProvider with ChangeNotifier {
  double _saldo = 1500000; // Saldo awal Rp 1.500.000

  double get saldo => _saldo;

  void setSaldo(double newSaldo) {
    _saldo = newSaldo;
    notifyListeners();
  }

  void kurangiSaldo(double jumlah) {
    if (_saldo >= jumlah) {
      _saldo -= jumlah;
      notifyListeners();
    }
  }

  void tambahSaldo(double jumlah) {
    _saldo += jumlah;
    notifyListeners();
  }
}
