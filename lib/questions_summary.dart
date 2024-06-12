import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.dataSummary});

  final List<Map<String, Object>> dataSummary;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: dataSummary.map((data) {
          var isCorrect = data['user_answer'] == data['correct_answer'];
          return Row(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: isCorrect? Colors.green : Colors.pink,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(((data['question_index'] as int) + 1).toString()),
              ),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Text(
                        data['question'].toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(data['user_answer'].toString(),
                          style: TextStyle(fontSize: 16, color: isCorrect? Colors.green: Colors.red)),
                      Text(data['correct_answer'].toString(),
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
