import 'package:flutter/material.dart';
import 'package:practice_project/data/questions.dart';
import 'package:practice_project/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.userAnswers, required this.onRestart});

  final List<String> userAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getDataSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': userAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getDataSummary();
    var totalQuestions = questions.length;
    var correctAnswers = summaryData.where((data) {
      return (data['user_answer'] == data['correct_answer']);
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Scored $correctAnswers  out of $totalQuestions", style: const TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w500),),
            QuestionsSummary(dataSummary: getDataSummary()),
            ElevatedButton.icon(
                
                onPressed: onRestart,
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart", style: TextStyle(fontSize: 20),), 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 79, 166, 104),
                

              ),)
          ],
        ),
      ),
    );
  }
}
