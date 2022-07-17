import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testapp/modules/home/home_screen.dart';
import 'package:testapp/shared/components/components.dart';

class InfoScreen extends StatefulWidget {

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var ageController = TextEditingController();
  var nationalityController = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  var formkey = GlobalKey<FormState>(); 
  bool showPass=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style:
                        TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  defualtFormField(
                    type: TextInputType.name,
                    controller: nameController,
                    labelText: "Name",
                    onSubmit: (name) {
                      print(name);
                    },
                    /*
                    onChange: (val){
                       print(val);
                    */
                    validate: (name) {
                      if (name.isEmpty) {
                        return 'Name Must not be empty';
                      }
                    },
                    labelStyle: TextStyle(
                        color:
                            myFocusNode.hasFocus ? Colors.grey : Colors.black
                            ),
                    preficon: Icon(
                      Icons.account_box_rounded,
                      color: Colors.black,
                    ),
                    outlineInputBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ), 
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defualtFormField(
                    type: TextInputType.text,
                    controller: genderController,
                    labelText: "Gender",
                    onSubmit: (gender) {
                      print(gender);
                    },
                    /*
                    onChange: (val){
                       print(val);
                    */
                    validate: (gender) {
                      if (gender.isEmpty) {
                        return 'Gender Must not be empty';
                      }
                    },
                    preficon: Icon(
                      Icons.group,
                      color: Colors.black,
                    ),
                    labelStyle:  TextStyle(
                        color:
                            myFocusNode.hasFocus ? Colors.grey : Colors.black),
                  outlineInputBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ), 
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defualtFormField(
                    type: TextInputType.number,
                    controller: ageController,
                    labelText: "Age",
                    onSubmit: (age) {
                      print(age);
                    },
                    /*
                    onChange: (val){
                       print(val);
                    */
                    validate: (age) {
                      if (age.isEmpty) {
                        return 'Age Must not be empty';
                      }
                    },
                    preficon: Icon(
                      Icons.elevator_outlined,
                      color: Colors.black,
                    ),
                    labelStyle:  TextStyle(
                        color:
                            myFocusNode.hasFocus ? Colors.grey : Colors.black),
                  outlineInputBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ), 
                  ),
                  
                  SizedBox(
                    height: 25.0,
                  ),
                  defualtFormField(
                    type: TextInputType.text,
                    controller: nationalityController,
                    labelText: "Nationality",
                    onSubmit: (nationality) {
                      print(nationality);
                    },
                    /*
                    onChange: (val){
                       print(val);
                    */
                    validate: (nationality) {
                      if (nationality.isEmpty) {
                        return 'Nationality Must not be empty';
                      }
                    },
                    preficon: Icon(
                      Icons.flag_outlined,
                      color: Colors.black,
                    ),
                    labelStyle:  TextStyle(
                        color:
                            myFocusNode.hasFocus ? Colors.grey : Colors.black),
                  outlineInputBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ), 
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defualtButton(
                      text: 'Register',
                      function: () {
                        if (formkey.currentState!.validate()) {
                          print(nameController.text);
                          print(genderController.text);
                          print(ageController.text);
                          print(nationalityController.text);
                          goHome(context);
                        }
                        
                      }),
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void goHome(context) =>  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>HomeScreen() ));
