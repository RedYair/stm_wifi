import 'dart:io';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

import 'Colors/AppColors.dart';

class Anim extends StatefulWidget {
  Socket socket;
  bool sockOn;
  Anim({this.socket, this.sockOn});

  @override
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;
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
              child: Text("ANIMACIONES",
                style: TextStyle(
                    color: widget.sockOn == true ? Colors.white:Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Texto con\nAnimaciones",textAlign: TextAlign.center,style: TextStyle(
                        color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 18)),
                    Switch(
                        inactiveTrackColor: Colors.blue,
                        value: switch1,
                        onChanged: (bool value) {
                          setState(() {
                            switch1 = value;

                          });
                          if(switch1)widget.socket.write("GET /A");
                          else widget.socket.write("GET /B");
                        }
                    ),
                    Text("Solo\nAnimaciones",textAlign: TextAlign.center,style: TextStyle(
                        color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 18)),
                  ],
                ),
              ),
            ),
            Flexible(
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircularCheckBox(
                                  inactiveColor: widget.sockOn ? AppColors.lightBackground:AppColors.darkBackground,
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
                                    if(check1)widget.socket.write("GET /A1");
                                  }
                              ),
                              Image.asset("assets/lklogo.png",
                                height: size.height*.15,),

                            ],

                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircularCheckBox(
                                  inactiveColor: widget.sockOn ? AppColors.lightBackground:AppColors.darkBackground,
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
                                    if(check2)widget.socket.write("GET /A2");
                                  }
                              ),
                              Image.asset("assets/lklogo.png",
                                height: size.height*.15,),

                            ],

                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircularCheckBox(
                                  inactiveColor: widget.sockOn ? AppColors.lightBackground:AppColors.darkBackground,
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
                                    if(check3)widget.socket.write("GET /A3");
                                  }
                              ),
                              Image.asset("assets/lklogo.png",
                                height: size.height*.15,),

                            ],

                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircularCheckBox(
                                  inactiveColor: widget.sockOn ? AppColors.lightBackground:AppColors.darkBackground,
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
                                    if(check4)widget.socket.write("GET /A4");
                                  }
                              ),
                              Image.asset("assets/lklogo.png",
                                height: size.height*.15,),

                            ],

                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircularCheckBox(
                                  inactiveColor: widget.sockOn ? AppColors.lightBackground:AppColors.darkBackground,
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
                                    if(check1)widget.socket.write("GET /A5");
                                  }
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
