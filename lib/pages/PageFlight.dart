import 'package:airline/models/flightModel.dart';
import 'package:airline/pages/pageFlightShow.dart';
import 'package:flutter/material.dart';

class PageFlight extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageFlightState();
  }


}

class PageFlightState extends State<PageFlight> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new ListView.builder(
        itemCount: dummyData.length,
          itemBuilder:(context,index){
          return new Dismissible(
              key: new Key(dummyData[index].id),
              background: new Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: new Icon(Icons.delete,
                  color:Colors.white,),
              ),
            onDismissed: (direction){
                setState(() {
                  dummyData.removeAt(index);
                });
            },
            direction: DismissDirection.endToStart,
            child: new GestureDetector(
              onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>FlightShow(data: dummyData[index])
                      ));
              },
              child: new Card(
                elevation: 5,
                margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: new Container(
                  height: 100,
                  child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 5)
                        ,child:  new Container(
                        height: 100,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft:Radius.circular(20) ),
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: new AssetImage("assets/images/flight_logo.png")
                            )
                        ),
                      ),

                      ),
                      new Container(
                        height: 100,
                        child: new Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0)
                          ,child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.only(top: 3),
                              child:  new Text(dummyData[index].name,
                                style: new TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,

                                ),),),
                            new Padding(
                              padding:EdgeInsets.only(top: 5,bottom: 3),
                              child: new Container(
                                width:120,
                                height: 20,
                                decoration: new BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: new Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: new Text(dummyData[index].date + " - "+dummyData[index].time,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 12),),),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5,bottom: 2),
                              child:  new Container(
                                width: 250,
                                child: new Text(dummyData[index].desc,
                                  style: new TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),),
                              ),)
                          ],
                        ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),

              ),
            ),
          );

          } ),
    );
  }
}