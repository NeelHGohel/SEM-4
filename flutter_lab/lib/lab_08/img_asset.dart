import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Img_asset extends StatefulWidget {
  const Img_asset({super.key});

  @override
  State<Img_asset> createState() => _Img_assetState();
}

class _Img_assetState extends State<Img_asset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
              // image: Image.assets("assets/images/1.jpg")
        ),
      ),
    ));
  }
}
