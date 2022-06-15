//import 'dart:convert';
import 'package:mobile_piknikin/screens_backend/homepage.dart';
import 'package:flutter/material.dart';
import 'package:mobile_piknikin/landingpage.dart';
import 'package:http/http.dart' as http;

//--------testing ambil data dari db

void main() => runApp(MyApp());

// ------------ Front end progress
/*
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
*/

// ----------- Back end progress
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ambil_data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
