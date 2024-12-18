import 'package:flutter/material.dart';

class WholeScreenDivide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Whole Screen divide",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.green,
              )),
              Expanded(
                  child: Container(
                color: Colors.blue,
              ))
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.brown,
                ),
                flex: 2,
              ),
              Expanded(
                  child: Container(
                    color: Colors.blueGrey,
                  ),
                  flex: 2),
              Expanded(
                  child: Container(
                color: Colors.purple,
              ))
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.black,
              )),
              Expanded(
                  child: Container(
                    color: Colors.redAccent,
                  ),
                  flex: 3),
              Expanded(
                  child: Container(
                    color: Colors.orange,
                  ),
                  flex: 2)
            ],
          )),
        ],
      ),
    );
  }
}
