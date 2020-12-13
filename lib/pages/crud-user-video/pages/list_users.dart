import 'package:flutter/material.dart';
import 'package:flutter_exemplos/pages/crud-user-video/models/user.dart';
import 'package:flutter_exemplos/pages/crud-user-video/infra/db_sqlite.dart';
import 'package:flutter_exemplos/pages/crud-user-video/repositories/user_repository.dart';
import 'package:flutter_exemplos/pages/crud-user-video/utils/app_routes.dart';

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  List<User> users;

  var repository = UserRepository(DBSQLite());
  Future<List<User>> getUsers;

  @override
  void initState() {
    super.initState();
    getUsers = repository.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
      body: FutureBuilder(
        future: getUsers,
        builder: (_, AsyncSnapshot<List<User>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          users = snapshot.data;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              var user = users[index];

              return ListTile(
                leading: Icon(
                  user.active ? Icons.check_circle : Icons.highlight_off,
                  color: user.active ? Colors.green : Colors.red,
                ),
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
                isThreeLine: true,
                onTap: () async {
                  // var userUpdated = await Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (_) => FormUserPage(user: user)),
                  // );

                  var userUpdated = await Navigator.of(context).pushNamed(
                    AppRoutes.FORM_USER,
                    arguments: user,
                  );

                  if (userUpdated != null) {
                    setState(() {
                      user = userUpdated;
                    });
                  }
                },
                onLongPress: () async {
                  var deleted = await repository.deleteUser(user.id);
                  if (deleted) {
                    setState(() {
                      users.removeAt(index);
                    });
                  }
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // var user = await Navigator.of(context).push(
          //   MaterialPageRoute(builder: (_) => FormUserPage()),
          // );

          var user = await Navigator.of(context).pushNamed(AppRoutes.FORM_USER);

          if (user != null) {
            setState(() {
              users.add(user);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
