import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts'

class StartScreen extends StatelessWidget {
  const StartScreen ( { required this.startQuiz , super.key});

  final void Function() startQuiz;
  
  @override
  Widget build(BuildContext context) {
    return Center(  // الشاشة كانت ماخذة حتة صغيرة ، بعده اخذت المحيط كامل
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/Plant.png" , 
          width: 200,),
          SizedBox(
            height: 50,
          ),
          Text(
            "Learn more about Plants!" ,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 25
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz, 
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 4, 141, 33),
            ),
            icon: Icon(Icons.arrow_right_alt , color: Color.fromARGB(255, 4, 141, 33),),
            label: Text("Start Challenge!" , textAlign: TextAlign.center, )),
        ],
      ),
    );
  }
}