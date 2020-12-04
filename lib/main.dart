import 'package:cnpj_cpf_formatter/cnpj_cpf_formatter.dart';
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
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Flexible(
                child: TextField(
              keyboardType: TextInputType.numberWithOptions(),
            )),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var showPassword = false;

  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  hintText: 'Digite o nome completo',
                  hintStyle: TextStyle(
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // focusedBorder: UnderlineInputBorder(),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     width: 2,
                  //     color: Colors.orange,
                  //   ),
                  // ),
                  // filled: true,
                  // fillColor: Colors.red,
                  // counterText: 'TEsteando',
                  // counter: Text('Limite atingido'),
                  contentPadding: EdgeInsets.only(left: 10),
                  // prefixIcon: Icon(Icons.person),
                  // prefixText: 'Nome',
                  suffixIcon: IconButton(
                    icon: Icon(!showPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                  icon: Icon(Icons.person),
                ),
                cursorColor: Colors.red,
                // cursorWidth: 10,
                buildCounter: (ctx, {currentLength, isFocused, maxLength}) {
                  if (isFocused) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('$currentLength / $maxLength'),
                        SizedBox(width: 10),
                        Icon(Icons.smoking_rooms),
                      ],
                    );
                  }
                },
                enabled: true,
                // maxLines: 2,
                obscureText: false,
                style: TextStyle(color: Colors.orange),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print('change $value');
                },
                onSubmitted: (value) {
                  print('submitted $value');
                },
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                  print(_controller.text);
                  // _focusNode2.requestFocus();
                },
                focusNode: _focusNode,
                controller: _controller,
                inputFormatters: [
                  CnpjCpfFormatter(eDocumentType: EDocumentType.BOTH),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              TextFormField(
                focusNode: _focusNode2,
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Clique aqui'),
              ),
              Text(_controller.text.replaceAll(RegExp(r"[^\s\w]"), '')),
            ],
          ),
        ),
      ),
    );
  }
}
