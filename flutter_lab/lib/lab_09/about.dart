import 'package:flutter/material.dart';
import 'package:flutter_lab/lab_09/home.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to About Page",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                "Back page",
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
