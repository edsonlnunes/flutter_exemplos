import 'package:flutter/material.dart';

class FlexibleExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.red,
            height: 80,
            child: Text('Filho grande'),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              height: 80,
              child: Text('Filho'),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              color: Colors.blue,
              height: 80,
              child: Text('Filho'),
            ),
          ),
        ],
      ),
    );
  }
}
