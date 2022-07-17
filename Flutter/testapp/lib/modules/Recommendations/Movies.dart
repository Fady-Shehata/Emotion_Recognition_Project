import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/modules/Take_Image/shared.dart';

class Movies extends StatefulWidget {
  
  //Movies({Key? key, required String Emotion  }) : super(key: key); //, required String recommendationType
  
  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies>
{
  //String Emotion = "" ;
  String recommendationType = "" ;
  List<String>  n = [] ;//"Mrs. Doubtfire" , "The Pursuit of Happyness"
  List<String>  sl = [] ;//"A struggling salesman takes custody of his son as he's poised to begin a life-changing professional career." , "After a bitter divorce, an actor disguises himself as a female housekeeper to spend time with his children held in custody by his former wife."
  List<double>  r = [] ;
  List<String>  y = [] ;//"1993","2006"
  List<String>  c = [] ;//"Action_Crime_Comedy","Drama_Biography"
  int i = 0 ;
  String name = ""; 
  String storyLine = "";
  double rate = 0 ;
  String  year = "" ;
 List<String> ca = [];
  String image = "";
  final _firestore = FirebaseFirestore.instance;

  _MoviesState( )
  {
    //this.recommendationType;
    getData(chosenEmotion); 
  }

void getData (String emotion) async   
{
      var data = await _firestore.collection(emotion).doc("Movies").collection("Information").get();
      
      //final data = await _firestore.collection ('quotes').get();
      for (var temp in data.docs) 
      {
        print(data.docs.length);
        print(temp["Name"]);
        n.add(temp["Name"]);
         print(n);
        sl.add(temp["Storyline"]);
        print(sl);
        // r.add(temp["Rate"]);
        y.add(temp["Year"]);
        print(y);
        c.add(temp["Categories"]);
        print(c);
        
        //ca = c.split("_");
        

      }
      next();
      next();
}

void next()
  {
       setState(()
                {
                  //A();
                  //print(author);
                  //getData();
                  ca.clear();
                  
                  name  = n[i];  
                  //print(name);
                  storyLine = sl[i];
                  //print(storyLine);
                  year = y[i];
                  //print(year);
                  ca = c[i].split("_");
                  //print(c);
                  //print(ca);
                  //rate  = r[i];
                  //year  = y[i];

                  if( i == (n.length - 1 ) )
                        i = 0 ; 
                  else
                        i++;

                }
               );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      
     body :
     Stack(
          children: 
          [
            
            Container
            (
              width: double.infinity ,
                height: double.infinity,
                decoration:
                 BoxDecoration(
                  image: DecorationImage( image: AssetImage("assets/images/${name}.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Color.fromARGB(255, 2, 25, 78).withOpacity(0.5), BlendMode.darken)
                  ) ),
            ),
            Container(
              width: double.infinity,
              height:double.infinity,
              //color: Colors.red,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column 
              (
                /*padding: EdgeInsets.only(top: 40),
                scrollDirection: Axis.vertical, 
                shrinkWrap: true,*/
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(   "$name"  , textAlign: TextAlign.start, style: TextStyle(color: Colors.white , /*fontFamily:"Pacifico",*/ 
                         fontSize:20 , 
                         fontWeight:FontWeight.bold,
                         ),),
                         SizedBox(width: 10,),
                        Text(   "($year)"  , textAlign: TextAlign.start, style: TextStyle(color: Colors.white ,  /*fontFamily:"Pacifico",*/ 
                         fontSize:15 , 
                         fontWeight:FontWeight.w200 ,
                         ),),
                      ],
                    ),
                  ),
                  SizedBox( height: 10 ,),
                  Text(   "$storyLine"  , textAlign: TextAlign.start, style: TextStyle(color: Colors.white , /*fontFamily:"Pacifico" ,*/
                     fontSize:15 , 
                     fontWeight:FontWeight.w100 ,
                     ),),
                  SizedBox( height: 10 ,),
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      for (int i = 0; i < ca.length; i++)
                      
                      Container
                      (
                         
                        child:Center(child: Text("${ca[i]}" , style: TextStyle(color: Colors.white),),), 
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                  
                        height: 40,
                        decoration: BoxDecoration
                        (
                            color: Color.fromARGB(255, 2, 25, 78),
                            borderRadius: BorderRadius.all(  Radius.circular(20) ),
                        ),
                      )
                    ],),
                  ),
                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom( shape: CircleBorder() , primary:Color.fromARGB(255, 2, 25, 78)),
                  onPressed: next,
                  child: Icon( Icons.arrow_circle_right_rounded ,/*color: Colors.amber,*/ ),
                  
                  ),
                ],
               
              ),
            ),

          ],
        
        ),

       );
  }
}


/*class Movies extends StatefulWidget {
  
  //Movies({Key? key,   }) : super(key: key);  required String recommendationType
  final String? Emotions;
  const Movies(this.Emotions);
  @override
  State<Movies> createState() => _MoviesState();
}


class _MoviesState extends State<Movies>
{
  String recommendationType = "" ;
  List<String>  n = [] ;//"Mrs. Doubtfire" , "The Pursuit of Happyness"
  List<String>  sl = [] ;//"A struggling salesman takes custody of his son as he's poised to begin a life-changing professional career." , "After a bitter divorce, an actor disguises himself as a female housekeeper to spend time with his children held in custody by his former wife."
  List<double>  r = [] ;
  List<String>  y = [] ;//"1993","2006"
  List<String>  c = [] ;//"Action_Crime_Comedy","Drama_Biography"
  int i = 0 ;
  String name = ""; 
  String storyLine = "";
  double rate = 0 ;
  String  year = "" ;
 List<String> ca = [];
  String image = "";
  final _firestore = FirebaseFirestore.instance;

  _MoviesState( )
  {
    //this.recommendationType;
    getData(); 
  }

void getData () async   
{
      var data = await _firestore.collection("Happy").doc("Movies").collection("Information").get();
      
      //final data = await _firestore.collection ('quotes').get();
      for (var temp in data.docs) 
      {
        print(data.docs.length);
        print(temp["Name"]);
        n.add(temp["Name"]);
         print(n);
        sl.add(temp["Storyline"]);
        print(sl);
        // r.add(temp["Rate"]);
        y.add(temp["Year"]);
        print(y);
        c.add(temp["Categories"]);
        print(c);
        
        //ca = c.split("_");
        

      }
      next();
      next();
}

void next()
  {
       setState(()
                {
                  //A();
                  //print(author);
                  //getData();
                  ca.clear();
                  
                  name  = n[i];  
                  //print(name);
                  storyLine = sl[i];
                  //print(storyLine);
                  year = y[i];
                  //print(year);
                  ca = c[i].split("_");
                  //print(c);
                  //print(ca);
                  //rate  = r[i];
                  //year  = y[i];

                  if( i == (n.length - 1 ) )
                        i = 0 ; 
                  else
                        i++;

                }
               );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      
     body :
     Stack(
          children: 
          [
            
            Container
            (
              width: double.infinity ,
                height: double.infinity,
                decoration:
                 BoxDecoration(
                  image: DecorationImage( image: AssetImage("assets/images/${name}.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Color.fromARGB(255, 2, 25, 78).withOpacity(0.5), BlendMode.darken)
                  ) ),
            ),
            Container(
              width: double.infinity,
              height:double.infinity,
              //color: Colors.red,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column 
              (
                /*padding: EdgeInsets.only(top: 40),
                scrollDirection: Axis.vertical, 
                shrinkWrap: true,*/
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(   "$name"  , textAlign: TextAlign.start, style: TextStyle(color: Colors.white , /*fontFamily:"Pacifico",*/ 
                         fontSize:20 , 
                         fontWeight:FontWeight.bold,
                         ),),
                         SizedBox(width: 10,),
                        Text(   "($year)"  , textAlign: TextAlign.start, style: TextStyle(color: Colors.white ,  /*fontFamily:"Pacifico",*/ 
                         fontSize:15 , 
                         fontWeight:FontWeight.w200 ,
                         ),),
                      ],
                    ),
                  ),
                  SizedBox( height: 10 ,),
                  Text(   "$storyLine"  , textAlign: TextAlign.start, style: TextStyle(color: Colors.white , /*fontFamily:"Pacifico" ,*/
                     fontSize:15 , 
                     fontWeight:FontWeight.w100 ,
                     ),),
                  SizedBox( height: 10 ,),
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      for (int i = 0; i < ca.length; i++)
                      
                      Container
                      (
                         
                        child:Center(child: Text("${ca[i]}" , style: TextStyle(color: Colors.white),),), 
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                  
                        height: 40,
                        decoration: BoxDecoration
                        (
                            color: Color.fromARGB(255, 2, 25, 78),
                            borderRadius: BorderRadius.all(  Radius.circular(20) ),
                        ),
                      )
                    ],),
                  ),
                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom( shape: CircleBorder() , primary:Color.fromARGB(255, 2, 25, 78)),
                  onPressed: next,
                  child: Icon( Icons.arrow_circle_right_rounded ,/*color: Colors.amber,*/ ),
                  
                  ),
                ],
               
              ),
            ),

          ],
        
        ),

       );
  }
}*/