//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  final appTitle = 'Drawer Demo';
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: appTitle,
//      home: MyHomePage(title: appTitle),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  final String title;
//
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text(title)),
//      body: Center(child: Text('My Page!')),
//      drawer: Drawer(
//        // Add a ListView to the drawer. This ensures the user can scroll
//        // through the options in the drawer if there isn't enough vertical
//        // space to fit everything.
//        child: ListView(
//          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            DrawerHeader(
//              child: Text('Drawer Header'),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//            ),
//            ListTile(
//              title: Text('Item 1'),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Item 2'),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
// Flutter code sample for

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:airline/blocs/theme.dart';
import 'package:airline/flightAtendPart/home_page_fa.dart';
import 'package:airline/pages/PageMedicalEdit.dart';
import 'package:airline/pages/pageLogin.dart';
import 'package:airline/pages/pageSplash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';



void main ()=>runApp(MyApp() );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ChangeNotifierProvider(
        builder: (_)=>ThemeChanger(ThemeData(
          primaryColor:new Color(0xff075e54),
          accentColor: new Color(0xff25d366),

        ))
    ,child: new MaterialAppWithTheme(),
    );


  }
}

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme=Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:theme.getTheme(),

      routes: {
        "/":(context)=>new SplashScreen(),
        "/home":(context)=>new HomePage(),
        "/login_screen":(context)=>new LoginPage(),
        "/Medical_edit":(context)=>new medicalPageEdit(),
        "/home_fa":(context)=>new HomePageFA()
      },
    );
  }
}

