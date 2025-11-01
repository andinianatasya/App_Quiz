import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/gradient_backgound.dart';
import '../providers/quiz_provider.dart';
import '../widgets/answer_option.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Timer? _timer;
  int _secondsRemaining = 15;

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining = 15;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      final quizProvider = Provider.of<QuizProvider>(context, listen: false);

      if (quizProvider.hasAnswered) {
        timer.cancel();
        return;
      }

      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        quizProvider.answerQuestion(-1);
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        
        if (!quiz.hasAnswered && _timer?.isActive == false) {
          _startTimer();
        }

        final question = quiz.currentQuestion;

        return GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Text(
                                  _secondsRemaining.toString().padLeft(2, '0'),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF311B92),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),

                            if (question.imageAsset != null)
                              Container(
                                height: screenHeight * 0.25,
                                margin: const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(question.imageAsset!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                            Text(
                              'Pertanyaan ${quiz.currentQuestionIndex + 1} dari ${quiz.totalQuestions}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),

                            Text(
                              question.questionText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),

                            ...question.options.asMap().entries.map((entry) {
                              int index = entry.key;
                              String optionText = entry.value;

                              return AnswerOption(
                                optionText: optionText,
                                color: quiz.getOptionColor(index),
                                icon: quiz.getOptionIcon(index),
                                iconColor: quiz.getOptionIconColor(index),
                                onTap: () {
                                  if (!quiz.hasAnswered) {
                                    quiz.answerQuestion(index);
                                    _timer?.cancel();
                                  }
                                },
                              );
                            }),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    if (quiz.hasAnswered)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            quiz.nextQuestion(context);
                          },
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.arrow_forward, color: Color(0xFF311B92)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}