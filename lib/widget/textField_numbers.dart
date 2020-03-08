import 'package:flutter/material.dart';


/*
*
*   NÃO ESTA SENDO UTILIZADO AINDA. POIS NÃO CONSEGUI FAZER O WIDGET COM STATEFULL. SOMENTE COM STATELESS (COM ISSO, NÃO CONSIGO        ALTERAR O ESTADO DO TEXTFIELD)
*
*/





class TextFieldNumber extends StatefulWidget {

  String text;
  TextEditingController controladora;

  TextFieldNumber(this.text, this.controladora);

  @override
  _TextFieldNumberState createState() => _TextFieldNumberState();
}

class _TextFieldNumberState extends State<TextFieldNumber> {
  
  get controladora => null;
  @override
  Widget build(BuildContext context) {
    return TextField(
          controller: controladora,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (kg)",
            labelStyle: TextStyle(color: Colors.yellow[900]),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
        );
  }
}
