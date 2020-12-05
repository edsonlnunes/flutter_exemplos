import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cnpj_cpf_formatter/cnpj_cpf_formatter.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  var showPassword = false;

  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _focusNode2 = FocusNode();

  void buscarCEP() {
    // logica
    print(_controller.text);
    print(_controller.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.send,
              autofocus: true,
              maxLength: 10,
              // maxLengthEnforced: true,
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
                  icon: Icon(
                      !showPassword ? Icons.visibility_off : Icons.visibility),
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
                //  CnpjCpfFormatter(eDocumentType: EDocumentType.BOTH),
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
    );
  }
}
