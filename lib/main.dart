import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exemplos/pages/icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
  Crie uma aplicação Flutter que atenda os requisitos abaixo:

  - Somente uma página, sem navegação.
  - Com uma AppBar com o título 'My First Flutter app'.
  - Texto centralizado com fontSize 28. Escrito 'calc: $_calc'
  - ao clicar neste texto, multiplique a variável _calc por 2. Lembre-se de inicializa-la em 1.
  - ao clicar e manter pressionado neste texto volte o valor de _calc para 1.

  OBS: Use GestureDetector
*/

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        systemNavigationBarColor: Colors.blue,
      ),
    );
    return MaterialApp(
      home: IconsPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 300,
        height: 300,
        // color: Colors.amber,
        child: Center(
          child: Stack(
            overflow: Overflow.clip,
            children: [
              Container(
                height: 150,
                width: 180,
                color: Colors.red,
              ),
              Container(
                height: 120,
                width: 130,
                color: Colors.green,
              ),
              Container(
                height: 80,
                width: 90,
                color: Colors.yellow,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Text(
                  'posicioned com um testo mto grande',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
