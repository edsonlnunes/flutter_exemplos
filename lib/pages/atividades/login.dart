import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Login to continue!',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Entrada(Icons.person_outline, 'Username'),
            SizedBox(
              height: 16,
            ),
            Entrada(Icons.lock_outline, 'Password'),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [Colors.red[300], Colors.orange],
                ),
              ),
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Entrada extends StatelessWidget {
  final IconData icon;
  final String texto;

  Entrada(this.icon, this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            color: Colors.red[300],
            size: 32,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            this.texto,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 24,
              color: Colors.black45,
            ),
          )
        ],
      ),
    );
  }
}
