import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  final Function(String) onSearch;

  const SearchItem({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: widget.onSearch,
      decoration: InputDecoration(
        hintText: 'Pencarian',
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        filled: true,
        fillColor: const Color.fromARGB(135, 30, 30, 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
