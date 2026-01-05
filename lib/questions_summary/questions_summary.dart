import 'package:flutter/material.dart';
import 'package:plants_app/questions_summary/summer_data.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.dataSummary , {super.key});

  final List<Map<String , Object>> dataSummary;

  @override
  Widget build (context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: 
            dataSummary.map(
              (item) {
              return SummerData(item);
            },
             ).toList(),
        ),
      ),
    );
  }
}