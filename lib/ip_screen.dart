import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stm_wifi/command_screen.dart';
import 'package:get_ip/get_ip.dart';
import 'package:wifi_configuration/wifi_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'Colors/AppColors.dart';

void main() async{
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIOverlays([]);

  return runApp(IPScreen());
}
class IPScreen extends StatefulWidget {
  @override
  _IPScreenState createState() => _IPScreenState();
}
class _IPScreenState extends State<IPScreen> {
  Socket sock;
  String test;
  String ipAddress;
  String ipAddresshost;
  Color colorButton;
  Color background = AppColors.lightBackground;
  Color text = AppColors.lightText;
  Color select = AppColors.lightSelect;
  Color icon = AppColors.lightIcon;
  Color buttonBackground = AppColors.lightButtonBackground;
  Color iconButton = AppColors.lightIconButton;


@override
  void initState() {
    // TODO: implement initState
  ipAddress = "IP ADDRESS";
  colorButton = Colors.red;
  ipAddresshost = "0.0.0.0";

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        color: background,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: size.width,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: 'LEDKOLOR',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: text,
                              fontSize: 20,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Controller',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: text,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        RaisedButton(
                          color: AppColors.transparent,
                          elevation: 0,
                          onPressed: ()async{
                            ipAddress = await GetIp.ipAddress;
                            debugPrint(ipAddress);
                            ipAddresshost=ipAddress.substring(0,ipAddress.length-1)+ "1";
                            debugPrint(ipAddresshost);
                            },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.wifi,
                                color: select,
                                size: 28,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: select,
                                size: 28,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.11,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: size.height * 0.11,
                        height: size.height * 0.08,
                        child: Icon(
                          Icons.signal_cellular_4_bar,
                          color: icon,
                          size: 28,
                        ),
                      ),
                      Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          onTap: () async{
                            if(ipAddresshost.endsWith("1"))
                           {
                             debugPrint(sock.toString());
                             if(sock == null) {connectWifi();debugPrint("sock open");}
                             else{sock.close();sock=null;debugPrint("sock close"+sock.toString());}
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
                                 },
                               );
                          }
                            else{
                              debugPrint("Obtener IP");
                            }
                            print("Power ON");
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            width: size.height * 0.11,
                            height: size.height * 0.11,
                            decoration: new BoxDecoration(
                              color: buttonBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.power_settings_new,
                              color: Color(0xFFEF5252),
                              size: 38,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.height * 0.11,
                        height: size.height * 0.08,
                        child: Icon(
                          Icons.brightness_6,
                          color: icon,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.25,
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
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.25,
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
                ),
                Material(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    void connectWifi() async {
      sock = await Socket.connect(ipAddresshost,80);//(ipAddresshost,80);//("192.168.4.1", 80);
  }

  @override
  void dispose() {
  // TODO: implement dispose
  sock.close();
    super.dispose();
  }
}
