import 'package:flutter/material.dart';
import 'package:flutter_exemplos/infra/db_sqlite.dart';
import 'package:flutter_exemplos/models/user.dart';
import 'package:flutter_exemplos/pages/cadastro/form.page.dart';
import 'package:flutter_exemplos/repositories/user_repository.dart';
import 'package:flutter_exemplos/routes/app_routes.dart';

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  var users = <User>[];

  final repository = UserRepository(DBSQLite());
  Future<List<User>> getUsers;

  @override
  void initState() {
    super.initState();

    getUsers = repository.getUsers();

    // UserRepository(DBSQLite()).getUsers().then(
    //   (value) {
    //     setState(() {
    //       users = value;
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
      body: FutureBuilder<List<User>>(
        future: getUsers,
        builder: (_, AsyncSnapshot<List<User>> snapshot) {
          users = snapshot.data;
          print('executando');

          if (!snapshot.hasData && !snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            );
          }

          print(users.length);
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: users.length,
            itemBuilder: (ctx, index) {
              var user = users[index];

              return ListTile(
                onLongPress: () async {
                  var deleted = await repository.deleteUser(user.id);
                  if (deleted) {
                    setState(() {
                      users.removeAt(index);
                    });
                  }
                },
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
                onTap: () async {
                  var userUpdated = await Navigator.of(context)
                      .pushNamed(AppRoutes.USER_FORM, arguments: user);

                  // var userUpdated = await Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (ctx) => FormPage(user: user),
                  //   ),
                  // );

                  if (userUpdated != null) {
                    setState(() {
                      user = userUpdated;
                    });
                  }
                },
                // selected: user.active,
                // enabled: user.active,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var user = await Navigator.of(context).pushNamed(AppRoutes.USER_FORM);

          if (user != null) {
            setState(() {
              users.add(user);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Lista de usuários'),
    //   ),
    //   body: ListView.builder(
    //     padding: EdgeInsets.symmetric(horizontal: 10),
    //     itemCount: users.length,
    //     itemBuilder: (ctx, index) {
    //       final user = users[index];
    //       //                         Edson, 23 anos
    //       // ICONE(ATIVO OU NAO)     CPF: xxxx | email: XXXXX     BOTAO PARA EDITAR
    //       return ListTile(
    //         leading: Icon(
    //           user.active ? Icons.check_circle : Icons.highlight_off,
    //           color: user.active ? Colors.green : Colors.red,
    //         ),
    //         isThreeLine: true,
    //         title: Text(
    //           '${user.name}, ${user.age} anos',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 16,
    //           ),
    //         ),
    //         subtitle: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('CPF: ${user.document}'),
    //             Text('E-mail: ${user.email}'),
    //           ],
    //         ),
    //         trailing: IconButton(
    //           icon: Icon(Icons.edit),
    //           onPressed: () {},
    //         ),
    //         onTap: () {},
    //         // selected: user.active,
    //         enabled: user.active,
    //       );
    //       // return Row(
    //       //   children: [
    //       //     Icon(
    //       //       user.active ? Icons.check_circle : Icons.highlight_off,
    //       //       color: user.active ? Colors.green : Colors.red,
    //       //     ),
    //       //     SizedBox(
    //       //       width: 20,
    //       //     ),
    //       //     Expanded(
    //       //       child: Column(
    //       //         crossAxisAlignment: CrossAxisAlignment.start,
    //       //         children: [
    //       //           Text(
    //       //             '${user.name}, ${user.age} anos',
    //       //             style: TextStyle(
    //       //               fontWeight: FontWeight.bold,
    //       //               fontSize: 16,
    //       //             ),
    //       //           ),
    //       //           Text('CPF: ${user.document} | E-mail: ${user.email}'),
    //       //         ],
    //       //       ),
    //       //     ),
    //       //     IconButton(
    //       //       icon: Icon(Icons.edit),
    //       //       onPressed: () {},
    //       //     )
    //       //   ],
    //       // );
    //     },
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () async {
    // Navigator.push(context,MaterialPageRoute(builder: (ctx) => FormPage()));
    // var user = await Navigator.of(context).push(
    //   MaterialPageRoute(builder: (ctx) => FormPage()),
    // );

    //       var newUser =
    //           await Navigator.of(context).pushNamed(AppRoutes.USER_FORM);

    //       if (newUser != null) {
    //         setState(() {
    //           users.add(newUser);
    //         });
    //       }
    //     },
    //     child: Icon(Icons.add),
    //   ),
    // );
  }
}
