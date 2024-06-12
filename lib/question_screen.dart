import 'package:flutter/material.dart';
import 'package:practice_project/answer_button.dart';
import 'package:practice_project/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectAnswer});

  final void Function(String answer) selectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}


class _QuestionScreenState extends State<QuestionScreen> {
 
  var questionIndex = 0;

  void onClick(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 40,
            ),

            //we used the spread operator here cause we cannot pass the list inside the children, so we used spread operator to convert it into individual item
            ...currentQuestion.shuffledAnswers().map(
              (answer) {
                return AnswerButton(answer, () {
                  onClick(answer);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
