import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  String? userName;
  int _score = 0;
  int _currentQuestionIndex = 0;
  int? _selectedIndex;
  bool _answered = false;

  final List<Question> _questions = [
    Question(
      questionText: 'Tempat apakah ini? Sebuah menara besi tinggi di Paris, Prancis',
      options: ['Menara Pisa', 'Menara Eiffel', 'Big Ben', 'Menara Tokyo'],
      correctAnswerIndex: 1,
      imageAsset: 'assets/images/soal1.jpg',
    ),
    Question(
      questionText: 'Bangunan ini dikenal sebagai simbol Taj Mahal. Terletak di negara mana?',
      options: ['Indonesia', 'Malaysia', 'India', 'Thailand'],
      correctAnswerIndex: 2,
      imageAsset: 'assets/images/soal2.jpg',
    ),
    Question(
      questionText: 'Tempat apakah ini? Dinding panjang yang membentang di Tiongkok.',
      options: ['Great Wall of China', 'Forbidden City', 'Angkor Wat', 'Bamboo Forest'],
      correctAnswerIndex: 0,
      imageAsset: 'assets/images/soal3.jpg',
    ),
    Question(
      questionText: 'Tempat apakah ini? Gurun luas dengan piramida besar di Afrika Utara.',
      options: ['Gobi Desert', 'Kalahari Desert', 'Atacama Desert', 'Sahara Desert'],
      correctAnswerIndex: 3,
      imageAsset: 'assets/images/soal4.jpg',
    ),
    Question(
      questionText: 'Kota merah yang diukir di tebing batu di Yordania. Tempat apakah ini?',
      options: ['Luxor', 'Petra', 'Babylon', 'Persepolis'],
      correctAnswerIndex: 1,
      imageAsset: 'assets/images/soal5.jpg',
    ),
    Question(
      questionText: 'Tempat apakah ini? Air terjun terbesar di dunia di perbatasan Zambia dan Zimbabwe.',
      options: ['Niagara Falls', 'Victoria Falls', 'Iguazu Falls', 'Angel Falls'],
      correctAnswerIndex: 1,
      imageAsset: 'assets/images/soal6.jpg',
    ),
    Question(
      questionText: 'Bangunan putih berbentuk setengah bola di Sydney, Australia. Apa nama tempat ini?',
      options: ['Melbourne Hall', 'Harbour Bridge', 'Sydney Tower', 'Sydney Opera House'],
      correctAnswerIndex: 3,
      imageAsset: 'assets/images/soal7.jpg',
    ),
    Question(
      questionText: 'Kota Dubai terkenal dengan gedung tertinggi di dunia. Apa nama gedungnya?',
      options: ['Burj Khalifa', 'Empire State Building', 'Shanghai Tower', 'Petronas Twin Towers'],
      correctAnswerIndex: 0,
      imageAsset: 'assets/images/soal8.jpg',
    ),
    Question(
      questionText: 'Tempat apakah ini? Kota kuno di atas gunung di Peru.',
      options: ['Great Wall', 'Angkor Wat', 'Machu Picchu', 'Chichen Itza'],
      correctAnswerIndex: 2,
      imageAsset: 'assets/images/soal9.jpg',
    ),
    Question(
      questionText: 'Kota terapung dengan kanal dan gondola di Italia. Apa nama tempat ini?',
      options: ['Roma', 'Milan', 'Venesia', 'Florence'],
      correctAnswerIndex: 2,
      imageAsset: 'assets/images/soal10.jpg',
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