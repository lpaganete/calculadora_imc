import 'package:flutter/material.dart';

class TextFieldNumber extends StatelessWidget {
  
  String text;

  TextFieldNumber(this.text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.yellow[900]),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
    );
  }
}
