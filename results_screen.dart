import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/data/questions.dart';
import 'package:plants_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.chosenData , this.onRestart , {super.key});

  final List<String> chosenData;
  final void Function() onRestart;

  List<Map<String, Object>> getData () {
    final List<Map<String,Object>> summary = [];
    for (var i=0 ; i<chosenData.length ; i++) {
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenData[i],
      }
      );
    }
    return summary;
  }

  @override 
  Widget build(context) {
    final summaryData = getData(); // Stored here is a list of maps, containing all the data we need:)
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) { // lenght of a list
      return data['chosen_answer'] == data['correct_answer'];
    }
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answerd $numCorrectQuestions out of $numTotalQuestions questions correctly!" ,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
            ),
            SizedBox(
              height: 30,
              ),
              QuestionsSummary(summaryData),
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: onRestart, 
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.refresh , color: Colors.white,),
                label: Text("Restart Quiz!"),
               )
          ],
        ),
      ),
    );
  }
}