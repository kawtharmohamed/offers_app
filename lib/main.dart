import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SharedPref.dart';
import 'app.dart';
dynamic purple= Colors.tealAccent[700];
dynamic purple1= Colors.teal;
dynamic grey=Colors.blueGrey[700];
 // late SharedPreferences shard;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 //shard = await SharedPreferences.getInstance();
  SharedPref.initialize();
  await Firebase.initializeApp();
  runApp(MyApp());
}

