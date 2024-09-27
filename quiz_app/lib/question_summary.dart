import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({required this.summary, super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summary
                .map(
                  (item) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: item['selected-answer'] ==
                                    item['correct-answer']
                                ? Color.fromARGB(255, 196, 187, 103)
                                : Color.fromARGB(255, 229, 44, 139)),
                        child: Text(
                          ((item['question-index'] as int) + 1).toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['question'] as String,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              item['selected-answer'] as String,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: item['selected-answer'] ==
                                          item['correct-answer']
                                      ? Colors.yellow
                                      : Color.fromARGB(255, 81, 22, 22)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              item['correct-answer'] as String,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.yellow),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
