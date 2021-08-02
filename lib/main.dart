import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/Home.dart';
import 'Screens/detailedcity.dart';
import 'Screens/search_screen.dart';

void main() {
  runApp(new MyApp());


  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
