import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bottom Sheet DEMO",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      // body: BottomSheet(
      //   onClosing: () {
      //
      //   },
      //   builder: (context) {
      //
      //
      //   },
      // ),
    );
  }
}
