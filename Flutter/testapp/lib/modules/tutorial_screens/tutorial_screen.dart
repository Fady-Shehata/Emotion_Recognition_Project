import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testapp/modules/Take_Image/AddImage.dart';
import 'package:testapp/modules/Take_Image/take_image.dart';
import 'package:testapp/modules/home/home_screen.dart';
import 'package:testapp/modules/info%20screen/info_screen.dart';

class TutorialScreen extends StatefulWidget {
 

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 2, 25, 78),
              Color.fromARGB(255, 0, 0, 0)
            ])),
        child: IntroductionScreen(
          pages: [

            PageViewModel(
              title: 'Welcome',
              body: 'We aim to help you, Express your emotions and we will try to help you ',
              decoration: getPageDecoration()
            ),
            PageViewModel(
              title: 'Face Recognition',
              body: 'Express your emotions throw your face and get a recommendation',
              image: buildImage('assets/images/face_recognition.jpg'),
              decoration: getPageDecoration()
            ),
            PageViewModel(
              title: 'Recommendation Feature',
              body: 'Depending on your current emotion, choose a suitable recommendation',
              decoration: getPageDecoration(
              )
              
            )
          ],
          
          done: Text('Start',style: TextStyle(fontWeight: FontWeight.bold),),
          onDone: (){
           goInfoScreen(context);
          },
          next: Text('Next',style: TextStyle(fontWeight: FontWeight.bold),),
          showSkipButton: true,
          skip: Text('Skip',style: TextStyle(fontWeight: FontWeight.bold),),
          onSkip: (){ goHome(context); },
          dotsDecorator: getDotsDecoration(),
          dotsFlex: 1,
          globalBackgroundColor: Color.fromARGB(255, 2, 25, 78),
          //freeze: true,
          //animationDuration: 1000,
        ),
      ),
    );
  }
}

Widget buildImage(String path){
  return Center(child: Image.asset(path,width: 300,),);
}

PageDecoration getPageDecoration() => PageDecoration(
  titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.blueAccent[700]),
  bodyTextStyle: TextStyle(fontSize: 20,color:Colors.blue[100]),
  imagePadding: EdgeInsets.all(20.0),
  footerPadding: EdgeInsets.all(20.0).copyWith(bottom: 0),
  pageColor: Color.fromARGB(255, 2, 25, 78),
);

DotsDecorator getDotsDecoration()=> DotsDecorator(
  color: Color.fromARGB(255, 0, 0, 0),
  size: Size(10,10),
  activeSize: Size(20,10),
  activeShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24)
  )
);

void goHome(context) =>  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>TakeImage() ));
void goInfoScreen(context) =>  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>TakeImage() ));
