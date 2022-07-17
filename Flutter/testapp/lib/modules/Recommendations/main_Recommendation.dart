//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:recommendations/Movies.dart';
//import 'package:recommendations/Music.dart';
//import 'package:recommendations/Quotes.dart';
//import 'package:recommendations/SelectionScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/modules/Recommendations/SelectionScreen.dart';
import 'package:testapp/modules/home/home_screen.dart';

class recommendations extends StatefulWidget {
  
  recommendations({Key? key,required String? Emotion }) : super(key: key);

  @override
  State<recommendations> createState() => _recommendationsState();
}



class _recommendationsState extends State<recommendations> {
 
String? Emotion="";
_recommendationsState({
  this.Emotion,
});

  @override
  Widget build(BuildContext context) {
    print(" ******${Emotion}");
    return MaterialApp
    (
      
        /* routes: 
      {
        "Quotes" : (context)
        {
          return Quotes();
        },
        "Movies" : (context)
        {
          return Movies(Emotion: Emotion , recommendationType : "m" );
        },
        "Music" : (context)
        {
          return Music();
        },
      },*/

      home: HomeScreen()
    
    );
  }
}