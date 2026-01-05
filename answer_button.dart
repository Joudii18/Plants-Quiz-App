import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton ({super.key , required this.answerText , required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build (context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10), // Ok
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 10, 96, 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        )
      )
    , child: Text(
      answerText,
      textAlign: TextAlign.center,
    ),
    );
  }

}