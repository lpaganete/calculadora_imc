import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Esse widget é definido apenas uma vez no seu app
      debugShowCheckedModeBanner: false, // Remove o baner de indicação de debug
      darkTheme: ThemeData(
          //Define um thema para o nosso app
          primaryColor: Colors.blue),
      home:
          HomePage(), // No  home chama a classe HomePage que foi criada (É a primeira tela que o usuário vai ver)
    );
  }
}



