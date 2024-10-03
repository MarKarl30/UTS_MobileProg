import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/banner.dart';

class GenericTopUpScreen extends StatefulWidget {
  final String streamName;
  final List<String> categories;
  final Map<String, List<Map<String, dynamic>>> topUpOptions;
  final List<String> bannerImagePaths;

  const GenericTopUpScreen({
    Key? key,
    required this.streamName,
    required this.categories,
    required this.topUpOptions,
    required this.bannerImagePaths,
  }) : super(key: key);

  @override
  _GenericTopUpScreenState createState() => _GenericTopUpScreenState();
}

class _GenericTopUpScreenState extends State<GenericTopUpScreen> {
  String selectedCategory = '';
  List<Map<String, dynamic>> selectedOptions = [];
  List<Map<String, dynamic>> selectedItems = [];
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(); // Controller untuk email
  String pin = "1234"; // Contoh PIN yang benar

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories.first;
    selectedOptions = widget.topUpOptions[selectedCategory] ?? [];
  }

  void _updateOptions(String category) {
    setState(() {
      selectedCategory = category;
      selectedOptions = widget.topUpOptions[category] ?? [];
      selectedItems.clear();
    });
    print('Selected Category: $selectedCategory');
    print('Selected Options: $selectedOptions');
  }

  void _toggleSelection(Map<String, dynamic> option) {
    setState(() {
      if (selectedItems.contains(option)) {
        selectedItems.remove(option);
      } else {
        selectedItems.add(option);
      }
    });
  }

  void _confirmPurchase() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 48, 71, 94),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock, color: Colors.white),
                  const SizedBox(width: 10),
                  const Text(
                    "Masukkan PIN",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _pinController,
                    autofocus: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter your PIN',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: Colors.white),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 0, 35, 69),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  // Menampilkan daftar item yang dicentang
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: selectedItems.map((item) {
                      return Container(
                        color: const Color.fromARGB(255, 24, 102,
                            228), // Warna latar belakang saat item dipilih
                        padding:
                            const EdgeInsets.all(12), // Padding dalam container
                        margin: const EdgeInsets.only(
                            bottom: 4), // Menghilangkan gap antara item
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.greenAccent),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '${item['name']} - Rp ${item['price']}',
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30),
                  // Tombol konfirmasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_pinController.text == pin) {
                            _showSuccessNotification();
                            Navigator.of(context).pop();
                          } else {
                            _showErrorNotification();
                            Navigator.of(context).pop();
                          }
                        },
                        icon: const Icon(Icons.check, color: Colors.white),
                        label: const Text(
                          "Konfirmasi",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 35, 69),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.cancel, color: Colors.white),
                        label: const Text(
                          "Batal",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 35, 69),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSuccessNotification() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Pembayaran berhasil!")),
    );
  }

  void _showErrorNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("PIN salah, coba lagi.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Up ${widget.streamName}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(199, 3, 25, 49),
      ),
      backgroundColor: const Color.fromARGB(199, 3, 25, 49),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner Slideshow
              BannerSlideShow(
                imagePaths: widget.bannerImagePaths,
              ),
              const SizedBox(height: 40),
              _buildCategorySection(),
              const SizedBox(height: 60),
              _buildTopUpOptions(),
              const SizedBox(height: 20),
              _buildTopUpInfo(),
              const SizedBox(height: 40),
              _buildEmailInput(), // Menambahkan input email di sini
              const SizedBox(height: 30),
              _buildProceedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Device',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            dropdownColor: const Color.fromARGB(255, 48, 71, 94),
            value: selectedCategory,
            items: widget.categories.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(
                  category,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (value) {
              _updateOptions(value!);
            },
            style: const TextStyle(color: Colors.white),
            iconEnabledColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopUpOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Jenis Paket',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        ...selectedOptions.map((option) {
          return GestureDetector(
            onTap: () => _toggleSelection(option),
            child: Container(
              color: selectedItems.contains(option)
                  ? const Color.fromARGB(255, 21, 53, 85)
                  : Colors.transparent,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(
                  bottom: 4), // Menghilangkan gap antara item
              child: Row(
                children: [
                  const Icon(Icons.card_giftcard, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      option['name'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    'Rp ${option['price']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildTopUpInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Top-Up Information:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "1. Pilih dengan menekan paket yang Anda ingin berlangganan",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 15),
          Text(
            "2. Masukkan email platform streaming Anda, setelah pembayaran berhasil, dalam beberapa menit, kami akan menigirimkan kode voucher ke email Anda",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 15),
          Text(
            "3. Kode voucher wajib ditukar sebelum 30 hari setelah pembelian, lewat dari itu maka akan hangus.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Masukkan Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'email',
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: const Color.fromARGB(255, 30, 44, 54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProceedButton() {
    return ElevatedButton(
      onPressed: selectedItems.isNotEmpty ? _confirmPurchase : null,
      child: const Text('Lanjutkan'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 35, 69),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
