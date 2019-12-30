import 'package:airline/animations/medical_animation.dart';
import 'package:airline/animations/medical_animation_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class medicalPageEdit extends StatefulWidget{
 final DateTime expireDate;
 final String serialNumber;
 final String ame;
 final String limitation;
  medicalPageEdit({@required this.expireDate,@required this.serialNumber,@required this.limitation,@required this.ame});

  @override
    State<StatefulWidget> createState() {
    // TODO: implement createState
    return MedicalPageEditState(
        expireDate: this.expireDate, serialNumber: this.serialNumber, ame: this.ame, limitation: this.limitation,
    );
  }
}

class MedicalPageEditState extends State<medicalPageEdit> with SingleTickerProviderStateMixin {
   DateTime expireDate;
  String serialNumber;
  String ame;
  String limitation;
  MedicalPageEditState({@required this.expireDate,@required this.serialNumber,@required this.limitation,@required this.ame});
AnimationController _editController;

var _expireDate = TextEditingController();
var _serialNumber=TextEditingController();
var _ame=TextEditingController();
var _limitation=TextEditingController();
 List<String> result;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editController = new AnimationController(vsync: this,duration:new Duration(milliseconds: 3000) );

    _expireDate.text=expireDate.toString();
    _serialNumber.text=serialNumber.toString();
    _ame.text=ame.toString();
    _limitation.text=limitation.toString();

  }

  @override
  Widget build(BuildContext context) {


    List data=[serialNumber,ame,limitation,expireDate];




    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Medical Certification'),
        leading: new GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: new Icon(Icons.arrow_back),
        ),

      ),

      body:  new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
         new Column(
           children: <Widget>[
             new Card(

                margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20))
             ),
               elevation:5 ,
               child: new Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),

                 height: 70,
                 child: new TextField(
                    controller: _serialNumber,
                   onChanged: (value){
                             serialNumber=value;
                   },
                   decoration: new InputDecoration(
                       labelText: 'Serial Number',
                     icon: Icon(Icons.clear_all)
                   ),
                 ),
               )
           ) ,
             new GestureDetector(
               onTap: (){

                 showDatePicker(
                     context: context,
                     initialDate: DateTime.now(),
                     firstDate: DateTime(1990),
                     lastDate: DateTime(2033)).then((date){
                   setState(() {
                     this.expireDate=date;
                     _expireDate.text=expireDate.year.toString()+'-'
                     +expireDate.month.toString()+'-'
                     +expireDate.day.toString();
                   });
                 });
               },
               child: new Card(
                 margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(20))
                 ),
                 elevation:5 ,
                 child: new Container(
                   padding: EdgeInsets.symmetric(horizontal: 20),

                   height: 70,
                   child: new TextField(

                     enabled: false,
                     controller: _expireDate,
                     decoration: new InputDecoration(
                         labelText: 'Expire Date',
                         icon:Icon(Icons.date_range)
                     ),
                   ),
                 ),
               ),
             )  ,
             new Card(
               margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               elevation:5 ,
               child: new Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),

                 height: 70,
                 child: new TextField(
                   onChanged: (value){
                     ame=value;
                   },
                     controller: _ame,
                   decoration: new InputDecoration(
                       labelText: 'AME',
                       icon: Icon(Icons.local_hospital)
                   ),
                 ),
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

                 height: 70,
                 child: new TextField(
                   onChanged: (value){
                     limitation=value;
                   },
                   controller: _limitation,
                   decoration: new InputDecoration(
                       labelText: 'Limitation',
                       icon: Icon(Icons.assignment_late)
                   ),
                 ),
               )
             ) ,],
         ),
          new GestureDetector(
            onTap: ()async{
            await  _editController.forward();
              
//             await _editController.reverse();
             Navigator.pop(context,data);

            },
            child: new MedicalAnimationEdit(

                controller: _editController.view,
            ),
          )
        ],
      ),
    );
  }
}