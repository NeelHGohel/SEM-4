import 'package:flutter/material.dart';

class ListViewOfCity extends StatefulWidget {
  const ListViewOfCity({super.key});

  @override
  State<ListViewOfCity> createState() => _ListViewOfCityState();
}

class _ListViewOfCityState extends State<ListViewOfCity> {
  @override
  Widget build(BuildContext context) {
    List<String> city = ['Rajkot', 'Morbi', 'Ahemdabad', 'Surat', 'Amreli'];
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.builder(
        itemCount: city.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(city[index]),
          );
        },
      ),
    );
  }
}
