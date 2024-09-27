import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.selectedAnswers, super.key, required this.switchScreen});
  final List<String> selectedAnswers;
  final void Function() switchScreen;
  List<Map<String, Object>> getSelectedAnswers() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'selected-answer': selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryAnswers = getSelectedAnswers();
    final numOfAnsweredQuestions = questions.length;
    final numOfCorrectAnswers = summaryAnswers
        .where((element) =>
            element['selected-answer'] == element['correct-answer'])
        .length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You answered $numOfCorrectAnswers out of $numOfAnsweredQuestions questions correctly!',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(
          height: 50,
        ),
        QuestionSummary(summary: getSelectedAnswers()),
        SizedBox(
          height: 50,
        ),
        TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: switchScreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restart_alt_outlined),
                Text('Restart Quiz')
              ],
            ))
      ],
    );
  }
}
