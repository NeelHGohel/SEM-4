import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textwidget extends StatefulWidget {
  const Textwidget({super.key});

  @override
  State<Textwidget> createState() => _TextwidgetState();
}

class _TextwidgetState extends State<Textwidget> {
  TextEditingController controller = TextEditingController();
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 100),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print("Click value ${controller}");
                setState(() {
                  value = controller.text;
                  controller.text = "";
                });
              },
              child: Text("click"))
        ],
      ),
    );
  }
}
