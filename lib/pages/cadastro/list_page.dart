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
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //   accountName: Text('Edson Martins'),
            //   accountEmail: Text('edson@growdev.com'),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage: AssetImage('assets/goku.jpg'),
            //   ),
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/goku.jpg'),
            //       fit: BoxFit.fitWidth,
            //     ),
            //   ),
            //   arrowColor: Colors.yellow,
            //   onDetailsPressed: () {
            //     print('details');
            //   },
            //   otherAccountsPictures: [
            //     CircleAvatar(
            //       backgroundImage: AssetImage('assets/mastercard.png'),
            //     ),
            //     CircleAvatar(
            //       backgroundImage: AssetImage('assets/mastercard.png'),
            //     ),
            //   ],
            // ),
            Container(
              height: 200,
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/goku.jpg'),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Edson Martins',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('edson@growde.com',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.android),
              title: Text('Menu 1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      endDrawer: Drawer(),
      body: ListView(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.teal,
                width: 2,
              ),
            ),
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                          // borderRadius: BorderRadius.circular(30),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Um titulo qualquer que vai extorar o espaço da tela, o que vocÊs acham que vai acontecer?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '               Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text('Editar'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // body: FutureBuilder<List<User>>(
      //   future: getUsers,
      //   builder: (ctx, AsyncSnapshot<List<User>> snapshot) {
      //     users = snapshot.data;
      //     print('executando');

      //     if (!snapshot.hasData && !snapshot.hasError) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           backgroundColor: Theme.of(context).primaryColor,
      //         ),
      //       );
      //     }

      //     print(users.length);
      //     return ListView.builder(
      //       itemCount: users.length,
      //       itemBuilder: (ctx, index) {
      //         var user = users[index];

      //         return Dismissible(
      //           key: ValueKey(user.id),
      //           background: Container(
      //             color: Colors.red,
      //             child: Row(
      //               children: [
      //                 Icon(
      //                   Icons.delete,
      //                   size: 40,
      //                   color: Colors.white,
      //                 ),
      //                 SizedBox(width: 10),
      //                 Text(
      //                   'Remover',
      //                   style: TextStyle(
      //                     fontSize: 22,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           secondaryBackground: Container(
      //             color: Colors.green,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 Icon(
      //                   Icons.archive,
      //                   size: 40,
      //                   color: Colors.white,
      //                 ),
      //                 SizedBox(width: 10),
      //                 Text(
      //                   'Arquivar',
      //                   style: TextStyle(
      //                     fontSize: 22,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           direction: DismissDirection.startToEnd,
      //           onDismissed: (direction) {
      //             Scaffold.of(ctx).showSnackBar(SnackBar(
      //               content: Text(
      //                 'Usuário removido...',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 20,
      //                 ),
      //               ),
      //             ));
      //           },
      //           confirmDismiss: (direction) async {
      //             var deleted = await repository.deleteUser(user.id);
      //             if (deleted) {
      //               users.removeAt(index);
      //               return true;
      //             }

      //             return false;
      //           },
      //           child: ListTile(
      //             leading: Hero(
      //               tag: user.id.toString(),
      //               child: CircleAvatar(
      //                 backgroundImage: user.image != null
      //                     ? FileImage(user.image)
      //                     : AssetImage('assets/goku.jpg'),
      //               ),
      //             ),
      //             isThreeLine: true,
      //             title: Text(
      //               '${user.name}, ${user.age} anos',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16,
      //               ),
      //             ),
      //             subtitle: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text('CPF: ${user.document}'),
      //                 Text('E-mail: ${user.email}'),
      //               ],
      //             ),
      //             trailing: Icon(
      //               user.active ? Icons.check_circle : Icons.highlight_off,
      //               color: user.active ? Colors.green : Colors.red,
      //             ),
      //             onTap: () async {
      //               var userUpdated = await Navigator.of(context)
      //                   .pushNamed(AppRoutes.USER_FORM, arguments: user);

      //               // var userUpdated = await Navigator.of(context).push(
      //               //   MaterialPageRoute(
      //               //     builder: (ctx) => FormPage(user: user),
      //               //   ),
      //               // );

      //               if (userUpdated != null) {
      //                 setState(() {
      //                   user = userUpdated;
      //                 });
      //               }
      //             },
      //             // selected: user.active,
      //             // enabled: user.active,
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
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
