import 'package:flutter/material.dart';
import 'package:flutter_exemplos/pages/crud-user-video/models/user.dart';
import 'package:flutter_exemplos/pages/crud-user-video/infra/db_sqlite.dart';
import 'package:flutter_exemplos/pages/crud-user-video/repositories/user_repository.dart';
import 'package:flutter_exemplos/pages/crud-user-video/widgets/default_input.dart';

class FormUserPage extends StatefulWidget {
  // final User user;

  // const FormUserPage({this.user});

  @override
  _FormUserPageState createState() => _FormUserPageState();
}

class _FormUserPageState extends State<FormUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  User user;

  @override
  void initState() {
    super.initState();

    // user = widget?.user ?? User();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = (ModalRoute.of(context).settings?.arguments as User) ?? User();
  }

  void saveUser() async {
    if (!_formKey.currentState.validate()) {
      showSnackBar(
        message: 'Formulário inválido',
        color: Colors.red,
      );
      return;
    }

    _formKey.currentState.save();
    var repository = UserRepository(DBSQLite());

    if (user.id != null) {
      var updated = await repository.updateUser(user);
      if (!updated) {
        showSnackBar(
          message: 'Usuário não atualizado',
          color: Colors.red,
        );
        return;
      }
    } else {
      user.id = await repository.saveUser(user);
    }

    Navigator.of(context).pop(user);
  }

  void showSnackBar({String message, Color color}) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  String validator(String value) => value.isEmpty ? 'Campo obrigatório' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('${user.name == null ? 'Novo' : 'Editar'} Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DefaultInput(
                              initialValue: user?.name,
                              label: 'Nome',
                              validator: validator,
                              onSaved: (value) => user.name = value,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: DefaultInput(
                              initialValue: user?.age?.toString(),
                              label: 'Idade',
                              validator: validator,
                              onSaved: (value) =>
                                  user.age = int.tryParse(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultInput(
                        initialValue: user?.email,
                        label: 'E-mail',
                        validator: validator,
                        onSaved: (value) => user.email = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultInput(
                        initialValue: user?.document,
                        label: 'CPF',
                        validator: validator,
                        onSaved: (value) => user.document = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Switch(
                            value: user.active,
                            onChanged: (value) {
                              setState(() {
                                user.active = value;
                              });
                            },
                          ),
                          Text(user.active ? 'Ativo' : 'Desativado'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                onPressed: saveUser,
                child: Text('Salvar'),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
                textColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
