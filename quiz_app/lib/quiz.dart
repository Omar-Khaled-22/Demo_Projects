import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;

  List<String> selectedAnswers = [];

  @override
  void initState() {
    currentScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      currentScreen = QuestionsScreen(
        // anotherOne: anotherOne,
        onSelectAnswer: selectAnswer,
      );
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = ResultScreen(
          switchScreen: switchScreen2,
          selectedAnswers: selectedAnswers,
        );
      });
    }
  }

  void switchScreen2() {
    selectedAnswers = [];
    setState(() {
      currentScreen = QuestionsScreen(
        // anotherOne: anotherOne,
        onSelectAnswer: selectAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 1, 107, 194),
              Color.fromARGB(255, 99, 148, 205)
            ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
            child: currentScreen,
          ),
        ),
      ),
    );
  }
}
