import 'package:airline/animations/medical_animation.dart';
import 'package:airline/pages/PageMedicalEdit.dart';
import 'package:flutter/material.dart';

class medicalPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MedicalPageState();
  }
}

class MedicalPageState extends State<medicalPage> with SingleTickerProviderStateMixin {

AnimationController _editController;
var serial= new Text('N2457592',
  style: new TextStyle(
      color: Colors.grey[600]
  ),);
var date= DateTime(2020,12,11);
var ame= new Text('DR.Amini',
  style: new TextStyle(
      color: Colors.grey[600]
  ),);
var limit= new Text('VDL',
  style: new TextStyle(
      color: Colors.grey[600]
  ),);


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editController = new AnimationController(vsync: this,duration:new Duration(milliseconds: 3000) );
  }

  @override
  Widget build(BuildContext context) {

    List data=[serial.data,ame.data,limit.data];






    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Medical Certification'),

      ),

      body:  new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
         new Column(
           children: <Widget>[
              new Card(
               elevation: 5,
               margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: new Container(
                 height: 70,
                 child: new Row(
                   children: <Widget>[
                     new Padding(
                       padding: EdgeInsets.only(left: 15,bottom: 10)
                       ,child:  Icon(Icons.clear_all,color: Colors.grey[700],)

                     ),
                     new Container(
                       height: 50,
                       child: new Padding(
                         padding: EdgeInsets.fromLTRB(35, 2, 0, 0)
                         ,child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           new Padding(
                             padding: EdgeInsets.only(top: 3),
                             child:  new Text('Serial Number',
                               style: new TextStyle(
                                 fontSize: 16,


                               ),),),
                           new Padding(
                             padding: EdgeInsets.only(top: 5,bottom: 2),
                             child:  new Container(
                               width: 250,
                               child: serial,
                             ),)
                         ],
                       ),
                       ),
                     ),

                   ],
                 ),
               ),

             ) ,
             new Card(
               elevation: 5,
               margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: new Container(
                 height: 70,
                 child: new Row(
                   children: <Widget>[
                     new Padding(
                         padding: EdgeInsets.only(left: 15,bottom: 10)
                         ,child:  Icon(Icons.date_range,color: Colors.grey[700],)

                     ),
                     new Container(
                       height: 50,
                       child: new Padding(
                         padding: EdgeInsets.fromLTRB(35, 2, 0, 0)
                         ,child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           new Padding(
                             padding: EdgeInsets.only(top: 3),
                             child:  new Text('Expire Date',
                               style: new TextStyle(
                                 fontSize: 16,

                               ),),),
                           new Padding(
                             padding: EdgeInsets.only(top: 5,bottom: 2),
                             child:  new Container(
                               width: 250,
                               child: new Text(date.year.toString()+'-'+
                                                date.month.toString()+'-'+
                                                date.day.toString())
                               ,
                             ),)
                         ],
                       ),
                       ),
                     ),

                   ],
                 ),
               ),

             ),
             new Card(
               elevation: 5,
               margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: new Container(
                 height: 70,
                 child: new Row(
                   children: <Widget>[
                     new Padding(
                         padding: EdgeInsets.only(left: 15,bottom: 10)
                         ,child:  Icon(Icons.local_hospital,color: Colors.grey[700],)

                     ),
                     new Container(
                       height: 50,
                       child: new Padding(
                         padding: EdgeInsets.fromLTRB(35, 2, 0, 0)
                         ,child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           new Padding(
                             padding: EdgeInsets.only(top: 3),
                             child:  new Text('AME',
                               style: new TextStyle(
                                 fontSize: 16,

                               ),),),
                           new Padding(
                             padding: EdgeInsets.only(top: 5,bottom: 2),
                             child:  new Container(
                               width: 250,
                               child: ame,
                             ),)
                         ],
                       ),
                       ),
                     ),

                   ],
                 ),
               ),

             ) ,
             new Card(
               elevation: 5,
               margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: new Container(
                 height: 70,
                 child: new Row(
                   children: <Widget>[
                     new Padding(
                         padding: EdgeInsets.only(left: 15,bottom: 10)
                         ,child:  Icon(Icons.assignment_late,color: Colors.grey[700],)

                     ),
                     new Container(
                       height: 50,
                       child: new Padding(
                         padding: EdgeInsets.fromLTRB(35, 2, 0, 0)
                         ,child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           new Padding(
                             padding: EdgeInsets.only(top: 3),
                             child:  new Text('Limitation',
                               style: new TextStyle(
                                 fontSize: 16,

                               ),),),
                           new Padding(
                             padding: EdgeInsets.only(top: 5,bottom: 2),
                             child:  new Container(
                               width: 250,
                               child: limit,
                             ),)
                         ],
                       ),
                       ),
                     ),

                   ],
                 ),
               ),

             ) ,],
         ),
          new GestureDetector(
            onTap: ()async{
            await  _editController.forward();
         // await _editController.reverse();
              _navigateToEditPage(context,data,date);



              await _editController.reverse();

            },
            child: new MedicalAnimation(
                controller: _editController.view,
            ),
          )
        ],
      ),
    );
  }

 _navigateToEditPage (BuildContext context,List list,DateTime date) async {

  print('9999999');
   var result= await Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context)=> medicalPageEdit(
               serialNumber:list[0].toString(),
               expireDate:date ,
               ame: list[1].toString(),
               limitation:list[2].toString() ,
             )
         ));

  serial=new Text(result[0]);
  ame=new Text(result[1]);
  limit=new Text(result[2]);

          print(serial);
   }
}