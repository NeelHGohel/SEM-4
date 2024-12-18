import 'package:flutter/material.dart';

class Horizontal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("This is horizontal space" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.red,)),
          Expanded(child: Container(color: Colors.yellow,)),
          Expanded(child: Container(color: Colors.black,)),
        ],
      ),
    );
  }
}