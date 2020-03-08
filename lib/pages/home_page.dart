import 'package:calculadora_imc/widget/textField_numbers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Pegando os valores dos dois textField
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  //Uma string que vai ser modificada com o resultado // Será chamada no Text que mostra o resultado do calculo
  String _infoText = "Informe seus dados!";

  // Função que limpa os campos text field e o de resultado. Será chamda no IconButton
  void _resetFields() {
    pesoController.text = "";
    alturaController.text = "";
    _infoText = "Informe seus dados!";
  }

  //Esta função será chamada no onpressed no botão calcular
  void _calculandoIMC() {
    setState(() {
      double peso = double.parse(pesoController.text); // converte o texto para double
      double altura = double.parse(alturaController.text) /
          100; // divindo por 100 para dar o resultado em cm
      double imc = peso / (altura * altura);
      print(imc);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _text(),
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed:
                _resetFields, // Chama o método para zerar todas as variáveis
          ),
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
          textField_peso(),
          textField_altura(),
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
            child: Container(
              height: 50.0,
              child: _raisedButtonCalcular(),
            ),
          ),
          Text(
            _infoText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
          ),
        ],
      ),
    );
  }

  TextField textField_peso() {
    return TextField(
          controller: pesoController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (kg)",
            labelStyle: TextStyle(color: Colors.yellow[900]),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
        );
  }

  TextField textField_altura() {
    return TextField(
      controller: alturaController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Altura (cm)",
            labelStyle: TextStyle(color: Colors.yellow[900]),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
        );
  }

  

  _raisedButtonCalcular() {
    return RaisedButton(
      onPressed: _calculandoIMC,
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
