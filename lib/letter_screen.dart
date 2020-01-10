import 'dart:io';

import 'package:flutter/material.dart';

class LetterType extends StatefulWidget {
  Socket socket;

  LetterType(Socket s){this.socket=s;}
  @override
  _LetterTypeState createState() => _LetterTypeState();
}

class _LetterTypeState extends State<LetterType> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){

              },
            )
          ],
        ),

      ),
    );
  }
}
