import 'package:airline/blocs/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





//class MyStatelessWidget extends StatelessWidget {
//  MyStatelessWidget({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Card(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            const ListTile(
//              leading: Icon(Icons.album),
//              title: Text('The Enchanted Nightingale'),
//              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//            ),
//            ButtonTheme.bar(
//              // make buttons use the appropriate styles for cards
//              child: ButtonBar(
//                children: <Widget>[
//                  FlatButton(
//                    child: const Text('BUY TICKETS'),
//                    onPressed: () {/* ... */},
//                  ),
//                  FlatButton(
//                    child: const Text('LISTEN'),
//                    onPressed: () {/* ... */},
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
class SettingsPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsPageState();
  }

}

class SettingsPageState extends State<SettingsPage> {
  List<bool> isSelected;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeChanger _themeChanger =Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Settings'),
      ),
      body: new Scaffold(
        body: new Column(
          children: <Widget>[
            new Card(
              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              elevation:5 ,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.palette),
                    title: Text('Theme'),
                    subtitle: Text('Light mode or Dark mode'),

                  ),
                  ButtonTheme.bar(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                              onPressed: (){
                                _themeChanger.setTheme(ThemeData.dark());
                              },
                              child: const Text('Dark')),
                          FlatButton(
                              onPressed: (){
                                _themeChanger.setTheme(ThemeData(
                                  primaryColor:new Color(0xff075e54),
                                  accentColor: new Color(0xff25d366),
                                ));
                              },
                              child: const Text('Light'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ) ,

          ],
        ),
      ),
    );
  }
}