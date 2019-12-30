import 'package:airline/models/chatModel.dart';
import 'package:flutter/material.dart';

class PageMessages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatState ();
  }
}

class ChatState extends State<PageMessages> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: chatData.length,
        itemBuilder:(context,index){
          return new Dismissible(
            key: new Key(chatData[index].id),
            background: new Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: new Icon(Icons.delete,
                color:Colors.white,),
            ),
            onDismissed: (direction){
              setState(() {
                var i=index;
                var selected=chatData[index];
                chatData.removeAt(index);
                final snackBar=SnackBar(
                    content: new Text('1 message deleted'),
                    action: new SnackBarAction(
                        label: 'Undo',
                        onPressed: () => setState(() => chatData.insert(i, selected),))
                );
                Scaffold.of(context).showSnackBar(snackBar);
              });
            },
            direction: DismissDirection.endToStart,
            child:  new Column(
          children: <Widget>[
             new Divider(height: 10,),//Khate zire chat ha
             new GestureDetector(
              onTap:() {
                print('klik');
                return showDialog(
                    context:context,
                    builder: (context){
                      return AlertDialog(
                        title: new Text(chatData[index].subject),
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
                                          child: new Text(chatData[index].sender,
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
                                          child: new Text(chatData[index].time),),
                                        new Padding(
                                          padding: EdgeInsets.only(left: 85),
                                          child: new Text(chatData[index].date),)
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
                                        chatData[index].message,
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
                               backgroundImage: new AssetImage(chatData[index].avatarUrl),
                               backgroundColor: Theme.of(context).canvasColor,
                                 radius: 30,
          ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                        new Text(chatData[index].subject,style: TextStyle(fontWeight: FontWeight.bold),),
                        new Text(chatData[index].time,style: TextStyle(fontSize: 14,color: Colors.grey),)
          ],
          ),
                   subtitle: new Container(
                      child: new Text(chatData[index].message,
                                  style: TextStyle(color: Colors.grey,fontSize: 15),),
                                    padding: EdgeInsets.only(top: 5),
          ),
          ),
          )
          ],
          )
            ,
          );
        }
    );
  }
}

