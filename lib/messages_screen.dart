import 'dart:io';

import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'Colors/AppColors.dart';

class Messages extends StatefulWidget {

  Socket socket;
  bool sockOn;
  Messages({this.socket, this.sockOn});
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final myController = TextEditingController();
  bool check1 = false;
  bool check2 = false;
  Color mensaje1color = Colors.white70;
  Color mensaje2color = Colors.white70;
  bool _isDisabledButtonSend = false;
  bool _isReadyScreen = false;


  @override
  Widget build(BuildContext context) {
    Color colorIconMessage = widget.sockOn == false ? AppColors.darkBackground:AppColors.lightBackground;
    return Container(
      color: widget.sockOn == true ? AppColors.darkBackground:Colors.white,
      child: Center(
        child: Column( //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  color: Colors.transparent,//widget.sockOn == true ? Colors.white:AppColors.darkBackground,
                  child:Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: myController,
                      enabled: widget.sockOn == true ? true:false,
                      maxLength: 192,
                      maxLines: 6,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize:18,color: Colors.white,letterSpacing: 2),
                      onTap: (){
                        setState(() {
                          colorIconMessage= Colors.blue;
                        });
                       },
                      decoration: InputDecoration(
                          prefixText: "Mensaje: ",
                          hintText: "Escribir el mensaje aquí",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 2,
                              color: widget.sockOn == false ? AppColors.darkBackground:AppColors.lightBackground),
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.mail,color:colorIconMessage ),
                          counterStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),

                      ),
                    ),
                  ),
                ),
                Flexible(
                 child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/3,
                      child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RaisedButton(
                               child: Text("ENVIAR"),
                               onPressed: _isDisabledButtonSend == true ? (){

                                 setState(() {
                                   mensaje1color = Colors.white70;
                                   mensaje2color = Colors.white70;
                                   _isDisabledButtonSend=false;
                                   _isReadyScreen=false;
                                 });
                                 if(myController.text.length==0) debugPrint("El mensaje esta vacio");
                                   else widget.socket.write("GET /"+ myController.text);
                              }:null),
                              RaisedButton(
                                child: Text("CANCELAR"),
                                onPressed: _isDisabledButtonSend == true ? (){

                                  setState(() {
                                    mensaje1color = Colors.white70;
                                    mensaje2color = Colors.white70;
                                    _isDisabledButtonSend=false;
                                    _isReadyScreen=false;
                                  });
                                  widget.socket.write("GET /CANCELAR");
                                }:null)
                            ],
                          ),
                          Center(
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  child: Text("Mensaje 1"),
                                  onPressed: _isReadyScreen ? null:(){
                                    setState(() {
                                      mensaje1color = AppColors.GreenColor;
                                      mensaje2color = Colors.white70;
                                      _isDisabledButtonSend = true;
                                      _isReadyScreen = true;

                                    });
                                    widget.socket.write("GET /MSJ1");
                                  },
                                  color: mensaje1color,
                                ),
                                RaisedButton(
                                  child: Text("Mensaje 2"),
                                  onPressed: _isReadyScreen ? null:(){
                                    setState(() {
                                      mensaje2color = AppColors.GreenColor;
                                      mensaje1color = Colors.white70;
                                      _isDisabledButtonSend = true;
                                      _isReadyScreen=true;
                                    });
                                    widget.socket.write("GET /MSJ2");
                                  },
                                  color: mensaje2color,
                                ),
                              ],
                            ),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Mensaje \n1",textAlign: TextAlign.center,style: TextStyle(color: widget.sockOn == true ? Colors.white:Colors.black),),
                                  CircularCheckBox(
                                    inactiveColor: Colors.white,
                                      value: check1,
                                      onChanged: (bool value) {
                                        setState(() {
                                          check1 = value;

                                       //   _isDisabledCheck=true;
                                        });
                                      }
                                  ),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Mensaje \n2",textAlign: TextAlign.center,style: TextStyle(color: widget.sockOn == true ? Colors.white:Colors.black),),
                                  CircularCheckBox(
                                      inactiveColor: Colors.white,
                                      value: check2,
                                      onChanged: (bool value) {
                                        setState(() {
                                          check2 = value;
                                         // _isDisabledCheck=true;
                                        });
                                      }
                                  ),
                                ],
                              ),
                              RaisedButton(
                                child: Text("ACTIVAR"),
                                onPressed: _isDisabledButtonSend==false &&
                                          (check1!=false || check2!=false) ? (){
                                  setState(() {
                                   // _isDisabledCheck=false;
                                    if(check1&&!check2) {
                                      widget.socket.write("GET /MS1");
                                    }
                                    else if(check2&&!check1) {
                                      widget.socket.write("GET /MS2");
                                    }
                                    else if(check1&&check2) {
                                      widget.socket.write("GET /MS3");
                                    }
                                    //check1=false;
                                    //check2=false;

                                  });}: null,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
            ),

          ],
        ),
      ),
    );
  }

@override
  void dispose() {
    // TODO: implement dispose
  myController.dispose();
    super.dispose();
  }
}
