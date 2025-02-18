import 'package:flutter/material.dart';
import './export_file.dart';
import 'lab_16/insert_screen.dart';
import 'lab_19/json_data_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    home: JsonDataScreen(),
      // home: Lab17ListView(),
    );

  }
}

