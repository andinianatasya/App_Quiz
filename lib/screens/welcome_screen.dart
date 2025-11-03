import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/welcome_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return WelcomeWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: screenHeight * 0.55),

          Container(
            width: screenWidth * 0.9,
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Selamat Datang di WorldExplorer!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF311B92),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Tebak tempat-tempat terkenal di dunia dan buktikan wawasanmu! 🚀',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          PrimaryButton(
            text: 'LANJUT',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/input-nama');
            },
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}