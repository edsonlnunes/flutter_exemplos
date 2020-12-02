import 'package:flutter/material.dart';

class MeioAMeioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  end: AlignmentDirectional.topCenter,
                  begin: AlignmentDirectional.bottomCenter,
                  colors: [
                    Colors.red,
                    Colors.green,
                  ],
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(25),
                  child: Center(
                    child: Text(
                      'Clique Aqui',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
