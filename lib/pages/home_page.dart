import 'package:calculadora_imc/widget/textField_numbers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _text(),
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      backgroundColor: Color(0xffffffff),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // O stretch ocupa toda a largura (no caso do ícone não vai ocupar, pois ele tem um tamanho fixo)
        children: <Widget>[
          Icon(Icons.person, size: 120.0, color: Colors.yellow[900]),
          TextFieldNumber("Peso (kg)"),
          TextFieldNumber("Altura (cm)"),
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
            child: Container(
              height: 50.0,
              child: _raisedButtonCalcular(),
            ),
          ),
          Text(
            "Info",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
          ),
        ],
      ),
    );
  }

  _raisedButtonCalcular() {
    return RaisedButton(
      onPressed: () {},
      color: Colors.yellow[900],
      child: Text(
        "Calcular",
        style: TextStyle(color: Color(0xffffffff), fontSize: 25.0),
      ),
    );
  }

  _text() {
    return Text(
      "Calculadra de IMC",
      style: TextStyle(
        color: Color(0xffffffff),
      ),
    );
  }
}
