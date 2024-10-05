import 'package:flutter/material.dart';
import '/widgets/currency_formatter.dart';

class TransferNext extends StatefulWidget {
  final String receiverName;
  final String receiverNumber;

  const TransferNext({
    Key? key,
    required this.receiverName,
    required this.receiverNumber,
  }) : super(key: key);

  @override
  State<TransferNext> createState() => _TransferNextState();
}

class _TransferNextState extends State<TransferNext> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  void _continueDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sukses'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onContinuePressed() async {
    String amount = _amountController.text;

    // cek apakah jumlah transfer valid atau tidak
    if (!_isAmountValid()) {
      return; // tidak bisa lanjut jika jumlah transfer tidak valid
    }

    setState(() {
      _isLoading = true; // mulai loading
    });

    // delay 2 detik untuk simulasi loading
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false; // stop loading
    });

    // tampilkan dialog sukses setelah selesai loading
    _continueDialog(
        'Dana berhasil ditransfer sebesar $amount kepada ${widget.receiverName}');
  }

  // cek apakah jumlah transfer valid atau tidak dengan value boolean
  bool _isAmountValid() {
    String amountText = _amountController.text;

    // hapus semua karakter selain angka transfer
    double amount =
        double.tryParse(amountText.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;

    if (amountText.isEmpty) {
      _errorMessage = null; // jika kosong, hapus error
      return false;
    }
    if (amount < 10000) {
      _errorMessage = 'Minimal top up adalah Rp 10.000';
      return false;
    }
    if (amount > 2000000) {
      _errorMessage = 'Maksimal transfer adalah Rp 2.000.000';
      return false;
    }

    _errorMessage = null; // jika jumlah transfer sesuai atau valid hapus error
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: Colors.blueAccent,
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'Transfer',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1.0),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Transfer ke:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${widget.receiverName} - ${widget.receiverNumber}',
                              style: const TextStyle(
                                color: Color.fromARGB(150, 0, 0, 0),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                CurrencyInputFormatter(decimalPlaces: 0),
                              ],
                              onChanged: (value) {
                                setState(
                                    () {}); // perbarui tampilan setiap kali input berubah untuk menampilkan error message
                              },
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Send amount',
                                border: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                            if (_errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  _errorMessage!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _noteController,
                              decoration: const InputDecoration(
                                hintText: 'Tambahkan pesan (opsional)',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isAmountValid() && !_isLoading
                          ? _onContinuePressed
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_isLoading) // tampilkan loading indicator jika sedang loading untuk dialog popup
              Container(
                color: Colors.black54, // buat layar abu-abu
                child: const Center(
                  child:
                      CircularProgressIndicator(), // tampilkan loading indicator
                ),
              ),
          ],
        ),
      ),
    );
  }
}
