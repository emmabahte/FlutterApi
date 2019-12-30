import 'package:flutter/material.dart';


class SignInAnimation extends StatelessWidget{

  final Animation<double> controller;
  final Animation<double>ButtonSqueezeAnimation;
  final Animation<double>ButtonZoomOut;

  SignInAnimation({this.controller}):
      ButtonSqueezeAnimation=new Tween(
        begin: 230.0,
        end: 60.0
      ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.150))),
        ButtonZoomOut=new Tween(
            begin: 70.0,
            end: 1000.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.550, 0.999,curve: Curves.bounceOut)))
  ;


Widget _animationBuilder(BuildContext context,Widget child){

  return  ButtonZoomOut.value <= 300.0
      ? new Container(
        margin:const EdgeInsets.only(bottom: 40),
         width: ButtonZoomOut.value==70
                ?ButtonSqueezeAnimation.value
                 : ButtonZoomOut.value,
          height: ButtonZoomOut.value==70
              ?60
              : ButtonZoomOut.value,
          alignment: Alignment.center,
           child: ButtonSqueezeAnimation.value>75
              ? new Text('Login',
             style: new TextStyle(
                 color: Color(0xff075e54),fontSize: 20,
                 fontWeight: FontWeight.bold,
                 letterSpacing: 0.3
             ),)
               : ButtonZoomOut.value <300.0
                ?new CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff075e54)),
                  )
               :null
    ,
       decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: ButtonZoomOut.value< 400
        ? BorderRadius.circular(30)
            :BorderRadius.circular(0)
    ),
  )
      : new Container(
    width:ButtonZoomOut.value ,
    height: ButtonZoomOut.value,
    decoration: new BoxDecoration(
      shape: ButtonZoomOut.value<500
          ?BoxShape.circle
          :BoxShape.rectangle,
      color: Colors.white
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AnimatedBuilder(
        animation: controller,
        builder: _animationBuilder);
  }

}