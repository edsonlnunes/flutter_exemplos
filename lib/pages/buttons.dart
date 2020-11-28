import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 150,
            child: FlatButton(
              onPressed: () {},
              child: Text('Clique aqui'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            child: RaisedButton(
              onPressed: () {},
              child: Text('Clique aqui'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150),
                side: BorderSide(
                  color: Colors.red,
                  width: 5,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            child: RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.send),
              label: Text('Enviar'),
            ),
          ),
          OutlineButton(
            child: Text('teste'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
