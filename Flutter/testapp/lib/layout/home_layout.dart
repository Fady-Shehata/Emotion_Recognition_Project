import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/modules/Emotions/emotions_screen.dart';
import 'package:testapp/modules/Face/face_screen.dart';
import 'package:testapp/modules/Recommendations/recommend_screen.dart';
import 'package:testapp/modules/Take_Image/take_image.dart';


class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentindex = 0;

  List<Widget> screens = [TakeImage(), EmotionsScreen(), RecommenScreen()];

  Database? database;

  @override
  void initState() {
    super.initState();
    createDatabase();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 2, 18, 61),
        title: Center(child: Text("Emotion Recognition")),
      ),
      body: TakeImage(),
      

        /*
          getName().then((name) {
            print(name);
            print("Fady");
            throw ("iam error");
          }).catchError((error) {
            print("Error: ${error.toString()}");
          });
        */
        /* async //async because it's a future method
            {
          try {
            var name =
                await getName(); //await result to get back from background
            print(name);
            
            throw('iam error !!');     // create error manualy
          } catch (error) {
            print('error: ${error.toString()}');
          }
        },*/

        //child: Icon(Icons.add),),

      /*bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 2, 18, 61),
        selectedItemColor: Color.fromARGB(255, 1, 6, 255),
        unselectedItemColor: Color.fromARGB(255, 158, 183, 253),
        //showUnselectedLabels: false,
        currentIndex: currentindex, // 0 , 1
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Face'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: 'Emotions'),
          BottomNavigationBarItem(icon: Icon(Icons.recommend), label: 'Recommendations'),
        ],
      ),*/
    );
  }

  Future<String>
      getName() async //future method ot goes to background and open thread to do function and get result
  {
    return 'Fady Shehata';
  }

  void createDatabase() async {
   await openDatabase('emotion_recognition.db', version: 1,
        onCreate: (database, version) async {
      print("created");
      await database
          .execute(
              'CREATE TABLE Emotions (id INTEGER PRIMARY KEY, emotion TEXT, value INTEGER)')
          .then((value) {
        print("Table Created");
      }).catchError((error) {
        print("Error catched: ${error.toString()}");
      });
    }, onOpen: (database) {
      print("opened");
    }).then((value){
      database= value;
    });
  }

  insertToDatabase() async {
     await database?.transaction((txn) {
      txn.rawInsert('INSERT INTO Emotions(emotion,value) VALUES("Happy","0")')
          .then((value) {
        print("$value Inserted");
      }).catchError((error) {
        print("error catched: ${error.toString()}");
      });
      return Future.value(null);
    });
  }
}
