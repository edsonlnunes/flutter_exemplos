import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              'Testando',
              style: TextStyle(
                fontSize: 21,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text.rich(
            TextSpan(
              text: 'Texto qualquer',
              children: [
                TextSpan(
                  text: ' texto italico',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: ' Texto negrito',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text:
                      ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                  children: [
                    TextSpan(
                      text:
                          ' when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            style: TextStyle(
              fontSize: 24,
              color: Colors.red,
            ),
            overflow: TextOverflow.visible,
            maxLines: 7,
          ),
        ],
      ),
    );
  }
}
