import 'package:flutter/material.dart';

import 'custom1.dart';
import 'main.dart';

class Resturants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("OFFERS APP"),
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
        backgroundColor: purple,),
      extendBodyBehindAppBar: true,
      body: Custom1(
        31.0403947,
        31.3814016,
        30.0600846,
        31.3394537,
        "McDonalds madinet nasr",
        "19990",
        30.0838991,
        31.3289443,
        "KFC masr elgdida",
        "19019",
        30.0664076,
        31.338447,
        "Pizza Hut madinet nasr",
        "19000",
        30.0915555,
        31.3134673,
        "Bazooka masr elgdida",
        "16455",
        30.0869697,
        31.311296,
        "Hardee's masr elgdida ",
        "19319",
      ),
    );
  }
}
