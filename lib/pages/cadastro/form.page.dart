import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_exemplos/infra/db_sqlite.dart';
import 'package:flutter_exemplos/models/user.dart';
import 'package:flutter_exemplos/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  // final User user;

  // const FormPage({this.user});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var valueSwitch = false;

  final _formKey = GlobalKey<FormState>();
  User user;
  final repository = UserRepository(DBSQLite());
  File file;

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
                      // Container(
                      //   padding: EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(100),
                      //     color: Colors.teal.withOpacity(.2),
                      //   ),
                      //   child: CircleAvatar(
                      //     radius: 80,
                      //   ),
                      // ),

                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.teal.withOpacity(.2),
                        child: GestureDetector(
                          onTap: () async {
                            var source = await showDialog<ImageSource>(
                              context: context,
                              barrierDismissible: false,
                              child: AlertDialog(
                                title: Text('Escolha uma opção'),
                                actions: [
                                  FlatButton(
                                    child: Text('Galeria'),
                                    onPressed: () {
                                      Navigator.pop(
                                          context, ImageSource.gallery);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Camera'),
                                    onPressed: () {
                                      Navigator.pop(
                                          context, ImageSource.camera);
                                    },
                                  ),
                                ],
                              ),
                            );

                            var picker = ImagePicker();
                            var pickedFile =
                                await picker.getImage(source: source);

                            if (pickedFile != null) {
                              setState(() {
                                user.image = File(pickedFile.path);
                                file = File(pickedFile.path);
                              });
                            }
                          },
                          child: Hero(
                            tag: user?.id?.toString() ?? '',
                            // tag:user.endereco != null && user.endereco.cep != null ? user.endereco.cep.toUpperCase() : user.endereco != null ? '': '' ,
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage: user.image != null
                                  ? FileImage(user.image)
                                  : AssetImage('assets/goku.jpg'),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        initialValue: user?.name,
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
                        initialValue: user?.age?.toString() ?? '',
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
                          user.age = int.tryParse(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: user?.email,
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
                        initialValue: user?.document,
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
                    onPressed: () async {
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

                      if (user.id != null) {
                        var updated = await repository.updateUser(user);

                        if (!updated) {
                          Scaffold.of(ctx).showSnackBar(SnackBar(
                            content: Text(
                              'Não atualizou',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ));
                          return;
                        }
                      } else {
                        user.id = await repository.saveUser(user);
                      }

                      // this.showInformation();
                      // await controller.salvarNoBanco();
                      Navigator.of(context).pop(user);
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
  }
}
