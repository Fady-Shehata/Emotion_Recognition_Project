import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {    //provide main widget

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {  // provide state from this widget
  int counter=1;

  void initState(){   //first state for the widget
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Counter')),backgroundColor: Colors.grey,),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.grey,
              child: IconButton(onPressed: (){
                setState(() {
                    counter++; print(counter);                  
                                });
                }, icon: Icon(Icons.add),color: Colors.black,)
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Center(
                child: Text(
                  '${counter}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0
                    ),
                  ),
              ),
            ),
            CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.grey,
              child: IconButton(onPressed: (){
                  setState(() {
                    counter--;print(counter);                    
                                    });
                  
                  }, icon: Icon(Icons.remove_rounded),color:Colors.black
                )
              ),
        ],),
      ),
    );
  }
}



//stateless make build function work one time to build all content
//stateful make build function rebuild it self to reconstruct new changes on screen
//in stateful we have 2 classes
// 1- first class provide widget
// 2- second class provide state from this widget