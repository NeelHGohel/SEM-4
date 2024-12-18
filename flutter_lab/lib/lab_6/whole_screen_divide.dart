import 'package:flutter/material.dart';

class WholeScreenDivide extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Whole Screen divide" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.red,)),
              Expanded(child: Container(color: Colors.green,)),
              Expanded(child: Container(color: Colors.blue,))
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.brown,)),
              Expanded(child: Container(color: Colors.blueGrey,)),
              Expanded(child: Container(color: Colors.purple,))
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.black,)),
              Expanded(child: Container(color: Colors.redAccent,)),
              Expanded(child: Container(color: Colors.orange,))
            ],
          )),
        ],
      ),
    );
  }
}