import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Pegando os valores dos dois textField
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //Chave global

  //Uma string que vai ser modificada com o resultado // Será chamada no Text que mostra o resultado do calculo
  String _infoText = "Informe seus dados!";

  // Função que limpa os campos text field e o de resultado. Será chamda no IconButton
  void _resetFields() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>(); // Ao clicar no botão de reset ele também resetará as mensagens de erro
    });
  }

  //Esta função será chamada no onpressed no botão calcular
  void _calculandoIMC() {
    setState(() {
      double peso =
          double.parse(pesoController.text); // converte o texto para double
      double altura = double.parse(alturaController.text) /
          100; // divindo por 100 para dar o resultado em cm
      double imc = peso / (altura * altura);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.6 && imc < 29.9) {
        _infoText = "levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40.0) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
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
      child: Form(
        //Para serem feitas as validações é necessário se tenha um widget form
        key: _formKey, // Declarando a chave global
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
      ),
    );
  }

  textField_peso() {
    return TextFormField(
      controller: pesoController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso (kg)",
        labelStyle: TextStyle(color: Colors.yellow[900]),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
      validator: (value) {
        //Validando o formulário. caso o campo não esteja preenchido, ele retornará a msg
        if (value.isEmpty) {
          return "Insira seu Peso!";
        }
      },
    );
  }

  textField_altura() {
    return TextFormField(
      controller: alturaController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Altura (cm)",
        labelStyle: TextStyle(color: Colors.yellow[900]),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.yellow[900], fontSize: 25.0),
      validator: (value) {
        //Validando o formulário. caso o campo não esteja preenchido, ele retornará a msg
        if (value.isEmpty) {
          return "Insira sua Altura!";
        }
      },
    );
  }

  _raisedButtonCalcular() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          // Função anonima aciona o validador. Se ele validar, ele chama a função que calcula o imc
          _calculandoIMC();
        }
      },
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
