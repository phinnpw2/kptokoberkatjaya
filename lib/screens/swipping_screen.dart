// swipping_screen.dart
import 'package:flutter/material.dart';

class SwippingScreen extends StatelessWidget {
  final Widget child;

  const SwippingScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/bg1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Scrollable content
          SafeArea(
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
} 