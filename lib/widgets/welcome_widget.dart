import 'package:flutter/material.dart';
import 'gradient_backgound.dart';

class WelcomeWidget extends StatelessWidget {
  final Widget child;

  const WelcomeWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: screenHeight * 0.7,
                child: Image.asset(
                  'assets/images/intro.png',
                  fit: BoxFit.cover,
                ),
              ),

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}