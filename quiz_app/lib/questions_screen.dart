import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answers_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required,
    required this.onSelectAnswer,
    // required this.anotherOne}
  });

  final void Function(String) onSelectAnswer;
  // final void Function() anotherOne;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    // widget.anotherOne;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            currentQuestion.text,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          for (final item in currentQuestion.shuffleAnswers())
            AnswerButton(
                answer: item,
                onTap: () {
                  answerQuestion(item);
                })

          // ...currentQuestion.shuffleAnswers().map(
          //       (item) => AnswerButton(
          //         answer: item,
          //         onTap: () {
          //           answerQuestion(item);
          //         },
          //       ),
          //     ),
        ],
      ),
    );
  }
}
