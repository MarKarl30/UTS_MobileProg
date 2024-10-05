import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/banner.dart';
import 'package:midterm_project/widgets/footer.dart';
import 'package:midterm_project/screens/home_screen.dart';

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
      TextEditingController(); // Email controlller
  String pin = "1234"; // User pin sample

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories
        .first; // at first, fist category will be the chosen categoty
    selectedOptions = widget.topUpOptions[selectedCategory] ??
        []; // Retrieve the chosen category
  }

  void _updateOptions(String category) {
    setState(() {
      selectedCategory = category; // for updating the chosen category
      selectedOptions = widget.topUpOptions[category] ??
          []; // update the category that has been chosen by the user
      selectedItems
          .clear(); // Clear the items that alr selected in one category if user decide to move to another category
    });
    print('Selected Category: $selectedCategory');
    print('Selected Options: $selectedOptions');
  }

  void _toggleSelection(Map<String, dynamic> option) {
    setState(() {
      if (selectedItems.contains(option)) {
        selectedItems.remove(
            option); // remove the selected option if user select again the items
      } else {
        selectedItems.add(
            option); // if at first, the item isn't selected by user, and then get selected.
      }
    });
  }

  void _confirmPurchase() {
    // Checking is the email alr inputted or not
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email tidak boleh kosong.")),
      );
      return;
    }

    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pilih setidaknya satu paket.")),
      );
      return;
    }

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
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'PIN',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(134, 255, 255, 255)),
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
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  // Display the items
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: selectedItems.map((item) {
                      return Container(
                        color: const Color.fromARGB(255, 24, 102, 228),
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 4),
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
                  // Purchase confirmation button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_pinController.text == pin) {
                            Navigator.of(context)
                                .pop(); // For closing the modal
                            _showSuccessNotification(); // Show succeed notification
                          } else {
                            _showErrorNotification(); // If there's something wrong
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
                          Navigator.of(context)
                              .pop(); // Close the modal if user cancel to purchasing
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
    // Redirect user to home if succeed
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Terima kasih, pembayaran berhasil!")),
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
              // Slideshow banner
              BannerSlideShow(
                imagePaths: widget.bannerImagePaths,
              ),
              const SizedBox(height: 40),
              _buildCategorySection(),
              const SizedBox(height: 60),
              _buildTopUpOptions(),
              const SizedBox(height: 50),
              _buildTopUpInfo(),
              const SizedBox(height: 40),
              _buildEmailInput(),
              const SizedBox(height: 30),
              _buildProceedButton(),
              const SizedBox(height: 90),
              Footer(),
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
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Pilih Kategori:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 35, 69),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = widget.categories[index];
              return GestureDetector(
                onTap: () => _updateOptions(category),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: selectedCategory == category
                        ? const Color.fromARGB(255, 51, 102, 255)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      category,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTopUpOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pilih Opsi Top-Up:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ...selectedOptions.map((option) {
          return GestureDetector(
            onTap: () => _toggleSelection(option), // Menangani pemilihan opsi
            child: Container(
              color: selectedItems.contains(option)
                  ? const Color.fromARGB(255, 51, 102, 255)
                  : const Color.fromARGB(255, 0, 35, 69),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(
                    selectedItems.contains(option)
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: selectedItems.contains(option)
                        ? Colors.greenAccent
                        : Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${option['name']} - Rp ${option['price']}',
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Informasi Top-Up :",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "1. Pilih langganan paket yang anda inginkan. Masing-masing paket aktif 30 hari setelah pembelian",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 15),
          Text(
            "2. Masukkan email dan pin anda secara tepat untuk melakukan pembelian item",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 15),
          Text(
            "3. Kami akan mengirimkan kode paket sesuai pembelian item Anda ke email yang diinput. Tukar kode tersebut di platform streamingnya. Apabila kode tidak segera ditukar dalam jangka waktu lebih dari 1 minggu, maka kode akan hangus ",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      controller: _emailController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Email Anda',
        labelStyle: const TextStyle(color: Color.fromARGB(134, 255, 255, 255)),
        filled: true,
        fillColor: const Color.fromARGB(255, 0, 35, 69),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildProceedButton() {
    return ElevatedButton(
      onPressed: _confirmPurchase,
      child: const Text(
        "Lanjutkan",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 51, 102, 255),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
