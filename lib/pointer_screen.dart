import 'dart:io';

import 'package:flutter/material.dart';

import 'Colors/AppColors.dart';

class Shift extends StatefulWidget {
  Socket socket;
  bool sockOn;
  Shift({this.socket, this.sockOn});
  @override
  _ShiftState createState() => _ShiftState();
}

class _ShiftState extends State<Shift> {
  bool switch1 = false;
  String shiftMessInit="";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizeIcon = 100;
    return Center(
     child: Container(
      color:widget.sockOn == true ? AppColors.darkBackground:Colors.white,
      child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            //padding: EdgeInsets.only(top: 5),
            child: Text("POSICIONAMIENTO",
              style: TextStyle(
                  color: widget.sockOn == true ? Colors.white:Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("MENSAJE 1",textAlign: TextAlign.center,style: TextStyle(
                      color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 18)),
                  Switch(
                      inactiveTrackColor: Colors.blue,
                      value: switch1,
                      onChanged: (bool value) {
                        setState(() {
                          switch1 = value;

                        });
                        if(!switch1)shiftMessInit="A";
                        else shiftMessInit="B";
                      }
                  ),
                  Text("MENSAJE 2",textAlign: TextAlign.center,style: TextStyle(
                      color: widget.sockOn == true ? Colors.white:Colors.black, fontSize: 18)),
                ],
              ),
            ),
          ),
          RaisedButton(
              child: Icon(Icons.keyboard_arrow_up,
                size: sizeIcon,
                color: widget.sockOn == false ? AppColors.darkBackground:Colors.white,
              ),
            onPressed:() {widget.socket.write("GET /"+shiftMessInit+"UP");},
            color: AppColors.transparent,
            elevation: 0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                  child: Icon(Icons.keyboard_arrow_left,
                    size: sizeIcon,
                    color: widget.sockOn == false ? AppColors.darkBackground:Colors.white,
                  ),
                onPressed:() {widget.socket.write("GET /"+shiftMessInit+"LEFT");},
                color: AppColors.transparent,
                elevation: 0,
              ),
              Container(
                padding: EdgeInsets.all(2),
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blue,
                      Colors.pink,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(18),
                  width: size.width * 0.6,
                  height: size.width * 0.6,
                  decoration: new BoxDecoration(
                    color: widget.sockOn == true ? AppColors.darkBackground:Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              RaisedButton(
                  child: Icon(Icons.keyboard_arrow_right,
                    size: sizeIcon,
                    color: widget.sockOn == false ? AppColors.darkBackground:Colors.white,
                  ),
                onPressed:() {widget.socket.write("GET /"+shiftMessInit+"RIGHT");},
                color: AppColors.transparent,
                elevation: 0,
              ),
            ],
          ),
          RaisedButton(
              child: Icon(Icons.keyboard_arrow_down,
                size: sizeIcon,
                color: widget.sockOn == false ? AppColors.darkBackground:Colors.white,
              ),
            onPressed:() {widget.socket.write("GET /"+shiftMessInit+"DOWN");},
            color: AppColors.transparent,
            elevation: 0,
          )
        ],
      ),
        ));
  }
}
