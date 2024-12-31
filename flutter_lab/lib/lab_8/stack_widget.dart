import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stack_Widget extends StatefulWidget {
  const Stack_Widget({super.key});

  @override
  State<Stack_Widget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<Stack_Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpa-OPGCHyX-GPQRrwoR289o79lh94R-ERw&s",
              fit: BoxFit.fill),
          Text(
            "Hello",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 50,
            ),
          ),
          Positioned(
            child: Text(
              "World",
              style: TextStyle(color: Colors.green, fontSize: 50),
            ),
            right: 0,
          )
        ],
      ),
    );
  }
}
