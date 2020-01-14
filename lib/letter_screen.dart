import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

import 'Colors/AppColors.dart';

class LetterType extends StatefulWidget {
  Socket socket;
  bool sockOn;
  LetterType({this.socket, this.sockOn});
  @override
  _LetterTypeState createState() => _LetterTypeState();
}

class _LetterTypeState extends State<LetterType> {

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;
  bool check11 = false;
  bool check21 = false;
  bool check31 = false;
  bool check41 = false;
  bool check51 = false;
  bool check61 = false;
  bool check71 = false;
  bool switch1 = false;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        color: widget.sockOn == true ? AppColors.darkBackground:Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text("TAMAÑO y TIPO de letra",
                      style: TextStyle(
                          color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 24),
              ),
            ),
         Container(
           child: Padding(
             padding: const EdgeInsets.only(top:10.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Text("Una\nLinea",textAlign: TextAlign.center,style: TextStyle(
                     color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 18)),
                 Switch(
                   inactiveTrackColor: Colors.blue,
                     value: switch1,
                     onChanged: (bool value) {
                       setState(() {
                         switch1 = value;
                         if(!switch1){
                           check11 = false;
                           check21 = false;
                           check31 = false;
                           check41 = false;
                           check51 = false;
                           check61 = false;
                           check71 = false;
                         }
                       });
                       if(switch1)widget.socket.write("GET /A");
                       else widget.socket.write("GET /B");
                     }
                 ),
                 Text("Dos\nLineas",textAlign: TextAlign.center,style: TextStyle(
                     color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 18)),
               ],
             ),
           ),
         ),
         Flexible(
          child: SingleChildScrollView(
           child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircularCheckBox(
                          inactiveColor: Colors.white,
                            value: check1,
                            onChanged: (bool value) {
                              setState(() {
                                check1 = value;
                                check2 = false;
                                check3 = false;
                                check4 = false;
                                check5 = false;
                                check6 = false;
                                check7 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check1)widget.socket.write("GET /L1");
                            }
                        ),
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check11,
                            onChanged: switch1 == true ?  (bool value) {

                              setState(() {
                                check11 = value;
                                check21 = false;
                                check31 = false;
                                check41 = false;
                                check51 = false;
                                check61 = false;
                                check71 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check11)widget.socket.write("GET /L11");
                            }:null
                        ),
                        Image.asset("assets/lklogo.png",
                          height: size.height*.15,),

                      ],

                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check2,
                            onChanged: (bool value) {
                              setState(() {
                                check1 = false;
                                check2 = value;
                                check3 = false;
                                check4 = false;
                                check5 = false;
                                check6 = false;
                                check7 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check2)widget.socket.write("GET /L2");
                            }
                        ),
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check21,
                            onChanged: switch1 == true ?  (bool value) {

                              setState(() {
                                check11 = false;
                                check21 = value;
                                check31 = false;
                                check41 = false;
                                check51 = false;
                                check61 = false;
                                check71 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check21)widget.socket.write("GET /L21");
                            }:null
                        ),
                        Image.asset("assets/lklogo.png",
                          height: size.height*.15,),

                      ],

                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check3,
                            onChanged: (bool value) {
                              setState(() {
                                check1 = false;
                                check2 = false;
                                check3 = value;
                                check4 = false;
                                check5 = false;
                                check6 = false;
                                check7 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check3)widget.socket.write("GET /L3");
                            }
                        ),
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check31,
                            onChanged: switch1 == true ?  (bool value) {

                              setState(() {
                                check11 = false;
                                check21 = false;
                                check31 = value;
                                check41 = false;
                                check51 = false;
                                check61 = false;
                                check71 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check31)widget.socket.write("GET /L31");
                            }:null
                        ),
                        Image.asset("assets/lklogo.png",
                          height: size.height*.15,),

                      ],

                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check4,
                            onChanged: (bool value) {
                              setState(() {
                                check1 = false;
                                check2 = false;
                                check3 = false;
                                check4 = value;
                                check5 = false;
                                check6 = false;
                                check7 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check4)widget.socket.write("GET /L4");
                            }
                        ),
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check41,
                            onChanged: switch1 == true ?  (bool value) {

                              setState(() {
                                check11 = false;
                                check21 = false;
                                check31 = false;
                                check41 = value;
                                check51 = false;
                                check61 = false;
                                check71 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check41)widget.socket.write("GET /L41");
                            }:null
                        ),
                        Image.asset("assets/lklogo.png",
                          height: size.height*.15,),

                      ],

                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check5,
                            onChanged: (bool value) {
                              setState(() {
                                check1 = false;
                                check2 = false;
                                check3 = false;
                                check4 = false;
                                check5 = value;
                                check6 = false;
                                check7 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check5)widget.socket.write("GET /L5");
                            }
                        ),
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check51,
                            onChanged: switch1 == true ?  (bool value) {

                              setState(() {
                                check11 = false;
                                check21 = false;
                                check31 = false;
                                check41 = false;
                                check51 = value;
                                check61 = false;
                                check71 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check51)widget.socket.write("GET /L51");
                            }:null
                        ),
                        Image.asset("assets/lklogo.png",
                          height: size.height*.15,),

                      ],

                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check6,
                            onChanged: (bool value) {
                              setState(() {
                                check1 = false;
                                check2 = false;
                                check3 = false;
                                check4 = false;
                                check5 = false;
                                check6 = value;
                                check7 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check6)widget.socket.write("GET /L6");
                            }
                        ),
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check61,
                            onChanged: switch1 == true ?  (bool value) {

                              setState(() {
                                check11 = false;
                                check21 = false;
                                check31 = false;
                                check41 = false;
                                check51 = false;
                                check61 = value;
                                check71 = false;
                                // _isDisabledCheck=true;
                              });
                              if(check61)widget.socket.write("GET /L61");
                            }:null
                        ),
                        Image.asset("assets/lklogo.png",
                          height: size.height*.15,),

                      ],

                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check7,
                            onChanged: (bool value) {
                              setState(() {
                                check1 = false;
                                check2 = false;
                                check3 = false;
                                check4 = false;
                                check5 = false;
                                check6 = false;
                                check7 = value;
                                // _isDisabledCheck=true;
                              });
                              if(check7)widget.socket.write("GET /L7");
                            }
                        ),
                        CircularCheckBox(
                            inactiveColor: Colors.white,
                            value: check71,
                            onChanged: switch1 == true ?  (bool value) {

                              setState(() {
                                check11 = false;
                                check21 = false;
                                check31 = false;
                                check41 = false;
                                check51 = false;
                                check61 = false;
                                check71 = value;
                                // _isDisabledCheck=true;
                              });
                              if(check71)widget.socket.write("GET /L71");
                            }:null
                        ),
                        Image.asset("assets/lklogo.png",
                          height: size.height*.15,),

                      ],

                    ),
                  ],
                ),
              ),
            ),
    )
    )
          ],
        ),

      ),
    );
  }
}
