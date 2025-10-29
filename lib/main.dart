import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsl_pemmob/providers/quiz_provider.dart';
import 'package:utsl_pemmob/screens/intro_screen.dart';
import 'package:utsl_pemmob/screens/quiz_screen.dart';
import 'package:utsl_pemmob/screens/score_screen.dart';

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
      title: 'Quizdin?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/score': (context) => const ScoreScreen(),
      },
    );
  }
}