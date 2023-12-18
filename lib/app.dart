import 'package:flutter/material.dart';
import 'package:offersapp/bottom_nav.dart';
import 'package:offersapp/onBoarding.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> CartProvider(),
    child: Builder( builder: (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: OnBoarding(),
    );
    } ),
    );
  }
}
