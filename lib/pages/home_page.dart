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
    return Container(
      margin: EdgeInsets.all(20) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // O stretch ocupa toda a largura (no caso do ícone não vai ocupar, pois ele tem um tamanho fixo)
        children: <Widget>[
          Icon(Icons.person, size: 120.0, color: Colors.yellow[900]),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (kg)",
            labelStyle: TextStyle(color: Colors.yellow[900]),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
          )
        ],
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
