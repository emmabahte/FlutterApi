import 'package:airline/components/inputFields.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class FormContainer extends StatelessWidget{
final formKey;
final idOnSaved;
final passwordOnSaved;

  FormContainer({@required this.formKey,this.idOnSaved,this.passwordOnSaved});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: new Column(
        children: <Widget>[
          new Form(
            key:formKey  ,
              child:new Column(
                children: <Widget>[
                  new InputFieldArea(
                    hint: "Personal ID",
                    obsecure: false,
                    icon: Icons.person_outline,
                    validator: (String value){
                      if(value.length==0){
                        return 'Can not be empty';
                      }
                      if(!isInt(value)) {
                           return 'Invalid ID';
                      }

                    },
                    onSaved:idOnSaved
                  ),
                  new InputFieldArea(
                    hint: "Password",
                    obsecure: true,
                    icon: Icons.lock_outline,
                    validator: (String value){
                      if (value.length<6){
                        return 'at least 6 character';
                      }
                    },
                    onSaved:passwordOnSaved
                  ),
                ],
              ) )
        ],
      ),
    );
  }

}
