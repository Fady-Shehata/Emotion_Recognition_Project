import 'package:flutter/material.dart';

class FaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: NetworkImage(
                      'https://img.a.transfermarkt.technology/portrait/big/28003-1631171950.jpg?lm=1'),
                  height: 300.00,
                  width: 300.00,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.3),
                  width: double.infinity,
                  padding: EdgeInsetsDirectional.only(bottom: 20, top: 20),
                  child: Text(
                    'Happy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
           /*Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
              
                ),
                child: TextButton(
              onPressed: () {},
              child: Text(
                "Get recommendation",
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ))*/
          ],
        ),
      ),
    );
  }
}
