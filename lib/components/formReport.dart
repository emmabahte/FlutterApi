
import 'package:flutter/material.dart';

class FormReport extends StatelessWidget{
  final formKey;
  final subjectOnSaved;
  final textOnSaved;

  FormReport({@required this.formKey,this.subjectOnSaved,this.textOnSaved,});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(

      child: new Column(
        children: <Widget>[
          new Form(
              key:formKey  ,
              child:new Column(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  new TextFormField(
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Please enter a subject';
                      }
                      return null;
                    },
                    onSaved:subjectOnSaved ,
                    decoration: new InputDecoration(
                        labelText: 'Subject',
                        icon: Icon(Icons.subject),
                        border: new OutlineInputBorder()
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  new TextFormField(
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Please enter type';
                      }
                      return null;
                    },
                    onSaved:subjectOnSaved ,
                    decoration: new InputDecoration(
                        labelText: 'Type',
                        icon: Icon(Icons.merge_type),
                        border: new OutlineInputBorder()
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  new Container(
                    child: TextFormField(
                      validator: (value){
                        if (value.isEmpty) {
                          return 'Report text can not be empty';
                        }
                        return null;
                      },
                      onSaved: textOnSaved,
                      maxLines: 11,
                      decoration: InputDecoration(
                          labelText: 'Write your Report here',
                          border: new OutlineInputBorder(),
                          icon: new Icon(Icons.text_fields)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                ],
              ) )
        ],
      ),
    );
  }

}
