import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  end: AlignmentDirectional.topCenter,
                  begin: AlignmentDirectional.bottomCenter,
                  colors: [
                    Colors.red,
                    Colors.green,
                  ],
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(25),
                  child: Center(
                    child: Text(
                      'Clique Aqui',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
