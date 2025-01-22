import 'package:flutter/material.dart';
import 'package:flutter_lab/lab_06/vertical.dart';
import 'package:flutter_lab/lab_06/whole_screen_divide.dart';
import 'package:flutter_lab/lab_08/img_asset.dart';
import 'package:flutter_lab/lab_08/img_web.dart';
import 'package:flutter_lab/lab_08/stack_widget.dart';
import 'package:flutter_lab/lab_11/both_view.dart';
import 'package:flutter_lab/lab_11/grid_view.dart';
import 'package:flutter_lab/lab_11/list_view.dart';
import 'package:flutter_lab/lab_12/date_format.dart';
import 'package:flutter_lab/lab_12/single_child_scrollview.dart';
import 'crud/form_entry.dart';
import 'lab_06/horizontal.dart';
import 'lab_07/textWidget.dart';
import 'lab_09/tabView.dart';
import 'lab_10/login_screen.dart';
import 'dart:ui';

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
      home: DateFormat(),
    );
  }
}
