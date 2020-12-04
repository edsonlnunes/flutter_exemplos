import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class NuBankPage extends StatefulWidget {
  @override
  _NuBankPageState createState() => _NuBankPageState();
}

// #3C194F
// #7A1B81
class _NuBankPageState extends State<NuBankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(60, 25, 79, 1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: FlipCard(
            direction: FlipDirection.VERTICAL,
            front: NuBankFrente(),
            back: NuBankTraseira(),
          ),
        ),
      ),
    );
  }
}

class NuBankFrente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8.5 / 5.4,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(97, 47, 116, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 10,
              top: 5,
              child: Image.asset(
                'assets/mastercard.png',
                height: 80,
              ),
            ),
            Positioned(
              left: 40,
              top: 80,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/chip.png',
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/nfc.png',
                    height: 30,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              left: 15,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/nu_logo.png',
                    color: Colors.white70,
                    height: 130,
                  ),
                  Text(
                    'EDSON L M NUNES',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NuBankTraseira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8.5 / 5.4,
      child: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Color.fromRGBO(97, 47, 116, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              top: 15,
              child: Container(
                color: Colors.grey[400],
                height: 70,
                width: 800,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 15,
              child: Image.asset(
                'assets/cirrus.png',
                height: 50,
              ),
            ),
            Positioned(
              bottom: 25,
              left: 15,
              child: Text(
                '9999 9999 9999 9999 9999',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
