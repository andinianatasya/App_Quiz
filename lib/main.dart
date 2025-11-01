import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../screens/intro_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/score_screen.dart';
import '../screens/welcome_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizdin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/input-nama': (context) => const IntroScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/score': (context) => const ScoreScreen(),
      },
    );
  }
}