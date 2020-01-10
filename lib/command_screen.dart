import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SocketIP extends StatelessWidget {

 Socket socket;

  SocketIP(Socket s) {
    this.socket = s;
  }

@override
Widget build(BuildContext context) {
  final title = 'TcpSocket Demo';
  return MaterialApp(
    title: title,
    home: MyHomePage(
      title: title,
      channel: socket,

    ),
  );
}
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Socket channel;

  MyHomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Mensaje 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0
                        )
                    ),
                    color: Colors.red,
                    onPressed: _togglePower,
                  ),
                  RaisedButton(
                    child: Text("TUPO",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0
                        )
                    ),
                    color: Colors.red,
                    onPressed: _fan,
                  ),
                  RaisedButton(
                    child: Text("TUPITO",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0
                        )
                    ),
                    color: Colors.red,
                    onPressed: _mode,
                  ),
                  RaisedButton(
                    child: Text("LOL",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0
                        )
                    ),
                    color: Colors.red,
                    onPressed: _tempUp,
                  ),
                  RaisedButton(
                    child: Text("Temp Down",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0
                        )
                    ),
                    color: Colors.red,
                    onPressed: _tempDown,

                  ),
                  RaisedButton(
                    child: Text("TEST",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0
                        )
                    ),
                    color: Colors.red,
                    onPressed: _test,
                  ),
             /*   Container(
                 // child: Text(receiveMessage != null ? receiveMessage:"tupo",style: TextStyle(color: Colors.black, fontSize: 20),),
                    child: StreamBuilder(
                      stream: widget.channel,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(snapshot.hasData
                              ? '${String.fromCharCodes(snapshot.data)}'
                              : ''),
                        );
                      },
                    )
                )*/
                ],
              ),
            )
        )
    );
  }

  void _togglePower() {
    widget.channel.write("GET //p");
    //flutterSocket.send("GET //p");
  }

  void _fan() {
    widget.channel.write("GET /TUPO");
   // await flutterSocket.createSocket(widget.IP, _port, timeout: 20);
  }

  void _mode() {
  //  widget.channel.writeln("GET /TUPITO");
    //flutterSocket.tryConnect();
  }

  void _tempUp() {
   // widget.channel.write("GET /LOL");
   // flutterSocket.tryDisconnect();
  }

  void _tempDown() {
  //  widget.channel.write("GET /q");
  }
  void _test() {
   // widget.channel.write("GET /THIS IS A TEST");
  }
  @override
  void dispose() {
  //  widget.channel.close();

    super.dispose();
  }
}