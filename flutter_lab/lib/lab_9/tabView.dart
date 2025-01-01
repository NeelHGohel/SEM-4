import 'package:flutter/material.dart';
import 'package:flutter_lab/lab_9/about.dart';
import 'package:flutter_lab/lab_9/home.dart';

class Tabview extends StatelessWidget {
  const Tabview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "About",
              )
            ],
          ),
        ),
        body: TabBarView(children: [Home(), About()]),
      ),
    );
  }
}
