import 'package:flutter/material.dart';


class MedicalAnimation extends StatelessWidget{

  final Animation<double> controller;
  final Animation<EdgeInsets>buttonMarginAnimation;
  final Animation<double>ButtonZoomOut;


  MedicalAnimation({this.controller}):
      buttonMarginAnimation=EdgeInsetsTween(
        begin: const EdgeInsets.only(bottom: 15,left: 290),
        end: const EdgeInsets.only(bottom: 15,left: 0),
      ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.250, 0.550,curve: Curves.ease))),
        ButtonZoomOut=new Tween(
            begin: 55.0,
            end: 1000.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.550, 0.999,curve: Curves.bounceOut)))
  ;


Widget _animationBuilder(BuildContext context,Widget child){

  return  ButtonZoomOut.value<=250
      ? new Container(
        width: ButtonZoomOut.value,
         height: ButtonZoomOut.value,
         margin: buttonMarginAnimation.value,
          decoration: new BoxDecoration(
         borderRadius: BorderRadius.circular(50),
         color: Color(0xFF27D366),
         boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 7
          )]
    ),
        child: new Icon(Icons.edit,color: Colors.white,),
  )
      : new Container(
    width:ButtonZoomOut.value ,
    height: ButtonZoomOut.value,
    decoration: new BoxDecoration(
        shape: ButtonZoomOut.value<400
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