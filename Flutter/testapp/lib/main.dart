import 'package:flutter/material.dart';
import 'package:testapp/layout/home_layout.dart';
import 'package:testapp/modules/counter/counter_screen.dart';
import 'package:testapp/modules/home/home_screen.dart';
import 'package:testapp/modules/tutorial_screens/tutorial_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'modules/Recommendations/main_Recommendation.dart';

void main() 
async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(         // The first screen to run in the app
      debugShowCheckedModeBanner: false,
      home:TutorialScreen(),
    );
  }
}
