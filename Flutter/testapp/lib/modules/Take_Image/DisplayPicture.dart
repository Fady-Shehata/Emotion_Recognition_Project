import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/modules/Take_Image/shared.dart';
import 'alert.dart';
import 'package:http_parser/http_parser.dart';

class DisplayPicture extends StatefulWidget {
  DisplayPicture({Key? key, this.image, this.context}) : super(key: key);
  final File? image;
  final BuildContext? context;

  @override
  State<DisplayPicture> createState() => _DisplayPictureState();
}

class _DisplayPictureState extends State<DisplayPicture> {
  late List<dynamic> labels;

  bool isLoading = true;

  detectEmotion() async {
    //10.0.2.2:8000
    //new0python.azurewebsites.net
    var uri = Uri.http('10.0.2.2:8000', "");
    http.MultipartRequest request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath(
        'images',
        widget.image!.path,
        contentType: MediaType('application', 'jpeg'),
      ),
    );

    http.StreamedResponse r = await request.send();

    if (r.statusCode != 200) {
      showAlert(
          bContext: widget.context,
          title: "Error Detecting!",
          content: "Server Side Error.");
    } else {
      var b = await r.stream.transform(utf8.decoder).join();
      var g = jsonDecode(b);
      if (g['prediction'] == null) {
        showAlert(
            bContext: widget.context, title: "Error", content: g['error']);
      } else {
        labels = g['prediction'];

        var happyCount = 0,
            sadCount = 0,
            fearCount = 0,
            angryCount = 0,
            naturalCount = 0;
        var emotions = ["Happy", "Sad", "Fear", "Angry", "Neutral"];

        labels.forEach((element) {
          if (element == ("Happy")) {
            happyCount += 1;
          } else if (element == ("Fear")) {
            fearCount += 1;
          } else if (element == ("Sad")) {
            sadCount += 1;
          } else if (element == ("Angry")) {
            angryCount += 1;
          } else if (element == ("Neutral")) {
            naturalCount += 1;
          }
        });
        var emotionsCount = [
          happyCount,
          sadCount,
          fearCount,
          angryCount,
          naturalCount
        ];
        // var mostEmotion = emotionsCount.reduce(max);
        var typeMostEmotion = <String>[];
        for (int i = 0; i < emotionsCount.length; i++) {
          if (emotionsCount[i] != 0) {
            typeMostEmotion.add(emotions[i]);
            if(isShown==true){
              emotionsList.clear();
              setState(() {
                isShown=false;
              });
            }
            emotionsList.add(emotions[i]);
          
          }
        }
        print("display ${typeMostEmotion}");

        showEmotionAlert(
            bContext: widget.context,
            title: "Emotions Detected",
            content:
                "${typeMostEmotion.toString().replaceAll(',', ', ').replaceAll('[', '').replaceAll(']', '')}");
        setState(() {
          isLoading=true;
        });
        /* if(typeMostEmotion == ("Happy")) {
          
        } else if(typeMostEmotion ==("Fear")) {
          showEmotionAlert(bContext: context, title: "Done", content: 'You Are Fear!');
        } else if(typeMostEmotion ==("Sad")) {
          showEmotionAlert(bContext: context, title: "Done", content: 'You Are Sad!');
        } else if(typeMostEmotion ==("Angry")) {
          showEmotionAlert(bContext: context, title: "Done", content: 'You Are Angry!');
        }else if(typeMostEmotion ==("Neutral")) {
          showEmotionAlert(bContext: context, title: "Done", content: 'You Are Natural!');
        }*/

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 2, 25, 78),
              Color.fromARGB(255, 0, 0, 0)
            ])),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 2.25,
                  backgroundImage: FileImage(widget.image!),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 65, 93, 131),
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      "Detect Emotion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onPressed: () async {
                      if (isLoading == true)
                        showWaitDialog(context);
                        //Navigator.of(context, rootNavigator: true).pop();
                      await detectEmotion().then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                      );
                      
                    },
                  ),
                ),
              ],
            ))));
  }
}
