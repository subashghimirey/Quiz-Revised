class QuizQuestions {
  QuizQuestions(this.text, this.answers);

  String text;
  List<String> answers;

  List<String> shuffledAnswers() {
    List<String> shuffled = answers.toList();

    shuffled.shuffle();
    return shuffled;
  }
}
