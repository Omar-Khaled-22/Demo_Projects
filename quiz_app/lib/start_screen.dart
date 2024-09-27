import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 350,
        ),
        const SizedBox(height: 50),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          icon: const Icon(Icons.arrow_right_outlined),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
          // style:ButtonStyle(shape: MaterialStateProperty.all( )
          // style: ButtonStyle(
          //   shape: MaterialStateProperty.all(
          //     ContinuousRectangleBorder(
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(10),
          //       ),
          //     ),
          //   ),
          //   backgroundColor:
          //       MaterialStateProperty.all(Colors.transparent),
          // ),
          onPressed: switchScreen,
          label: const Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
