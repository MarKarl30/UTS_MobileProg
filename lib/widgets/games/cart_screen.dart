import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> initialCartItems;
  final Function(Map<String, dynamic>) onRemove;
  final Function onPurchase;
  final dynamic onCartUpdate;

  const CartPage({
    Key? key,
    required this.initialCartItems,
    required this.onRemove,
    required this.onPurchase,
    required this.onCartUpdate,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.initialCartItems);
  }

  void removeItem(Map<String, dynamic> item) {
    setState(() {
      cartItems.remove(item);
    });
    widget.onRemove(item);
    widget.onCartUpdate(cartItems);
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item['price']);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(199, 3, 25, 49),
        title: const Text(
          "List Item",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(199, 3, 25, 49),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 5, // Add shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    color: Colors.grey[850], // Card background color
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ), // Adjust content padding
                      leading: const Icon(
                        Icons.shopping_bag,
                        color: Colors.amber, // Icon color
                      ),
                      title: Text(
                        item['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Rp ${item['price']}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          removeItem(item);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            // Container to center the total price and button
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total: Rp $totalPrice',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Konfirmasi Pembayaran'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Total: Rp $totalPrice'),
                                const SizedBox(height: 15),
                                const TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Enter your PIN',
                                  ),
                                  obscureText: true,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  widget.onPurchase();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Payment successful!'),
                                    ),
                                  );
                                  Navigator.of(context).popUntil((route) =>
                                      route.isFirst); // Redirect ke home
                                },
                                child: const Text('Pay'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Konfirmasi Pembayaran'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(198, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
