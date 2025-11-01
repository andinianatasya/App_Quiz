import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/primary_button.dart';
import '../widgets/welcome_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _startQuiz() {
    if (_formKey.currentState!.validate()) {
      Provider.of<QuizProvider>(context, listen: false)
          .setUserName(_nameController.text);
      
      Provider.of<QuizProvider>(context, listen: false).resetQuiz();
      Navigator.pushReplacementNamed(context, '/quiz');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Nama Pengguna',
                    style: TextStyle(
                      color: Color(0xFF311B92),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Masukkan nama anda',
                      filled: true,
                      fillColor: const Color(0xFFB8B8B8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Color(0xFF333465), width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          PrimaryButton(
            text: 'MULAI',
            onPressed: _startQuiz,
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}