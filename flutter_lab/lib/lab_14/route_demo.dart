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
        title: Text("Routes Demo"),
      ),
    );
  }
}
