import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class GradientContainer extends StatefulWidget {
  final List<Color> colors;
  GradientContainer(this.colors, {super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  String assetName = 'assets/images/dice-1.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.colors),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            assetName,
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                int diceRoll = randomizer.nextInt(6) + 1;
                assetName = 'assets/images/dice-$diceRoll.png';
              });
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(20),
              foregroundColor: Colors.purple,
              textStyle: const TextStyle(fontSize: 28),
            ),
            child: const Text('Roll Dice'),
          ),
        ]),
      ),
    );
  }
}
