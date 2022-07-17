import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testapp/modules/Face/face_screen.dart';
import 'package:testapp/modules/no%20emotion/noemotion_screen.dart';
import 'package:testapp/modules/tutorial_screens/tutorial_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [NoEmotionScreen(), FaceScreen()];
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      // important widget to control each screen
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.help),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => TutorialScreen()));
          },
        ),
        title: Text(
          'My Emotions',
        ),
        /*  actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Fady'); //OR build a void function outside class
            },
          ),
        ],*/
        centerTitle: true,
        // backgroundColor: Colors.black54,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        //onPressed: () => _startAddNewTransaction(context),
        onPressed: () {
          setState(() {
            if(currentIndex==0){currentIndex = 1;}
            else{currentIndex=0;}
            
          });
        },
      ),
      body: screens[currentIndex]
        //SingleChildScrollView()  scroll n scrollDirection: Axis,hirizontal or . vertical
        
        /*Column(
        //  mainAxisSize: MainAxisSize.min,  Min: ywsl l a5r 7aga fal column, max (defualt): l a5r al shasha
           // mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                width: 300,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                  
                
                  
                  /*  Image(
                    image: NetworkImage(
                            'https://img.a.transfermarkt.technology/portrait/big/28003-1631171950.jpg?lm=1'
                            ),
                    height: 300.00,
                    width: 300.00,
                    fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      width: double.infinity,
                      padding: EdgeInsetsDirectional.only(bottom: 20,top: 20),
                      child: Text('Messi',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                   ),
                    )*/
                  ],
                ),
              ),
            )

          ],
        ),*/
     // We can add (SafeArea) so if we don't have app bar the text starts after status bar
    );
  }
}
