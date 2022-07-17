import 'package:flutter/material.dart';

class NoEmotionScreen extends StatefulWidget {
  

  @override
  _NoEmotionScreenState createState() => _NoEmotionScreenState();
}

class _NoEmotionScreenState extends State<NoEmotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 100.0),
            child: Text('Take a picture or upload a photo from gallery',
            style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,          
            
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 40.0),
            child: Column(
              children: [
                Text('Express your feeling so we can help you ',
                style: TextStyle(fontSize: 30.0,color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
                ),
              Icon(Icons.sentiment_very_satisfied_sharp,size: 50,color: Theme.of(context).primaryColor,)
              ],
              
            ),
          ),
          
          ],),
    );
  }
}