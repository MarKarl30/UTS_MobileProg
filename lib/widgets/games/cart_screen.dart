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
  final TextEditingController _pinController = TextEditingController();
  final String _correctPin = '1234'; // Predefined correct PIN

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
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.grey[850],
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      leading: const Icon(
                        Icons.shopping_bag,
                        color: Colors.amber,
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
                    onPressed: cartItems.isNotEmpty
                        ? () {
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
                                      TextField(
                                        controller: _pinController,
                                        decoration: const InputDecoration(
                                          labelText: 'PIN',
                                        ),
                                        obscureText: true,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (_pinController.text ==
                                            _correctPin) {
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Terima kasih, pembayaran berhasil!'),
                                            ),
                                          );
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text('PIN salah!'),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text('Bayar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Batal'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: cartItems.isNotEmpty
                          ? const Color.fromARGB(198, 0, 0, 0)
                          : Colors.grey,
                    ),
                    child: const Text('Konfirmasi Pembayaran'),
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
