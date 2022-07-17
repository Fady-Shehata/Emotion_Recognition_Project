import 'package:flutter/material.dart';
import 'AddImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

class TakeImage extends StatefulWidget {

  @override
  _TakeImage createState() => _TakeImage();
}

class _TakeImage extends State<TakeImage> {
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
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Image Capture and Upload",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 30),
                          child: Text(
                            "Add a Picture from gallery or take from camera to express your emotion. Click Below to add Image",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(21, 235, 235, 238),
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: Text(
                            "Add an Image",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddImage()))
                          },
                        ),
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  File? imageFile;
  

  final imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          if(imageFile != Null)
            Container(
              width: 640,
              height: 640,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                image:DecorationImage(image:FileImage(imageFile!),
                ),
                border: Border.all(width: 0,color: Colors.black),
                borderRadius: BorderRadius.circular(12) 
                ),
            )
          else
            Container(
              width: 640,
              height: 640,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 0,color: Colors.black),
                borderRadius: BorderRadius.circular(12) 
                ),
              child: const Text("Image Should Appear Here"),
            ),
          Padding(padding: const EdgeInsets.all(30),
          child: ElevatedButton(
          child: Text('Capture Image with Camera'),
          onPressed: () => getImage(source: ImageSource.camera),
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          padding: MaterialStateProperty.all(EdgeInsets.all(12)),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
          ),
          ), 
          ),
          Padding(padding: const EdgeInsets.all(30),
          child: ElevatedButton(
          child: Text('Capture Image with Gallery'),
          onPressed: () => getImage(source: ImageSource.gallery),
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          padding: MaterialStateProperty.all(EdgeInsets.all(12)),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
          ),
          ), 
          ),
        ],
      ),
    );
  }

void getImage({required ImageSource source}) async{
  final file = await ImagePicker().pickImage(source: source);
  
  if(file?.path != Null){
    setState(() {
      imageFile = File(file!.path);
    });
  }
}
void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }
}
*/