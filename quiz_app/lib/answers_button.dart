import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue),
        child: Text(
          answer,
          style: GoogleFonts.lato(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
