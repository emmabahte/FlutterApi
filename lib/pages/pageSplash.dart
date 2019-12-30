import 'dart:async';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> SplashScreenState();


}
class SplashScreenState extends State <SplashScreen> {

  startTime(){
    var _duration=new Duration(seconds: 2);
    return new Timer(
        _duration,
        navigationPage
    );
  }
  navigationPage(){
    Navigator.of(context).pushReplacementNamed("/login_screen");
  }

  @override void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 125,
                  height: 125,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image:new AssetImage("assets/images/Mahan_icon.png") )
                  ),
                ),
                new Text('Mahan Air Lines',
                  style: new TextStyle(
                      fontSize: 20,color:new Color(0xff075e54),fontWeight: FontWeight.bold
                  ),)
              ],
            ),
            new Padding(padding: const EdgeInsets.only(bottom: 30)
              ,child:  new Align(
                alignment: Alignment.bottomCenter,
                child: new CircularProgressIndicator(),
              ),)
          ],
        )
    )
    ;
  }

}