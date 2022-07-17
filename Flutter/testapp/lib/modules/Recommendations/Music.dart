import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/modules/Recommendations/emotionSelection.dart';
import 'package:testapp/modules/Take_Image/shared.dart';

class Music extends StatefulWidget {
  //Music({Key? key , required String Emotion  }) : super(key: key);
//  final String Emotion;
  //const Music(this.Emotion);
  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> 
{
  
  //String recommendationType = "" ;
  List<String>  sn = [] ;//"youssef fawzy" , "fawzy youssef"
  List<String>  n = [] ;
  List<String>  d = [] ;
  int i = 0 ;
  String duration = ""; 
  String name ="";
  String sname ="";
  String image = "";
  final _firestore = FirebaseFirestore.instance;

  _MusicState()
  {
  /*  var index;
    for(var i=0;i<emotionsList.length;i++){
      if(widget.Emotion != null){
        if(widget.Emotion==emotionsList[i]){
          index=i;
        }
      }
    }*/
    //this.recommendationType;
    getData(chosenEmotion); 
  }

void getData (String emotion) async   
{
      var data = await _firestore.collection(emotion).doc("Music").collection("Information").get();
      
      //final data = await _firestore.collection ('quotes').get();
      for (var temp in data.docs) 
      {
        print(temp["Singername"]);
        print(temp["Name"]);
        print(temp["Duration"]);
        sn.add(temp["Singername"]);
        n.add(temp["Name"]);
        d.add(temp["Duration"]);
        //a.add(temp["Author"]);
      }
      next();
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
                  sname = sn[i];
                  name = n[i];
                  duration = d[i];
                  //author = n[i];
                  if( i == (sn.length - 1 ) )
                        i = 0 ; 
                  else
                        i++;

                }
               );
  }



  @override
  Widget build(BuildContext context) 
  {
  /*  if (widget.Emotion != null) {
      if(widget.Emotion!.length>7){
     // print("select2 ${widget.labels!.length}");
       Emotions= widget.labels!.split(', ');
      }
      else{
        Emotions!.add(widget.labels!);
        
      }*/
    return Scaffold
    
    ( 
      backgroundColor: Color.fromARGB(255, 2, 25, 78),
      
     body : 
     SingleChildScrollView(
      scrollDirection: Axis.vertical,
       child: Column(
            children: 
            [
              for (int i = 0; i < n.length; i++)
               Container
               (
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                padding:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                height: 50,
                decoration: BoxDecoration
                (
                    color:  Color.fromARGB(255, 7, 7, 90),
                    borderRadius: BorderRadius.all(  Radius.circular(10) ),
                ),
                child: Row(children: 
                [
                  
                  Container
                  (
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration
                    (
                        image: DecorationImage
                        ( 
                        image: AssetImage("assets/images/${n[i]}.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
                        ) ,
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(  Radius.circular(10) ),
                    ),
                    
                    
                
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text("${n[i]}" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ), ),
                    Text("${sn[i]}" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w100),)
                
                
                    ],
                    
                    
                  ),
                  //SizedBox(width: 20,),
                  //Text("${d[i]}" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w100), textAlign: TextAlign.end ,),
                
                ],)
                
                //padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                
                ),
       
       
             /* Container
              (
                width: double.infinity ,
                  height: double.infinity,
                  decoration:
                   BoxDecoration(
                    image: DecorationImage( image: AssetImage("lib/images/${author}.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
                    ) ),
              ),*/
             /* Container(
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
                      child: Icon( Icons.arrow_circle_right_rounded ,/color: Colors.amber,/ ),
                      
                      )
                    ],
                   
                  ),
                ),
              ),*/
       
            ],
          
          ),
     ),

       );
    
  }
}
/*
class Music extends StatefulWidget {
  //Music({Key? key , required   }) : super(key: key);
  final String? Emotions;
  const Music(this.Emotions);
  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> 
{
  //String recommendationType = "" ;
  List<String>  sn = [] ;//"youssef fawzy" , "fawzy youssef"
  List<String>  n = [] ;
  List<String>  d = [] ;
  int i = 0 ;
  String duration = ""; 
  String name ="";
  String sname ="";
  String image = "";
  final _firestore = FirebaseFirestore.instance;
  _MusicState()
  {
    //this.recommendationType;
    print("constructor ${widget.Emotions!}");
    getData(widget.Emotions!); 
  }

void getData (String? Emotions) async   
{   
    print(Emotions);
      var data = await _firestore.collection(Emotions!).doc("Music").collection("Information").get();
      
      //final data = await _firestore.collection ('quotes').get();
      for (var temp in data.docs) 
      {
        print(temp["Singername"]);
        print(temp["Name"]);
        print(temp["Duration"]);
        sn.add(temp["Singername"]);
        n.add(temp["Name"]);
        d.add(temp["Duration"]);
        //a.add(temp["Author"]);
      }
      next();
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
                  sname = sn[i];
                  name = n[i];
                  duration = d[i];
                  //author = n[i];
                  if( i == (sn.length - 1 ) )
                        i = 0 ; 
                  else
                        i++;

                }
               );
  }



  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    
    ( 
      backgroundColor: Color.fromARGB(255, 2, 25, 78),
      
     body : 
     SingleChildScrollView(
      scrollDirection: Axis.vertical,
       child: Column(
            children: 
            [
              for (int i = 0; i < n.length; i++)
               Container
               (
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                padding:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                height: 50,
                decoration: BoxDecoration
                (
                    color:  Color.fromARGB(255, 7, 7, 90),
                    borderRadius: BorderRadius.all(  Radius.circular(10) ),
                ),
                child: Row(children: 
                [
                  
                  Container
                  (
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration
                    (
                        image: DecorationImage
                        ( 
                        image: AssetImage("assets/images/${n[i]}.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
                        ) ,
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(  Radius.circular(10) ),
                    ),
                    
                    
                
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text("${n[i]}" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ), ),
                    Text("${sn[i]}" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w100),)
                
                
                    ],
                    
                    
                  ),
                  //SizedBox(width: 20,),
                  //Text("${d[i]}" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w100), textAlign: TextAlign.end ,),
                
                ],)
                
                //padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                
                ),
       
       
             /* Container
              (
                width: double.infinity ,
                  height: double.infinity,
                  decoration:
                   BoxDecoration(
                    image: DecorationImage( image: AssetImage("lib/images/${author}.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
                    ) ),
              ),*/
             /* Container(
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
                      child: Icon( Icons.arrow_circle_right_rounded ,/color: Colors.amber,/ ),
                      
                      )
                    ],
                   
                  ),
                ),
              ),*/
       
            ],
          
          ),
     ),

       );
    
  }
}*/