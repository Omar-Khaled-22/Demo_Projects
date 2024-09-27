import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          [Color.fromARGB(255, 126, 124, 233), Color.fromARGB(31, 201, 93, 81)],
        ),
      ),
    ),
  );
}
