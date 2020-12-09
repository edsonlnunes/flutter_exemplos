import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exemplos/pages/cadastro/form.page.dart';
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
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
          ),
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
  final users = <User>[
    User(
      name: 'User 1',
      age: '21',
      email: 'user@teste.com',
      active: true,
      document: '00011122233',
    ),
    User(
      name: 'User 2',
      age: '21',
      email: 'user2@teste.com',
      active: false,
      document: '00011122233',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: User.users.length,
        itemBuilder: (ctx, index) {
          final user = User.users[index];
          //                         Edson, 23 anos
          // ICONE(ATIVO OU NAO)     CPF: xxxx | email: XXXXX     BOTAO PARA EDITAR
          return ListTile(
            leading: Icon(
              user.active ? Icons.check_circle : Icons.highlight_off,
              color: user.active ? Colors.green : Colors.red,
            ),
            isThreeLine: true,
            title: Text(
              '${user.name}, ${user.age} anos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CPF: ${user.document}'),
                Text('E-mail: ${user.email}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            onTap: () {},
            // selected: user.active,
            enabled: user.active,
          );
          // return Row(
          //   children: [
          //     Icon(
          //       user.active ? Icons.check_circle : Icons.highlight_off,
          //       color: user.active ? Colors.green : Colors.red,
          //     ),
          //     SizedBox(
          //       width: 20,
          //     ),
          //     Expanded(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             '${user.name}, ${user.age} anos',
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 16,
          //             ),
          //           ),
          //           Text('CPF: ${user.document} | E-mail: ${user.email}'),
          //         ],
          //       ),
          //     ),
          //     IconButton(
          //       icon: Icon(Icons.edit),
          //       onPressed: () {},
          //     )
          //   ],
          // );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.push(context,MaterialPageRoute(builder: (ctx) => FormPage()));
          User user = await Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => FormPage()),
            // CupertinoPageRoute(builder: (ctx) => FormPage()),
          );
          print(user);
          print(user.runtimeType);
          print(user.name);
          setState(() {
            users.add(user);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
