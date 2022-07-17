import 'package:flutter/material.dart';
import 'package:testapp/modules/Recommendations/emotionSelection.dart';
import 'package:testapp/modules/Take_Image/AddImage.dart';
import 'package:testapp/modules/Take_Image/take_image.dart';

import '../Recommendations/SelectionScreen.dart';
import '../Recommendations/main_Recommendation.dart';
import '../Recommendations/recommend_screen.dart';

showAlert({BuildContext? bContext, String? title, String? content}) {
  return showDialog(
      context: bContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 2, 25, 78),
          title: Text(
            title ?? "",
            style:
                TextStyle(color: Colors.cyan[100], fontWeight: FontWeight.w500),
          ),
          content: Text(
            content ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.cyan,
            ),
          ),
          actions: [
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () => {Navigator.pop(context)},
                child: Text("Okay"))
          ],
        );
      });
}

showEmotionAlert({BuildContext? bContext, String? title, String? content}) {
  return showDialog(
      barrierDismissible: false,
      context: bContext!,
      builder: (BuildContext context) {
        return WillPopScope(
            child: AlertDialog(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              backgroundColor: Color.fromARGB(255, 2, 25, 78),
              title: Text(
                title ?? "",
                style: TextStyle(
                    color: Colors.cyan[100], fontWeight: FontWeight.w500),
              ),
              content: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  content ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.cyan,
                  ),
                ),
              ),
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () => {
                          // print("content ${content}"),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => emotionSelection(content)))
                        },
                    child: Text(
                      "Get Recommendation",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )),
                SizedBox(width: 20),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddImage()))
                        },
                    child: Text("Cancel"))
              ],
            ),
            onWillPop: () async => false);
      });
}
