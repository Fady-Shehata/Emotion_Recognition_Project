import 'package:flutter/material.dart';



class RecommenScreen extends StatelessWidget {

  final String? labels;
  List<String> Emotions =[];
  RecommenScreen({
    this.labels,
  
  });

  
  @override
  Widget build(BuildContext context) {
    Emotions= labels!.split(', ');
    return Center(
      child: TextButton(
    
        child:Text(Emotions[1]),
         onPressed: () => {Navigator.pop(context)}

      ),
    );
  }
}