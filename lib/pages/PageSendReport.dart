import 'package:airline/components/formReport.dart';
import 'package:airline/models/chatModel.dart';
import 'package:airline/models/reportModel.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class PageSendReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SendReportState ();
  }
}

class SendReportState extends State<PageSendReport> {
 var _sender=new Text('Emad Bahreini Pour',
 style: new TextStyle(
   color: Colors.red[700]
 ),);
 final _subjectController=new TextEditingController();
 final _textController=new TextEditingController();
 final _formKey = GlobalKey<FormState>();
 String _textValue;
 String _subjcetValue;
 @override
  void dispose() {
    // TODO: implement dispose
   _subjectController.dispose();
   _textController.dispose();
    super.dispose();
  }
  textOnSaved(String value){
   this._textValue=value;
  }
  subjectOnSaved(String value){
   this._subjcetValue=value;
 }
 creatReport(){
   ReportModel model = new ReportModel(
     sender: _sender.data,
     serial: '',
     subject: _subjcetValue,
     text: _textValue,
     time: DateTime.now().hour.toString()+':'+DateTime.now().minute.toString(),
     date: DateTime.now().year.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().day.toString()
   );
   ReportData.insert(0,model);
 }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child:  new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Card(
                margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                elevation:5 ,
                child: new Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),


                    child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child: new Icon(Icons.account_box),),
                                new Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child: new Text('Sender : '),),
                                new Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child: _sender,),

                              ],
                            ),
                          ],
                        )
                    )
                )
            ) ,
            new Card(
                margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                elevation:5 ,
                child: new Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: new Column(
                      children: <Widget>[
                       new FormReport(
                         formKey: _formKey,
                         textOnSaved:textOnSaved ,
                         subjectOnSaved: subjectOnSaved,
                        )
                      ],
                    )
                )
            ),
            new SizedBox(
              width: 200,
              child: new RaisedButton(
                onPressed: (){
                  if (_formKey.currentState.validate()) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: new Padding(
                            padding: new EdgeInsets.only(left: 0),
                            child:  new Text('Send Report ?'),),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: (){
                                _formKey.currentState.save();
                                _formKey.currentState.reset();
                                creatReport();
                                Navigator.pop(context);
                                Flushbar(
                                   message: 'Report have been sent',
                                  isDismissible: true,
                                  duration: Duration(seconds: 2),

                                ).show(context);
                              },
                              child: new Text('Yes'),

                            ),
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: new Text('Report have been sent'),
                                    ));
                              },
                              child: new Text('No',style: new TextStyle(
                                  color: Colors.red[700]
                              ),),

                            )
                          ],
                        );

                      },
                    );

                  }
                 return null;
                },
                child: new Text('Send'),
                color:Theme.of(context).accentColor,
              ),
            )

          ],
        ),
      )
    );
  }
}

