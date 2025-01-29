import 'package:flutter/material.dart';

class RouteDemo extends StatefulWidget {
  const RouteDemo({super.key});

  @override
  State<RouteDemo> createState() => _RouteDemoState();
}

class _RouteDemoState extends State<RouteDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Routes Demo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/page1", arguments: "/http://localhost:51457/page1");
            },
            child: Text("Next")),
      ),
    );
  }
}
