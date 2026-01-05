import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/questions_summary/question_identifier.dart';

class SummerData extends StatelessWidget {
  const SummerData(this.summaryD , {super.key});

  final Map<String,Object> summaryD;

  @override
  Widget build (context) {

    final ifCorrectAnswer = summaryD['correct_answer'] == summaryD['chosen_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QuestionIdentifier(
          questionIndex: summaryD['question_index'] as int, 
          isCorrectAnswer: ifCorrectAnswer),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryD['question'] as String , 
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255)
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  summaryD['chosen_answer'] as String,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 233, 150, 98),
                    //ofontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  summaryD['correct_answer'] as String,
                  style:TextStyle(
                    color: const Color.fromARGB(255, 104, 211, 108),
                  )
                )
            ],),
          )
      ],
    );
  }
}