import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonDataScreen extends StatefulWidget {
  @override
  _JsonDataScreenState createState() => _JsonDataScreenState();
}

class _JsonDataScreenState extends State<JsonDataScreen> {
  List<dynamic> jsonData = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  // Load the JSON data from the asset
  Future<void> loadJsonData() async {
      String jsonString = await DefaultAssetBundle.of(context).loadString('assets/data.json');
      print('JSON loaded: $jsonString');

      List<dynamic> decodedData = jsonDecode(jsonString);
      print('Decoded data: $decodedData');

      setState(() {
        jsonData = decodedData;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Data from Assets'),
        backgroundColor: Colors.blueAccent,
      ),
      body: jsonData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: jsonData.length,
          itemBuilder: (context, index) {
            // Get the current item from the JSON list
            var item = jsonData[index];

            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                leading: Icon(Icons.person, color: Colors.blueAccent),
                title: Text(
                  item['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                subtitle: Text(
                  'Age: ${item['age']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
