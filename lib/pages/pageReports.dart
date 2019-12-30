import 'package:airline/models/chatModel.dart';
import 'package:airline/models/reportModel.dart';
import 'package:flutter/material.dart';

class PageReports extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReportState();
  }
}

class ReportState extends State<PageReports> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView.builder(
          itemCount: ReportData.length,
          itemBuilder:(context,index){
            return  new Column(
              children: <Widget>[
                new Divider(height: 10,),//Khate zire chat ha
                new GestureDetector(
                  onTap:() {
                    return showDialog(
                        context:context,
                      builder: (context){
                          return AlertDialog(
                            title: new Text(ReportData[index].subject),
                            content: new SingleChildScrollView(
                              child: new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding:EdgeInsets.only(top: 5,bottom: 3),
                                    child: new Container(

                                      height: 25,
                                      decoration: new BoxDecoration(
                                          border: Border.all(color: Colors.teal),
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.teal
                                      ),
                                      child: new Padding(
                                        padding: EdgeInsets.only(top: 2,bottom: 2),
                                        child:new Row(
                                          children: <Widget>[
                                            new Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: new Text('Sent By : '),),
                                            new Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: new Text(ReportData[index].sender,
                                              style: new TextStyle(fontSize: 12),),)
                                          ],
                                        ),),
                                    ),
                                  ),
                                  new Padding(
                                    padding:EdgeInsets.only(top: 5,bottom: 3),
                                    child: new Container(

                                      height: 25,
                                      decoration: new BoxDecoration(
                                          border: Border.all(color: Colors.teal),
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.teal
                                      ),
                                      child: new Padding(
                                        padding: EdgeInsets.only(top: 2,bottom: 2),
                                        child:new Row(
                                          children: <Widget>[
                                            new Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: new Text('Type : '),),
                                            new Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: new Text(ReportData[index].type,
                                                style: new TextStyle(fontSize: 12),),)
                                          ],
                                        ),),
                                    ),
                                  ),
                                  new Padding(
                                    padding:EdgeInsets.only(top: 5,bottom: 3),
                                    child: new Container(

                                      height: 25,
                                      decoration: new BoxDecoration(
                                          border: Border.all(color: Colors.teal),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      child: new Padding(
                                        padding: EdgeInsets.only(top: 2,bottom: 2),
                                        child:new Row(
                                          children: <Widget>[
                                            new Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: new Text(ReportData[index].time),),
                                            new Padding(
                                              padding: EdgeInsets.only(left: 85),
                                              child: new Text(ReportData[index].date),)
                                          ],
                                        ),),
                                    ),
                                  ),
                                  new Padding(
                                    padding:EdgeInsets.only(top: 5,bottom: 3),
                                    child: new Container(

                                      height: 25,
                                      decoration: new BoxDecoration(
                                          border: Border.all(color: Colors.teal),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      child: new Padding(
                                        padding: EdgeInsets.only(top: 2,bottom: 2),
                                        child:new Row(
                                          children: <Widget>[
                                            new Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: new Text('Serial : '),
                                            ),
                                             new Padding(
                                              padding: EdgeInsets.only(left: 85),
                                              child: new Text(ReportData[index].serial,
                                              style: new TextStyle(fontSize: 12),),)
                                          ],
                                        ),),
                                    ),
                                  ),
                                  new Padding(
                                    padding:EdgeInsets.only(top: 5,bottom: 3),
                                    child: new Container(

                                      decoration: new BoxDecoration(
                                          border: Border.all(color: Colors.teal),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      child: new Padding(
                                        padding: EdgeInsets.all(10),
                                        child:Text(
                                          ReportData[index].text,
                                          style: new TextStyle(
                                              fontSize: 14
                                          ),
                                        )),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                      }
                    );
                  },
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundImage: new AssetImage("assets/images/Report.png"),
                      backgroundColor: Theme.of(context).canvasColor,
                      radius: 30,
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(ReportData[index].subject,style: TextStyle(fontWeight: FontWeight.bold),),
                        new Text(chatData[index].time,style: TextStyle(fontSize: 14,color: Colors.grey),)
                      ],
                    ),
                    subtitle: new Container(
                      height: 43,
                      child: new Text(ReportData[index].text,
                        style: TextStyle(color: Colors.grey,fontSize: 15),),
                      padding: EdgeInsets.only(top: 5),
                    ),
                  ),
                )
              ],
            );
          }
      ),
      appBar: new AppBar(),
    );
  }
}

