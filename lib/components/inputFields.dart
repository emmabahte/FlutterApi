import 'package:flutter/material.dart';


class InputFieldArea extends StatelessWidget{

  final String hint;
  final bool obsecure;
  final IconData icon;
  final validator;
  final onSaved;

  InputFieldArea({this.hint,this.icon,this.obsecure,this.validator,this.onSaved});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: new TextFormField(
        validator: validator,
         onSaved: this.onSaved,
         obscureText: obsecure,
        style: const TextStyle(
          color: Colors.black
        ),
        decoration: new InputDecoration(
          icon: new Icon(
              icon,
              color: Colors.black,
          ),
          errorStyle: new TextStyle(
            color: Colors.red
          ),
          enabledBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.white30
              )
          ),
          errorBorder:new UnderlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.red
            )
          ),
          focusedErrorBorder:new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.red
              )
          ) ,
          focusedBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.white
              )
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 15,

          ),contentPadding: const EdgeInsets.only(
          top: 15,
          right: 5,
          bottom: 20,
          left: 0
        )
        ),

      ),
    );
  }

}
