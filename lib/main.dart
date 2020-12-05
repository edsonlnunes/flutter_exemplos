import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './models//user.dart';

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
  final primaryColor = Colors.teal;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        systemNavigationBarColor: primaryColor,
      ),
    );
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var valueSwitch = false;

  final _formKey = GlobalKey<FormState>();
  var user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          user.name = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Idade',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          user.age = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user.email = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CPF',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          user.document = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Switch(
                            onChanged: (value) {
                              setState(() {
                                user.active = value;
                              });
                            },
                            value: user.active,
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          Text(valueSwitch ? 'Ativo' : 'Desativado')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Builder(
              builder: (ctx) {
                return Container(
                  width: double.infinity,
                  child: OutlineButton(
                    child: Text('Salvar'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        // OU  if (!Form.of(ctx).validate()) {
                        // Scaffold.of(ctx).hideCurrentSnackBar();
                        Scaffold.of(ctx).showSnackBar(SnackBar(
                          content: Text(
                            'Formulário inválido',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          backgroundColor: Colors.red,
                        ));
                        return;
                      }

                      _formKey.currentState.save();
                      this.showInformation();
                      print('Formulario válido');
                    },
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void showInformation() async {
    // showDialog(
    //   context: context,
    //   child: SimpleDialog(
    //     title: Text('Informações do usuário'),
    //     contentPadding: EdgeInsets.all(20),
    //     titlePadding: EdgeInsets.all(20),
    //     children: [
    //       Text('Nome: ${user.name}'),
    //       Text('Idade: ${user.age}'),
    //       Text('Email: ${user.email}'),
    //       Text('CPF: ${user.document}'),
    //       Text('Está ativo?: ${user.active ? 'Sim' : 'Não'}'),
    //     ],
    //   ),
    // );
    var resultado = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      child: AlertDialog(
        title: Text('Informações do usuário'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Tem certeza?'),
            Text('Tem certeza mesmo?'),
          ],
        ),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          FlatButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
    print(resultado);
  }
}
