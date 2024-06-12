import 'package:flutter/material.dart';
import 'package:practice_project/data/questions.dart';
import 'package:practice_project/question_screen.dart';
import 'package:practice_project/result_screen.dart';
import 'package:practice_project/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'active-screen';

  void userSelectedAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(nextPage: switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(selectAnswer: userSelectedAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        userAnswers: selectedAnswers,
        onRestart: onRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
