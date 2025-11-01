import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
    Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0F3A81),
          Color(0xFF9AA1EF),
        ],
      ),
    ),
    child: child,
   );
  }
}