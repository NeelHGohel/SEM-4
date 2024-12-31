import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Img_Web extends StatefulWidget {
  const Img_Web({super.key});

  @override
  State<Img_Web> createState() => _Img_assetState();
}

class _Img_assetState extends State<Img_Web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpa-OPGCHyX-GPQRrwoR289o79lh94R-ERw&s"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
