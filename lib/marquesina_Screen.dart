import 'dart:io';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

import 'Colors/AppColors.dart';

class Marquee extends StatefulWidget {
  Socket socket;
  bool sockOn;
  Marquee({this.socket, this.sockOn});
  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;


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
              child: Text("MARQUESINAS",
                style: TextStyle(
                    color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 24),
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
                                    if(check1)widget.socket.write("GET /M1");
                                  }
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
                                    if(check2)widget.socket.write("GET /M2");
                                  }
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
                                    if(check3)widget.socket.write("GET /M3");
                                  }
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
                                    if(check4)widget.socket.write("GET /M4");
                                  }
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
                                    if(check1)widget.socket.write("GET /M5");
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
