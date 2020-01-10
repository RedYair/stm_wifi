import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_ip/get_ip.dart';
import 'package:stm_wifi/letter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'Colors/AppColors.dart';
import 'messages_screen.dart';

/*void main(){
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIOverlays([]);

  return runApp(IPScreen(ipAddresshost));
}*/
class IPScreen extends StatefulWidget {


  @override
  _IPScreenState createState() => _IPScreenState();
}
class _IPScreenState extends State<IPScreen> {
  Socket sock;
  String test;
  String addresshost;
  Color colorpower=AppColors.colorPoweroff;
  Color colorButton;
  Color background = AppColors.lightBackground;
  Color text = AppColors.lightText;
  Color select = AppColors.lightSelect;
  Color icon = AppColors.lightIcon;
  Color buttonBackground = AppColors.lightButtonBackground;
  Color iconButton = AppColors.lightIconButton;
  bool sockOn = false;

@override
  void initState() {
    // TODO: implement initState
  getIp();
  sockOn=false;
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.darkBackground,
            centerTitle: true,
            title:Container(
              child: Image.asset(
                "assets/lklogo.png",
                height: size.height*.15,
                //width: size.width,
                // width: double.infinity,
                fit: BoxFit.cover,
              ),
            ), /**/
           bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.format_color_text)),
            Tab(icon: Icon(Icons.format_size))
         //   Tab(icon: Icon(Icons.favorite))
    ]),),
          body: TabBarView(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height,
                color: background,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: size.height*0.1,
                          child: RichText(
                            text: TextSpan(
                              text: 'Wi-Fi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: text,
                                fontSize: 30,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Controller',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: text,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: size.height * 0.1,
                          child: GestureDetector(
                                onTap: () async{
                                  debugPrint(addresshost);
                                  if(addresshost.endsWith("1"))
                                  {
                                    debugPrint(sock.toString());

                                    if(sock == null) {connectWifi();debugPrint("sock open");sockOn=true;}
                                    else{sock.close();sock=null;debugPrint("sock close"+sock.toString());sockOn=false;}
                                    setState(

                                          () {
                                        background =
                                        background == AppColors.darkBackground
                                            ? AppColors.lightBackground
                                            : AppColors.darkBackground;
                                        text = text == AppColors.darkext
                                            ? AppColors.lightText
                                            : AppColors.darkext;
                                        select = select == AppColors.darkSelect
                                            ? AppColors.lightSelect
                                            : AppColors.darkSelect;
                                        icon = icon == AppColors.darkIcon
                                            ? AppColors.lightIcon
                                            : AppColors.darkIcon;
                                        iconButton =
                                        iconButton == AppColors.darkIconButton
                                            ? AppColors.lightIconButton
                                            : AppColors.darkIconButton;
                                        buttonBackground = buttonBackground ==
                                            AppColors.darkButtonBackground
                                            ? AppColors.lightButtonBackground
                                            : AppColors.darkButtonBackground;
                                        colorpower =
                                        colorpower == AppColors.colorPoweroff
                                            ? AppColors.colorPoweron
                                            : AppColors.colorPoweroff;
                                      },
                                    );
                                  }
                                  else{
                                    debugPrint("Obtener IP");
                                  }
                                  print("Power ON");
                                  debugPrint(sockOn.toString());
                                },
                            child: Container(
                                padding: EdgeInsets.all(2),
                                width: size.height * 0.18,
                                height: size.height * 0.18,
                                decoration: new BoxDecoration(
                                  color: buttonBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.power_settings_new,
                                  color: colorpower,
                                  size: 50,

                                ),
                              ),
                          ),
                          ),
                        Container(
                          width: size.width,
                          height: size.height * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: size.width * 0.11,
                                    height: size.height * 0.08,
                                    child: Icon(
                                      Icons.signal_cellular_4_bar,
                                      color: icon,
                                      size: 40,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.20,
                                    height: size.height * 0.3,
                                    decoration: new BoxDecoration(
                                      color: buttonBackground,
                                      borderRadius: new BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[

                                        RaisedButton(
                                          child: Icon(
                                            Icons.add,
                                            color: iconButton,
                                            size: 38,
                                          ),
                                          onPressed: (){
                                            debugPrint("Subir vel");
                                            sock.write("GET /b+");

                                          },
                                          color: AppColors.transparent,
                                          elevation: 0,
                                        ),
                                        Text(
                                          "Vel",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: text,
                                            fontSize: 24,
                                          ),
                                        ),
                                        RaisedButton(
                                          child: Icon(
                                            Icons.remove,
                                            color: iconButton,
                                            size: 38,
                                          ),
                                          onPressed: (){
                                            debugPrint("Bajar vel");
                                            sock.write("GET /b-");
                                          },
                                          color: AppColors.transparent,
                                          elevation: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                width: size.width * 0.1,
                                height: size.width * 0.1,
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
                                  width: size.width * 0.4,
                                  height: size.width * 0.4,
                                  decoration: new BoxDecoration(
                                    color: background,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: size.width * 0.11,
                                    height: size.height * 0.08,
                                    child: Icon(
                                      Icons.brightness_6,
                                      color: icon,
                                      size: 40,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.20,
                                    height: size.height * 0.3,
                                    decoration: new BoxDecoration(
                                      color: buttonBackground,
                                      borderRadius: new BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        RaisedButton(
                                          child: Icon(
                                            Icons.keyboard_arrow_up,
                                            color: iconButton,
                                            size: 38,
                                          ),
                                          onPressed: (){
                                            debugPrint("Subir Brillo");
                                            sock.write("GET /r+");
                                          },
                                          color: AppColors.transparent,
                                          elevation: 0,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: text,
                                            fontSize: 24,
                                          ),
                                        ),
                                        RaisedButton(
                                          child: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: iconButton,
                                            size: 38,
                                          ),
                                          onPressed: (){
                                            debugPrint("Bajar Brillo");
                                            sock.write("GET /r-");
                                          },
                                          color: AppColors.transparent,
                                          elevation: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    /*    Material(
                          color: AppColors.transparent,
                          child: Container(
                            width: size.width,
                            height: size.height * 0.20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(
                                  Icons.adjust,
                                  color: Color(0xFF584BD2),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        print("Start Pressed");
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Icon(
                                        Icons.rss_feed,
                                        color: Color(0xFF584BD2),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print("Settings Pressed");
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Icon(
                                        Icons.settings,
                                        color: icon,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),*/

                      ],
                    ),
                  ),
                ),
              ),
              Messages(socket: sock,sockOn: sockOn),
              LetterType(sock),
            ],
          ),

        ),
      )
    );
  }

    void connectWifi()  {
      Socket.connect(addresshost,80).then((Socket socket)
      {
        sock=socket;
      });//(ipAddresshost,80);//("192.168.4.1", 80);
  }
  void getIp()  async{
   String ipAddress = await GetIp.ipAddress;
    debugPrint(ipAddress);
    addresshost=ipAddress.substring(0,ipAddress.length-1)+ "1";
    debugPrint(addresshost);
  }

  @override
  void dispose() {
  // TODO: implement dispose
  sock.close();
    super.dispose();
  }
}
