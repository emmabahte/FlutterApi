import 'package:airline/models/flightModel.dart';
import 'package:flutter/material.dart';

class FlightShow extends StatelessWidget{
  final FLightModel data;
  FlightShow({@required this.data});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title:new Text(this.data.name) ,
       elevation: 5,
        actions: <Widget>[
          new GestureDetector(
            onTap: (){
              
            },
            child: new Padding(
                padding: EdgeInsets.only(right: 10),
                child: new Icon(Icons.add_circle),
            ),
          )
        ],
      ),
      body:instaPost
    );
  }
  final instaPost = new Column(
    crossAxisAlignment : CrossAxisAlignment.stretch,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.fromLTRB(16.0 , 16.0, 8.0, 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text(
                  "Chart",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: Image.network(
                "https://roocket.ir/public/image/2018/9/23/flutter-1.png",
                fit: BoxFit.cover,
              )
          )
        ],
      ),
      new Padding(
        padding: const EdgeInsets.fromLTRB(16.0 , 16.0, 8.0, 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text(
                  "Weather",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: Image.network(
                "https://roocket.ir/public/image/2018/9/23/flutter-1.png",
                fit: BoxFit.cover,
              )
          )
        ],
      ),
    ],
  );

}