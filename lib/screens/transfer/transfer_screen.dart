import 'dart:io';
import 'package:flutter/material.dart';

import 'package:midterm_project/screens/transfer/service/transferservice.dart';
import 'package:contacts_service/contacts_service.dart';

import 'package:midterm_project/screens/transfer/transfer_next.dart';
import 'package:midterm_project/screens/saldo_screen.dart';
import 'package:midterm_project/screens/wallet/wallet_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TransferService _transferService = TransferService();
  String _username = '';
  String _profileImage = 'https://via.placeholder.com/150';
  String? _userId;

  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  bool _isLoading = true;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    fetchContacts();
    _searchController.addListener(_filterContacts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // fungsi untuk load data profile user
  // yang sudah di fetch di transferService
  Future<void> _loadProfileData() async {
    _userId = await _transferService.getUserId();
    if (_userId != null) {
      // fetch user detail dari firestore
      final userDetails = await _transferService.fetchUserDetails();

      // fetch username
      String username = userDetails['userName'] ?? '';

      // fetch profile image
      String? profileImage = await _transferService.getProfileImage();

      // ganti value state dengan value yang sudah di fetch
      setState(() {
        _username = username;
        _profileImage = profileImage ?? '';
      });
    }
  }

  // fetch list kontak dari device
  // dengan fungsi di transferService yang sudah dibuat
  Future<void> fetchContacts() async {
    try {
      final contacts = await _transferService.getContacts();
      setState(() {
        _contacts = contacts;
        _filteredContacts = contacts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  // fungsi untuk filter kontak dari fungsi fetchContacts()
  // dengan pencarian di search bar
  void _filterContacts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _contacts.where((contact) {
        final name = contact.displayName?.toLowerCase() ?? '';
        return name.contains(query);
      }).toList();
    });
  }

  // fungsi untuk menambahkan kontak baru
  Future<void> _createNewContact() async {
    String name = '';
    String phone = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController phoneController = TextEditingController();

        return AlertDialog(
          title:
              const SizedBox(height: 60, child: Text('Tambahkan kontak baru')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Nama'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(hintText: 'Nomor telepon'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                name = nameController.text.trim();
                phone = phoneController.text.trim();

                if (name.isEmpty || phone.isEmpty) {
                  // jika nama atau nomor telepon kosong tampilkan dialog error
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content:
                            const Text('Nama dan nomor telepon harus diisi.'),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.of(context)
                      .pop(); // jika nama dan nomor telepon diisi tutup dialog
                }
              },
            ),
          ],
        );
      },
    );

    // lanjutkan tambah kontak baru jika nama dan nomor telepon diisi
    final newContact = Contact(
      givenName: name,
      phones: [Item(label: 'mobile', value: phone)],
    );

    try {
      await ContactsService.addContact(newContact);
      // fetch ulang kontak setelah berhasil menambahkan kontak baru
      fetchContacts();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Could not add contact: ${e.toString()}'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  // fungsi untuk mendapatkan inisial dari nama
  // yang akan dijasikan foto profile jika
  // user belum memasang foto profile
  String getInitials(String name) {
    final parts = name.split(' ');
    return parts
        .map((part) => part.isNotEmpty ? part[0] : '')
        .join()
        .toUpperCase();
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
            "Transfer",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1.0),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: _profileImage.isNotEmpty
                                  ? (_profileImage.startsWith('http')
                                      ? NetworkImage(_profileImage)
                                      : FileImage(File(_profileImage)))
                                  : null,
                              backgroundColor: _profileImage.isEmpty
                                  ? Colors.blueAccent
                                  : Colors.transparent,
                              child: _profileImage.isEmpty
                                  ? Text(
                                      getInitials(_username),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 13),
                            Text(
                              _username.isNotEmpty ? _username : 'Unknown User',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WalletScreen()),
                                  );
                                },
                                icon: const Icon(Icons.credit_card),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            SizedBox(
                              width: 145,
                              height: 65,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SaldoScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 26,
                                      child: Icon(Icons.money),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Isi Saldo",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 145,
                              height: 65,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Show the popup when the button is pressed
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Informasi'),
                                      content: const Text(
                                          'Mohon maaf, fitur belum tersedia.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 16,
                                        child: Icon(Icons.attach_money)),
                                    SizedBox(width: 8),
                                    Text(
                                      "Tarik Tunai",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 5.0, bottom: 15.0, left: 15.0, right: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1.0),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Transfer ke orang lain",
                          style: TextStyle(
                            color: Color.fromARGB(150, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Search bar
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Cari kontak anda...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  prefixIcon: const Icon(Icons.search),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                onPressed: _createNewContact,
                                tooltip: 'Add Contact',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 270.0,
                          child: _filteredContacts.isEmpty
                              ? const Center(
                                  child: Text('Kontak tidak ditemukan'))
                              : ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: _filteredContacts.length,
                                  itemBuilder: (context, index) {
                                    final contact = _filteredContacts[index];
                                    return Center(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 4.0,
                                            bottom: 5.0,
                                            left: 3.0,
                                            right: 3.0),
                                        padding: const EdgeInsets.all(1.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.grey[100],
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          title: Text(
                                              contact.displayName ?? 'No Name'),
                                          subtitle: Text(
                                            contact.phones != null &&
                                                    contact.phones!.isNotEmpty
                                                ? contact.phones!.first.value ??
                                                    'No phone number'
                                                : 'No phone number',
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TransferNext(
                                                  receiverName:
                                                      contact.displayName ??
                                                          'No Name',
                                                  receiverNumber:
                                                      contact.phones != null &&
                                                              contact.phones!
                                                                  .isNotEmpty
                                                          ? contact
                                                                  .phones!
                                                                  .first
                                                                  .value ??
                                                              'No phone number'
                                                          : 'No phone number',
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
