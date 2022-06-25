import 'package:flutter/material.dart';
import 'package:mobile_piknikin/landingpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Piknikin",
      home: LandingPage(),
    );
  }
}
