import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildImage(
  String imageUrl,
  int index,
  BuildContext context,
  String name,
) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 7.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(
                  5), // Slight rounding for the text background
            ),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Courier New',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget pageIndicator(int index, int length) => AnimatedSmoothIndicator(
      activeIndex: index,
      count: length,
      effect: const SwapEffect(
          dotColor: Colors.black26, activeDotColor: Colors.blue, dotHeight: 5),
    );
