import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 300,
        height: 300,
        // color: Colors.amber,
        child: Center(
          child: Stack(
            overflow: Overflow.clip,
            children: [
              Container(
                height: 150,
                width: 180,
                color: Colors.red,
              ),
              Container(
                height: 120,
                width: 130,
                color: Colors.green,
              ),
              Container(
                height: 80,
                width: 90,
                color: Colors.yellow,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Text(
                  'posicioned com um testo mto grande',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
