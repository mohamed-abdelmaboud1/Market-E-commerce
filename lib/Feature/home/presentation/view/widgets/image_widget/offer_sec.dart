
import 'package:flutter/material.dart';

class OfferSec extends StatelessWidget {
  const OfferSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3), // شفافية 30%
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          "15% OFF",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
