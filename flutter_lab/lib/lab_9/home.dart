import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Welcome to Home Page"),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(About())
          }, child: Text("Next Page"))
        ],
      ),
    );
  }
}
