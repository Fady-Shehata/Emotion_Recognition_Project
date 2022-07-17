import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/modules/Take_Image/shared.dart';

class Quotes extends StatefulWidget {
 // Quotes({Key? key , required String Emotion }) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> 
{
  //String Emotion = "" ;
  List<String>  q = [] ;
  List<String>  a = [] ;
  int i =  0 ;
  int j =  0 ;
  String s = " ${chosenEmotion} Quotes"; 
  String author ="F-F-F";
  String image = "";
  final _firestore = FirebaseFirestore.instance;

  _QuotesState()
  {
    
    getData(chosenEmotion); 
  }

void getData (String emotion) async   
{
      var data = await _firestore.collection(emotion).doc("Quotes").collection("Information").get();
      
      //final data = await _firestore.collection ('quotes').get();
      for (var temp in data.docs) 
      {
        print(temp["Author"]);
        q.add(temp["Quote"]);
        a.add(temp["Author"]);
      }
      //next;
      //next;
      //s = q[i];
      //author = a[i];
}

void next()
  {
       setState(()
                {
                  //A();
                  //print(author);
                  //getData();
                  s = q[i];
                  author = a[i];
                  if( i == (q.length - 1 ) )
                        i = 0 ; 
                  else
                        i++;
                  if( (i== 0) & (j == 0))
                  {
                    next();
                    next();
                    j++;
                  }
                }
               );
  }



  @override 
  Widget build(BuildContext context) 
  {
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
                 BoxDecoration
                 (
                  image: DecorationImage
                  ( 
                  image: AssetImage("assets/images/${author}.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
                  ) 
                ),
            ),
            Container(
              width: double.infinity,
              height:double.infinity,
              //color: Colors.red,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Center(
                child: ListView (
                  scrollDirection: Axis.vertical, 
                  shrinkWrap: true,
                  children: 
                  [
                    Center(
                      child: Text(   "\"$s\""  , textAlign: TextAlign.center, style: TextStyle(color: Colors.amber , fontFamily:"Pacifico" ,
                       fontSize:25 , 
                       fontWeight:FontWeight.w100 ,
                       ),),
                      
                    ),
                    SizedBox( height: 10 ,),
                    Text(   "$author"  , textAlign: TextAlign.end, style: TextStyle(color: Colors.amber , fontFamily:"Pacifico" ,
                       fontSize:10 , 
                       fontWeight:FontWeight.w100 ,
                       ),),
                    SizedBox( height: 10 ,),
                    ElevatedButton(
                      
                      style: ElevatedButton.styleFrom( shape: CircleBorder() , primary: Colors.amber),
                    onPressed: next,
                    child: Icon( Icons.arrow_circle_right_rounded ,/*color: Colors.amber,*/ ),
                    
                    )
                  ],
                 
                ),
              ),
            ),

          ],
        
        ),

       );
    
  }
}
/*

class Quotes extends StatefulWidget {
  //Quotes({Key? key , required  }) : super(key: key);
  final String? Emotions;
  const Quotes(this.Emotions);
  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> 
{
  List<String>  q = [] ;
  List<String>  a = [] ;
  int i =  0 ;
  int j =  0 ;
  String s = ""; 
  String author ="";
  String image = "";
  final _firestore = FirebaseFirestore.instance;

  _QuotesState()
  {

    getData(); 
  }

void getData () async   
{   


      var data = await _firestore.collection('Happy').doc("Quotes").collection("Information").get();
      
      //final data = await _firestore.collection ('quotes').get();
      for (var temp in data.docs) 
      {
        print(temp["Author"]);
        q.add(temp["Quote"]);
        a.add(temp["Author"]);
      }
      //next;
      //next;
      //s = q[i];
      //author = a[i];
}

void next()
  {
       setState(()
                {
                  //A();
                  //print(author);
                  //getData();
                  s = q[i];
                  author = a[i];
                  if( i == (q.length - 1 ) )
                        i = 0 ; 
                  else
                        i++;
                 /* if( (i== 0) & (j == 0))
                  {
                    next();
                    next();
                    j++;
                  }*/
                }
               );
  }



  @override 
  Widget build(BuildContext context) 
  {
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
                 BoxDecoration
                 (
                  image: DecorationImage
                  ( 
                  image: AssetImage("assets/images/${author}.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
                  ) 
                ),
            ),
            Container(
              width: double.infinity,
              height:double.infinity,
              //color: Colors.red,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Center(
                child: ListView (
                  scrollDirection: Axis.vertical, 
                  shrinkWrap: true,
                  children: 
                  [
                    Center(
                      child: Text(   "\"$s\""  , textAlign: TextAlign.center, style: TextStyle(color: Colors.amber , fontFamily:"Pacifico" ,
                       fontSize:25 , 
                       fontWeight:FontWeight.w100 ,
                       ),),
                      
                    ),
                    SizedBox( height: 10 ,),
                    Text(   "$author"  , textAlign: TextAlign.end, style: TextStyle(color: Colors.amber , fontFamily:"Pacifico" ,
                       fontSize:10 , 
                       fontWeight:FontWeight.w100 ,
                       ),),
                    SizedBox( height: 10 ,),
                    ElevatedButton(
                      
                      style: ElevatedButton.styleFrom( shape: CircleBorder() , primary: Colors.amber),
                    onPressed: next,
                    child: Icon( Icons.arrow_circle_right_rounded ,/*color: Colors.amber,*/ ),
                    
                    )
                  ],
                 
                ),
              ),
            ),

          ],
        
        ),

       );
    
  }
}*/