import 'package:flutter/material.dart';
import 'package:flutter_lab/lab_6/vertical.dart';
import 'package:flutter_lab/lab_6/whole_screen_divide.dart';
import 'package:flutter_lab/lab_8/img_asset.dart';
import 'package:flutter_lab/lab_8/img_web.dart';
import 'package:flutter_lab/lab_8/stack_widget.dart';
import 'lab_6/horizontal.dart';
import 'lab_7/textWidget.dart';
import 'lab_9/tabView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Tabview(),
    );
  }
}
