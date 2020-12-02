import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exemplos/pages/atividades/login.dart';
import 'package:flutter_exemplos/pages/atividades/nubank.dart';
import 'package:flutter_exemplos/pages/icons.dart';
import 'package:flutter_exemplos/pages/meio_a_meio.dart';
import 'package:flutter_exemplos/pages/teste.dart';

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
      home: TestePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(60, 25, 79, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: AspectRatio(
            aspectRatio: 8.5 / 5.4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(97, 47, 116, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Image.asset(
                      'assets/mastercard.png',
                      width: 70,
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 60,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/chip.png',
                          width: 70,
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/nfc.png',
                          width: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
