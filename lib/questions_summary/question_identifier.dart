import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  QuestionIdentifier({super.key , required this.questionIndex , required this.isCorrectAnswer});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
      color: isCorrectAnswer
      ? const Color.fromARGB(255, 104, 211, 108)
      : const Color.fromARGB(255, 228, 138, 81),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      questionIndex.toString(),
      style: TextStyle(
        color: const Color.fromARGB(255, 1, 28, 4),
        fontWeight: FontWeight.bold,
      ),
    ),
    );
  }
}