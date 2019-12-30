import 'dart:io';

import 'package:airline/blocs/theme.dart';
import 'package:airline/pages/PageMedical.dart';
import 'package:airline/pages/pageMessages.dart';
import 'package:airline/pages/PageSendReport.dart';
import 'package:airline/pages/PageFlight.dart';
import 'package:airline/pages/pageReports.dart';
import 'package:airline/pages/pageSettings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageFA extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() =>HomePageFAState();

  }

class HomePageFAState extends State<HomePageFA> {
  int currentPageNameIndex=0;
  String currentPageName='home';


  final List children=[
    new PageFlight(),
    new PageMessages(),
     ];

  changePage(int pageIndex){
    setState(() {
      currentPageNameIndex=pageIndex;
    });
  }
  Future<bool> onWillPop(){
    return showDialog(
        context: context,
    builder: (context){
          return AlertDialog(
            title: new Text('Are you sure want to exit?'),
            content: new Text('Application will close.'),
            actions: <Widget>[
              new FlatButton(onPressed: (){
                exit(0);
              }, child: new Text('Yes',style: new TextStyle(color: Colors.green[700]),)),
              new FlatButton(onPressed: (){
                Navigator.of(context).pop(false);
              }, child: new Text('No',style: new TextStyle(color: Colors.red[700]))),
            ],
          );
    }) ?? false;
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  new WillPopScope(
        child:new Scaffold(
          //resizeToAvoidBottomPadding: false,
          body:children[currentPageNameIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: new Color(0xff075e54)),

            items:<BottomNavigationBarItem>[
              new BottomNavigationBarItem(icon:new Icon(Icons.flight,),title: new Text('Flights',)),
              new BottomNavigationBarItem(icon:new Icon(Icons.message,),title: new Text('Messages')),
            ]
            ,onTap: changePage
            ,currentIndex: currentPageNameIndex,
          ),

          appBar: new AppBar(
            elevation: 2,
            title: new Text('Mahan Air Lines'),
            actions: <Widget>[

              Padding(padding: const EdgeInsets.symmetric(horizontal: 5),),
              new PopupMenuButton(
                itemBuilder: (BuildContext context){
                  return [
                    new PopupMenuItem(
                      child: new Text('Profile')
                      ,value: 'profile',),
                    new PopupMenuItem(
                      child: new Text('Settings')
                      ,value: 'Settings',),
                    new PopupMenuItem(
                      child: new Text('Log Out')
                      ,value: 'Log_Out',),

                  ];

                }
                ,onSelected: (String choice){
                switch(choice){
                  case 'Settings':{Navigator.push
                    (context,
                      new MaterialPageRoute(
                          builder: (context)=>SettingsPage()));
                  break;
                  }

                }
              },
              )
            ],
          ),
          drawer: new Drawer(

            child: new DecoratedBox(
                child:new  ListView(

                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                        accountName: new Padding(
                          padding: EdgeInsets.only(left: 90)
                          ,  child: new Text('Emad Bahreini',
                            style: new TextStyle(
                                color: Colors.black
                                ,fontWeight: FontWeight.bold,
                                fontSize: 16)),),
                        accountEmail: null,
                        currentAccountPicture: new GestureDetector(
                          child: new CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: new NetworkImage("https://scontent-sea1-1.cdninstagram.com/vp/08d225f8677c7f395078195f63a12e9e/5E3E6424/t51.2885-19/s150x150/75516649_414611046107404_7782326851673784320_n.jpg?_nc_ht=scontent-sea1-1.cdninstagram.com"),
                          ),
                        ),
                        otherAccountsPictures: <Widget>[
                          new GestureDetector(
                              onTap: (){
                                print('Profile');
                              },
                              child: new CircleAvatar(
                                child: new Icon(Icons.settings),


                              )
                          )
                        ],
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage("https://cdnb.artstation.com/p/assets/images/images/011/166/437/large/bianca-raus-raus-4b.jpg?1528183600"))
                        )

                    ),
                    new ListTile(
                      title: new Text('Medical',style: new TextStyle(color: Colors.white),),
                      trailing: new Icon(Icons.local_hospital,color: Colors.white,),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>medicalPage()));

                      },
                    ),
                    new ListTile(
                      title: new Text('Log Book',style: new TextStyle(color: Colors.white),),
                      trailing: new Icon(Icons.book,color: Colors.white,),
                      onTap: (){

                      },
                    ),

                  ],

                ),

                decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor)),


          ),
        ),
        onWillPop: onWillPop);
  }
}

