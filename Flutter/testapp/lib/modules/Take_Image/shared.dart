import 'package:flutter/material.dart';

List<String> emotionsList= [];
String chosenEmotion=" ";
bool isShown=false;

showWaitDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
      content: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text('Loading ...'),
      SizedBox(
        height: 5.0,
      ),
      Container(
        child: CircularProgressIndicator(),
      ),
      SizedBox(
        height: 5.0,
      ),
    ],
  ));
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}