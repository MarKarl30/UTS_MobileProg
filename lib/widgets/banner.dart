import 'package:flutter/material.dart';

class BannerSlideShow extends StatefulWidget {
  final List<String> imagePaths;

  const BannerSlideShow({Key? key, required this.imagePaths}) : super(key: key);

  @override
  _BannerSlideShowState createState() => _BannerSlideShowState();
}

class _BannerSlideShowState extends State<BannerSlideShow> {
  int _currentIndex = 0;

  void _nextPage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.imagePaths.length;
    });
  }

  void _previousPage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + widget.imagePaths.length) %
          widget.imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              widget.imagePaths[_currentIndex],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Positioned(
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: _previousPage,
              ),
            ),
            Positioned(
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: _nextPage,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          '${_currentIndex + 1} / ${widget.imagePaths.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
