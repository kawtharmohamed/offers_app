import 'package:flutter/material.dart';

import 'customburger.dart';
import 'customdrink.dart';
import 'main.dart';

class Drink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Drink Category"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        elevation: 0.00,
        backgroundColor: purple,
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: ListView( children: [
          Container(
              height :550 ,
              width: 500,
              child: Customdrink()),
        ],),
      ),
    );
  }
}