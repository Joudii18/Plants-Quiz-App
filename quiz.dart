import 'package:flutter/material.dart';
import 'package:plants_app/data/questions.dart';
import 'package:plants_app/questions_screen.dart';
import 'package:plants_app/results_screen.dart';
import 'package:plants_app/start_screen.dart';

class Quiz extends StatefulWidget {

  const Quiz( {super.key} );

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';   // Initial value 
  List<String> selectedAnswers =[];

  void switchScreen () {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chosenAnswer (String answerChosen) {
    selectedAnswers.add(answerChosen);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
    
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build (context) {

    Widget screenWidget = StartScreen(startQuiz: switchScreen,);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chosenAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(selectedAnswers , restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[ const Color.fromARGB(255, 12, 120, 34) 
              , const Color.fromARGB(255, 61, 151, 64)], 
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          child: screenWidget
        ),
      )
    );
  }

}