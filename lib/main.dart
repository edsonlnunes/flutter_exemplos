import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exemplos/pages/cadastro/form.page.dart';
import 'package:flutter_exemplos/pages/cadastro/list_page.dart';
import 'package:flutter_exemplos/routes/app_routes.dart';

void main() {
  runApp(App());
}

// feature nova

// alteracao realizada
class App extends StatelessWidget {
  final primaryColor = Colors.teal;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: primaryColor,
    //     systemNavigationBarColor: primaryColor,
    //   ),
    // );
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
        initialRoute: AppRoutes.USER_LIST,
        routes: {
          AppRoutes.USER_LIST: (_) => ListUsersPage(),
          AppRoutes.USER_FORM: (_) => FormPage(),
        },
        // onGenerateRoute: (settings) {
        //   print(settings.arguments);

        //   if (settings.name == '/user') {
        //     return MaterialPageRoute(builder: (ctx) => FormPage());
        //   }
        // },
        // onUnknownRoute: (settings) {
        //   print(settings.name);
        //   return MaterialPageRoute(builder: (ctx) => FormPage());
        // },
      ),
    );
  }
}
