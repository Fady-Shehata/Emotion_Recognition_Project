import 'package:flutter/material.dart';

// اى كومبوننت هنستخدمه كتير فالابلكيشن

Widget defualtButton({
double width = double.infinity,   //common use (double.infinty) (default)
Color background = Colors.black,   //common use (Colors.blue) (default)
bool isUpperCase= false,
double radius =0.0,
required Function function,
required String text,
})  => Container(
                  width: width,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    color: background,
                    ),
                  child: MaterialButton(
                    onPressed: (){function();},
                    child: Text(
                      '${isUpperCase ? text.toUpperCase(): text}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        ),
                      ),
                  ),
                );


Widget defualtFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  required Function validate,
  required String labelText,
  TextStyle? labelStyle,
  OutlineInputBorder? outlineInputBorder,
  required Icon preficon,
  IconButton? sufficon,
  bool isPassword= false,

}) => TextFormField(       // width initial double.infinity so it centers main widget (Coulmn)
                    controller:controller,
                    keyboardType: type,   //بتظهر علامه @ فى كيبورد الموبايل 
                    obscureText: isPassword,
                    onFieldSubmitted: (s){
                      onSubmit!(s);
                    },
                    /* onChanged: onChange,
                     },*/
                     //focusNode: myFocusNode,
                     validator: (v){
                       validate(v);
                       },
                     decoration: InputDecoration(
                       //hintText: labelText,
                       labelText:labelText,
                       labelStyle: labelStyle,
                       border: outlineInputBorder,
                       focusedBorder: outlineInputBorder,
                       prefixIcon: preficon,            // prefix icon, icon at first ,, suffix icon, at last
                       suffixIcon: sufficon,
                     ),
                  );
                           


// 
//
/*

*/