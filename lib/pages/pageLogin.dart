import 'package:airline/animations/signIn_animation.dart';
import 'package:airline/blocs/theme.dart';
import 'package:airline/components/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }

}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _loginButtonController;
 final _formKey=new GlobalKey<FormState>();
 String _idValue;
 String _passwordValue;


 idOnSaved(String value){
   _idValue=value;
 }
  passwordOnSaved(String value){
    _passwordValue=value;
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginButtonController=new AnimationController(vsync: this,duration: new Duration(milliseconds: 3000));
  }
@override
  void dispose() {
    // TODO: implement dispose
  _loginButtonController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    timeDilation= 0.4;

    var page=MediaQuery.of(context).size;

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:<Color>[
                  const Color(0xff075e54),
                  const Color(0xffffffff)
                ] ),
          ),
          child: new Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
             new Opacity(
                 opacity: 0.8,
                child:  new Container(
               width: page.width,
               height: page.height,
               decoration: new BoxDecoration(

                   image: DecorationImage(
                     image:new AssetImage("assets/images/Login2.jpg"),
                     fit: BoxFit.fill,

                   )
               ),
             ),),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FormContainer(
                      formKey : _formKey,
                    idOnSaved: idOnSaved,
                    passwordOnSaved: passwordOnSaved,
                  ),
                  new FlatButton(
                      onPressed: null,
                      child: new Text('Forgot Password?',style: new TextStyle(
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontSize: 14
                      ),))
                ],
              ),
//              new Container(
//                height: 300,
//                decoration: new BoxDecoration(
//                    gradient: new LinearGradient(
//                        begin: Alignment.topCenter,
//                        end: Alignment.bottomCenter,
//                        colors:<Color>[
//                          const Color(0xff075e54),
//                          const Color(0xff07e12)
//                        ] ),
//
//                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight:Radius.circular(40) )
//                ),
//              ),
            new GestureDetector(
              onTap: ()async{
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                  sendDataForLogin();
                   // await _loginButtonController.forward();

                  }
//
//                await _loginButtonController.reverse();
              },
              child: new SignInAnimation(
                controller: _loginButtonController.view,
              ),
            )

            ],
          ),
        )
    );
  }

   sendDataForLogin() async {
   bool a= true;
//     await _loginButtonController.animateTo(0.150);
//     Future.delayed(Duration(seconds: 2));
     if (a==true){
     await  _loginButtonController.forward();
       if(_idValue=='2222'){
         Navigator.pushNamed(context, '/home_fa');
       }
       else{
         Navigator.pushNamed(context, '/home');
       }

     }
     else{
       _loginButtonController.reverse();
     }
   }

}

