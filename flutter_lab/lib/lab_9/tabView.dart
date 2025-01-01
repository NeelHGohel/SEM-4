import 'package:flutter/material.dart';

class Tabview extends StatelessWidget {
  const Tabview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,initialIndex: 0, child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: Tab(

        )),
      ),
    ));
  }
}
