import 'dart:io';

import 'package:flutter/material.dart';

class Messages extends StatefulWidget {

  Socket socket;
  bool sockOn;
  Messages({this.socket, this.sockOn});
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.sockOn == true ? Colors.black:Colors.white,
      child: Center(
        child: Column( //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  child: TextField(
                    controller: myController,
                    maxLength: 192,
                    maxLines: 6,
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
                           onPressed: (){
                             widget.socket.write("GET /"+ myController.text);
                },

              ),
                          Center(
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  child: Text("Mensaje 1"),
                                  onPressed: (){},
                                ),
                                RaisedButton(
                                  child: Text("Mensaje 2"),
                                  onPressed: (){},
                                ),
                              ],
                            ),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                child: Text("Activar \n Mensajes",textAlign: TextAlign.center,),
                                onPressed: (){

                                },
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Mensaje \n1",textAlign: TextAlign.center),
                                  Checkbox(
                                    onChanged: (value){

                                    },
                                    value: false,
                                  ),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Mensaje \n2",textAlign: TextAlign.center),
                                  Checkbox(
                                    onChanged: (value){

                                    },
                                    value: false,
                                  ),
                                ],
                              ),
                              RaisedButton(
                                child: Text("ACTIVAR"),
                                onPressed: (){

                                },
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
