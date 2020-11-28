import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              color: Colors.red,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
                image: DecorationImage(
                  image: AssetImage('assets/goku.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(width: 5),
                borderRadius: BorderRadius.circular(150),
                // shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  stops: [
                    2,
                    1,
                  ],
                  colors: [
                    Colors.blue[100],
                    Colors.blue,
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  print('teste');
                },
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.send),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Clique aqui',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
