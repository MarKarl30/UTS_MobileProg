import 'dart:async';
import 'package:flutter/material.dart';

class BannerSlideShow extends StatefulWidget {
  final List<String> imagePaths;

  const BannerSlideShow({Key? key, required this.imagePaths}) : super(key: key);

  @override
  _BannerSlideShowState createState() => _BannerSlideShowState();
}

class _BannerSlideShowState extends State<BannerSlideShow> {
  int _currentIndex = 0;
  PageController? _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Initialize PageController
    _pageController = PageController(initialPage: _currentIndex);

    // Start the automatic slide every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < widget.imagePaths.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      // Animate to the next page
      _pageController?.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when disposing the widget
    _pageController?.dispose(); // Dispose the PageController safely
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: widget.imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imagePaths[index],
                fit: BoxFit
                    .contain, // Changed from BoxFit.cover to BoxFit.contain
                width: double.infinity,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagePaths.length,
            (index) => _buildDot(index),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentIndex == index ? 12 : 8,
      height: _currentIndex == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.white : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
