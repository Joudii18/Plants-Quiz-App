import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/answer_button.dart';
import 'package:plants_app/data/questions.dart';
//import 'package:plants_app/models/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {

  QuestionsScreen({super.key , required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  State<QuestionsScreen> createState () {
    return _QuizState();
  }
}

class _QuizState extends State<QuestionsScreen> {

  void questionAnswerd(String answerChosen) {
    widget.onSelectAnswer(answerChosen);
    setState(() {
      currentQuestionIndex++;
    });
  }

  var currentQuestionIndex = 0;

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndex];
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentQuestion.text , 
            style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
             ),
             textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item){ 
              return
              AnswerButton(answerText: item, onTap:() {
                questionAnswerd(item);
                }
              );
            }
            )
          ],
        ),
      ),
    );
  }
}