import 'package:flutter/material.dart';

class Scrollview extends StatefulWidget {
  const Scrollview({super.key});

  @override
  State<Scrollview> createState() => _SingleChildScrollviewState();
}

class _SingleChildScrollviewState extends State<Scrollview> {
  List<String> names = [
    'Neel',
    'Yashraj',
    'Jineesh',
    'Prasham',
    'Neel',
    'Yashraj',
    'Jineesh',
    'Prasham',
    'Neel',
    'Yashraj',
    'Yashraj',
    'Jineesh',
    'Prasham',
    'Neel',
    'Yashraj'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Single Child Scroll View",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.white,
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Text(
                  names[index],
                  style: TextStyle(

                      backgroundColor: Colors.black, color: Colors.white , fontSize: 50),
                );
              },
            ),
          ),
          Container(
            height: 100,
            color: Colors.pink,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,childAspectRatio: 5),
              itemBuilder: (context, index) {
                return Text(names[index]);
              },
            ),
          ),
          Container(
            height: 100,
            color: Colors.orange,
          ),
          Container(
            height: 100,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: Colors.red,
          ),
          Container(
            height: 100,
            color: Colors.grey,
          ),
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Container(
            height: 100,
            color: Colors.pink,
          ),
          Container(
            height: 100,
            color: Colors.orange,
          ),
          Container(
            height: 100,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: Colors.red,
          ),
        ],
      )),
    );
  }
}
