import 'package:flutter/material.dart';

class Vertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "This is vertical space",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.red,
          )),
          Expanded(
              child: Container(
            color: Colors.yellow,
          )),
          Expanded(
              child: Container(
            color: Colors.black,
          )),
        ],
      ),
    );
  }
}
