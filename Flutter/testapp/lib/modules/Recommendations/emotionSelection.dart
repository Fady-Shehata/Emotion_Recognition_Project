import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/modules/Recommendations/Movies.dart';
import 'package:testapp/modules/Recommendations/Music.dart';
import 'package:testapp/modules/Recommendations/Quotes.dart';
import 'package:testapp/modules/Recommendations/SelectionScreen.dart';
import 'package:testapp/modules/Recommendations/Series.dart';
import 'package:testapp/modules/Take_Image/shared.dart';

class emotionSelection extends StatefulWidget {
  //Selection({Key? key}) : super(key: key);
  final String? Emotion;
  const emotionSelection(this.Emotion);
  @override
  State<emotionSelection> createState() => _emotionSelectionState();
}

class _emotionSelectionState extends State<emotionSelection> {
  //String recommendationType = "Movies";

  @override
  Widget build(BuildContext context) {
    print("emotion selection ********** ");
    setState(() {
      isShown=true;
    }); 
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 25, 78),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            
            children: [
                for (int i = 0; i < emotionsList.length; i++)
                 GestureDetector(
                        onTap:() 
                        {
                          setState(() 
                            {
                            
                              chosenEmotion=emotionsList[i];
                              //recommendationType = val as String ;
                             Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) =>  Selection(
                          //recommendationType : "Movies",
                        
                        )
                        )
                      );

                            });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                          height: 100,
                          decoration: BoxDecoration
                          (
                              color: Color.fromARGB(255, 3, 3, 50),

                              borderRadius: BorderRadius.all(  Radius.circular(20) ),
                          ),
                          child: Center
                          (
                          child: 
                          Text(emotionsList[i] , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                          ),
                        ),
                      ),
                 
              /*
              
              Expanded(
                child: Container
                (
                  child: Row(children:
                   [
                    Expanded(
                      child: GestureDetector(
                        onTap:() 
                        {
                          setState(() 
                            {
                              //recommendationType = val as String ;
                             Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) =>  Selection( widget.Emotion!,
                          //recommendationType : "Movies",
                        
                        )
                        )
                      );

                            });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                          
                          decoration: BoxDecoration
                          (
                              color: Color.fromARGB(255, 3, 3, 50),
                              borderRadius: BorderRadius.all(  Radius.circular(10) ),
                          ),
                          child: Center
                          (
                          child: 
                          Text("Happy" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap:() 
                        {
                          setState(() 
                            {
                              //recommendationType = val as String ;
                             Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) =>  Selection(widget.Emotion!,
                          //recommendationType : "Movies",
                        
                        )
                        )
                      );

                            });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                          decoration: BoxDecoration
                          (
                              color: Color.fromARGB(255, 3, 3, 50),
                              borderRadius: BorderRadius.all(  Radius.circular(10) ),
                          ),
                          child: Center
                          (
                          child: 
                          Text("Sad" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                          ),
                        ),
                      ),
                    )
                  ],),
                ),
              ),
              Expanded(
                child: Container
                (
                  child: Row(children:
                   [
                    Expanded(
                      child: GestureDetector(
                        onTap:() 
                        {
                          setState(() 
                            {
                              //recommendationType = val as String ;
                             Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) =>  Selection(widget.Emotion!,
                          //recommendationType : "Movies",
                        
                        )
                        )
                      );

                            });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 30),
                          decoration: BoxDecoration
                          (
                              color: Color.fromARGB(255, 3, 3, 50),
                              borderRadius: BorderRadius.all(  Radius.circular(10) ),
                          ),
                          child: Center
                          (
                          child: 
                          Text("Fear" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap:() 
                        {
                          setState(() 
                            {
                              //recommendationType = val as String ;
                             Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) =>  Selection( widget.Emotion!,
                          //recommendationType : "Movies",
                        
                        )
                        )
                      );

                            });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 30),
                          decoration: BoxDecoration
                          (
                              color: Color.fromARGB(255, 3, 3, 50),
                              borderRadius: BorderRadius.all(  Radius.circular(10) ),
                          ),
                          child: Center
                          (
                          child: 
                          Text("Angry" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                          ),
                        ),
                      ),
                    ),
                    
                  ],),
                ),
              ),
              
Expanded(
                      child: GestureDetector(
                        onTap:() 
                        {
                          setState(() 
                            {
                              //recommendationType = val as String ;
                             Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) =>  Selection( widget.Emotion!,
                          //recommendationType : "Movies",
                        
                        )
                        )
                      );

                            });
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 30),
                          decoration: BoxDecoration
                          (
                              color: Color.fromARGB(255, 3, 3, 50),
                              borderRadius: BorderRadius.all(  Radius.circular(10) ),
                          ),
                          child: Center
                          (
                          child: 
                          Text("Neutral" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                          ),
                        ),
                      ),
                    )
          */
            ],
          ),
        ),
      ),

      /* Center
        (
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton
              (
                items: ["Movies", "Music", "Quotes"].map((e) => DropdownMenuItem(child: Text("$e"),
                 value: e,))
                 .toList(),
                onChanged: ( val)
                {
                  setState(() 
                  {
                    recommendationType = val as String ;
                    Navigator.pushNamed(context , recommendationType);

                  });
                },
                value: recommendationType,
              ),
              SizedBox(height: 20,),
              DropdownButton
              (
                items: ["Happy", "Sad"].map((e) => DropdownMenuItem(child: Text("$e"),
                 value: e,))
                 .toList(),
                onChanged: ( val)
                {
                  setState(() 
                  {
                    Mood = val as String ;
                    //Navigator.pushNamed(context , recommendationType);

                  });
                },
                value: Mood,
              ),
            ],
          ),
        ),
      );*/
    );
  }
}
/*class Selection extends StatefulWidget {
  //Selection({Key? key,required this.labels}) : super(key: key);
  final String? labels;
  const Selection(this.labels);
  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  //String recommendationType = "Movies";
  
  String? Emotions ;

  @override
  Widget build(BuildContext context) {
   /* if (widget.labels != null) {
      if(widget.labels!.length>7){
     // print("select2 ${widget.labels!.length}");
       Emotions= widget.labels!.split(', ');
      }
      else{
        Emotions!.add(widget.labels!);
        
      }
    }*/
  
    return Scaffold
      (
        backgroundColor: Color.fromARGB(255, 2, 25, 78),
        body : Column(children: [
            Expanded(
              child: Container
              (
                child: Row(children:
                 [
                  Expanded(
                    child: GestureDetector(
                      onTap:() 
                      {
                        setState(() 
                          {
                            //recommendationType = val as String ;
                           Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) =>  Movies(Emotions,
                        //recommendationType : "Movies",
                      
                      )
                      )
                    );

                          });
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                        
                        decoration: BoxDecoration
                        (
                            color: Color.fromARGB(255, 3, 3, 50),
                            borderRadius: BorderRadius.all(  Radius.circular(10) ),
                        ),
                        child: Center
                        (
                        child: 
                        Text("Movies" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:() 
                      {
                        setState(() 
                          {
                            //recommendationType = val as String ;
                           Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) =>  Series(Emotions,
                        //recommendationType : "Movies",
                      
                      )
                      )
                    );

                          });
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                        decoration: BoxDecoration
                        (
                            color: Color.fromARGB(255, 3, 3, 50),
                            borderRadius: BorderRadius.all(  Radius.circular(10) ),
                        ),
                        child: Center
                        (
                        child: 
                        Text("Series" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                        ),
                      ),
                    ),
                  )
                ],),
              ),
            ),
            Expanded(
              child: Container
              (
                child: Row(children:
                 [
                  Expanded(
                    child: GestureDetector(
                      onTap:() 
                      {
                        setState(() 
                          {
                            print("select2 ${Emotions}");
                            //recommendationType = val as String ;
                           Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) =>  
                      
                      Music( Emotions,
                        //recommendationType : "Movies",
                      
                      )
                      )
                    );

                          });
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 30),
                        decoration: BoxDecoration
                        (
                            color: Color.fromARGB(255, 3, 3, 50),
                            borderRadius: BorderRadius.all(  Radius.circular(10) ),
                        ),
                        child: Center
                        (
                        child: 
                        Text("Music" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:() 
                      {
                        setState(() 
                          {
                            //recommendationType = val as String ;
                           Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) =>  Quotes(Emotions,
                        //recommendationType : "Movies",
                      
                      )
                      )
                    );

                          });
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 30),
                        decoration: BoxDecoration
                        (
                            color: Color.fromARGB(255, 3, 3, 50),
                            borderRadius: BorderRadius.all(  Radius.circular(10) ),
                        ),
                        child: Center
                        (
                        child: 
                        Text("Quotes" , style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold  , fontSize: 40),)
                        ),
                      ),
                    ),
                  )
                ],),
              ),
            ),
            

        ],)
*/
       /* Center
        (
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton
              (
                items: ["Movies", "Music", "Quotes"].map((e) => DropdownMenuItem(child: Text("$e"),
                 value: e,))
                 .toList(),
                onChanged: ( val)
                {
                  setState(() 
                  {
                    recommendationType = val as String ;
                    Navigator.pushNamed(context , recommendationType);

                  });
                },
                value: recommendationType,
              ),
              SizedBox(height: 20,),
              DropdownButton
              (
                items: ["Happy", "Sad"].map((e) => DropdownMenuItem(child: Text("$e"),
                 value: e,))
                 .toList(),
                onChanged: ( val)
                {
                  setState(() 
                  {
                    Mood = val as String ;
                    //Navigator.pushNamed(context , recommendationType);

                  });
                },
                value: Mood,
              ),
            ],
          ),
        ),
      );*/
      /*);

  }
}*/