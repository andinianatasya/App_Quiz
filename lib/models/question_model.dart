class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String? imageAsset;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    this.imageAsset,
  });
}