import 'package:flutter/material.dart';
import 'package:flutter_exemplos/pages/crud-user-video/pages/form_user.dart';
import 'package:flutter_exemplos/pages/crud-user-video/pages/list_users.dart';
import 'package:flutter_exemplos/pages/crud-user-video/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.LIST_USERS,
      routes: {
        AppRoutes.LIST_USERS: (_) => ListUsersPage(),
        AppRoutes.FORM_USER: (_) => FormUserPage(),
      },
      // onGenerateRoute: (settings) {
      //   print('on generage route');
      //   print(settings.name);
      //   print(settings.arguments);

      //   // return MaterialPageRoute(builder: (_) => FormUserPage());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => FormUserPage());
      // },
    );
  }
}
