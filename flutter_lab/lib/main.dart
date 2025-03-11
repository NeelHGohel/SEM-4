import 'package:flutter/material.dart';
import 'package:flutter_lab/api_crud/api_crud_display.dart';
import './export_file.dart';
import 'api/api_Display.dart';
import 'database_crud/list_user.dart';
import 'database_crud/page.dart';

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
      home: ApiDiplayCRUDUserPage(),
      // home: Lab17ListView(),
    );
  }
}
