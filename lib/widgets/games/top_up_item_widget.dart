import 'package:flutter/material.dart';
import 'package:midterm_project/widgets/games/cart_screen.dart';
import 'package:midterm_project/widgets/banner.dart';
import 'package:midterm_project/widgets/footer.dart';

class GenericTopUpScreen extends StatefulWidget {
  final String gameName;
  final List<String> categories;
  final Map<String, List<Map<String, dynamic>>> topUpOptions;
  final dynamic bannerImagePaths;

  const GenericTopUpScreen({
    Key? key,
    required this.gameName,
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
  List<Map<String, dynamic>> cartItems = [];
  final TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories.first;
    selectedOptions = widget.topUpOptions[selectedCategory]!;
  }

  void _updateOptions() {
    setState(() {
      selectedOptions = widget.topUpOptions[selectedCategory]!;
    });
  }

  void _addToCart(Map<String, dynamic> item) {
    if (idController.text.isEmpty) {
      // Show a Snackbar message if Game ID is not entered
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap mengisi ID Game terlebih dahulu!'),
          duration: Duration(seconds: 2),
        ),
      );
      return; // Exit the function if ID is empty
    }

    setState(() {
      cartItems.add(item); // Add item to cart
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item['name']} Ditambahkan ke keranjang!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  int get cartItemCount => cartItems.length; // Getter for cart item count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(199, 3, 25, 49),
        title: Text(
          "Top Up ${widget.gameName}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // checking the id game is already inputted or not.
                  if (idController.text.isNotEmpty) {
                    // Direct user to cart page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(
                          initialCartItems: cartItems,
                          onRemove: (item) {
                            setState(() {
                              cartItems.remove(item); // Remove cart item
                            });
                          },
                          onPurchase: () {
                            print('Pembayaran berhasil, terima kasih!');
                          },
                          onCartUpdate: (updatedCartItems) {
                            setState(() {
                              cartItems = updatedCartItems;
                            });
                          },
                        ),
                      ),
                    );
                  } else {
                    // Show snackbar message if the id is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Silakan masukkan ID Game terlebih dahulu!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
              // Show the amount of items just added
              if (cartItemCount >
                  0) // Only shows the amount if the amunt is greater than zero
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Center(
                      child: Text(
                        '$cartItemCount',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(199, 3, 25, 49),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner slideshow
              BannerSlideShow(
                imagePaths: widget.bannerImagePaths,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pilih Kategori',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildCategoryDropdown(),
                    const SizedBox(height: 20),
                    _buildTopUpInfo(),
                    const SizedBox(height: 30),
                    _buildIdInput(),
                    const SizedBox(height: 30),
                    const Text(
                      'Item top-up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Display top-up items
                    ...selectedOptions.map((option) {
                      return _buildTopUpItem(option);
                    }).toList(),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build ID input box
  Widget _buildIdInput() {
    return TextField(
      controller: idController,
      decoration: InputDecoration(
        labelText: 'Masukkan ID Game',
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.email, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  // Method to build category dropdown
  Widget _buildCategoryDropdown() {
    return DropdownButton<String>(
      value: selectedCategory,
      dropdownColor: Colors.blueGrey,
      iconEnabledColor: Colors.white,
      isExpanded: true,
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
        setState(() {
          selectedCategory = value!;
          _updateOptions();
        });
      },
    );
  }

  // Method to build top-up information section
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
            "1. Masukkan item yang ingin dibeli dengan klik icon keranjang di sebelah kanan item",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 15),
          Text(
            "2. Masukkan ID Game Anda dengan seksama",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 15),
          Text(
            "3. Lakukan pembayaran di keranjang, klik icon keranjang di pojok kanan. Masukkan Pin dan konfirmasi pembayarannya",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Method to build individual top-up item
  Widget _buildTopUpItem(Map<String, dynamic> option) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 53, 85),
      ),
      child: ListTile(
        title: Text(
          option['name'],
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'Rp ${option['price']}',
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart, color: Colors.green),
          onPressed: () => _addToCart(option),
        ),
      ),
    );
  }
}
