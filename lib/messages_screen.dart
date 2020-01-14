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
  bool _isDisabledCheck =false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.sockOn == true ? AppColors.darkBackground:Colors.white,
      child: Center(
        child: Column( //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  color: Colors.white,//widget.sockOn == true ? Colors.white:AppColors.darkBackground,
                  child:Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: myController,
                      enabled: widget.sockOn == true ? true:false,
                      maxLength: 192,
                      maxLines: 6,
                      decoration: InputDecoration(
                          prefixText: "Mensaje: ",
                          hintText: "Escribir el mensaje aquí",
                          border: OutlineInputBorder(),

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
                          RaisedButton(
                           child: Text("ENVIAR"),
                           onPressed: _isDisabledButtonSend == true ? (){

                             setState(() {
                               mensaje1color = Colors.white70;
                               mensaje2color = Colors.white70;
                               _isDisabledButtonSend=false;
                             });
                             widget.socket.write("GET /"+ myController.text);
                }:null,

              ),
                          Center(
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  child: Text("Mensaje 1"),
                                  onPressed: (){
                                    setState(() {
                                      mensaje1color = AppColors.GreenColor;
                                      mensaje2color = Colors.white70;
                                      _isDisabledButtonSend = true;
                                    });
                                  },
                                  color: mensaje1color,
                                ),
                                RaisedButton(
                                  child: Text("Mensaje 2"),
                                  onPressed: (){
                                    setState(() {
                                      mensaje2color = AppColors.GreenColor;
                                      mensaje1color = Colors.white70;
                                      _isDisabledButtonSend = true;
                                    });
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
                                          _isDisabledCheck=true;
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
                                          _isDisabledCheck=true;
                                        });
                                      }
                                  ),
                                ],
                              ),
                              RaisedButton(
                                child: Text("ACTIVAR"),
                                onPressed: _isDisabledCheck == true ? (){
                                  setState(() {
                                    _isDisabledCheck=false;
                                    check1=false;
                                    check2=false;
                                  });
                                }: null,
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
