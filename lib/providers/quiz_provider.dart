import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  String? userName;
  int _score = 0;
  int _currentQuestionIndex = 0;
  int? _selectedIndex;
  bool _answered = false;

  final List<Question> _questions = [
    //masih contoh soal dari figma org ini y
    Question(
      questionText: 'What is the name of the toy cowboy in Toy Story?',
      options: ['Smith', 'Woody', 'Jack', 'Buzz Lightyear'],
      correctAnswerIndex: 1,
      imageAsset: 'assets/images/soal1.png',
    ),
    Question(
      questionText: 'a b c d',
      options: ['a', 'b', 'c', 'd'],
      correctAnswerIndex: 1,
    ),
  ];

  int get score => _score;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  bool get hasAnswered => _answered;
  int? get selectedIndex => _selectedIndex;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void answerQuestion(int selectedIndex) {
    if (_answered) return;

    _answered = true;
    _selectedIndex = selectedIndex;

    if (selectedIndex == currentQuestion.correctAnswerIndex) {
      _score++;
    }
    notifyListeners();
  }

  Color getOptionColor(int index) {
    if (!_answered) {
      return Colors.white;
    }
    if (index == currentQuestion.correctAnswerIndex) {
      return Colors.green.shade100;
    }
    if (index == _selectedIndex) {
      return Colors.red.shade100;
    }
    return Colors.white;
  }

  IconData? getOptionIcon(int index) {
     if (!_answered) {
      return null;
    }
    if (index == currentQuestion.correctAnswerIndex) {
      return Icons.check_circle;
    }
    if (index == _selectedIndex) {
      return Icons.cancel;
    }
    return null;
  }

   Color getOptionIconColor(int index) {
    if (!_answered) {
      return Colors.transparent;
    }
    if (index == currentQuestion.correctAnswerIndex) {
      return Colors.green;
    }
    if (index == _selectedIndex) {
      return Colors.red;
    }
    return Colors.transparent;
  }


  void nextQuestion(BuildContext context) {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _answered = false;
      _selectedIndex = null;
      notifyListeners();
    } else {
      Navigator.pushReplacementNamed(context, '/score');
    }
  }

  void resetQuiz() {
    _score = 0;
    _currentQuestionIndex = 0;
    _answered = false;
    _selectedIndex = null;
    notifyListeners();
  }
}