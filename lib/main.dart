//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_piknikin/landingpage.dart';
//import 'package:http/http.dart' as http;

//--------testing ambil data dari db
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
/*
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

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List museumlist = [];

  getAllmuseum() async {
    var respone = await http.get("http://127.0.0.1/php_run/DataMuseum.php");
    if (respone.statusCode == 200) {
      setState(() {
        museumlist = json.decode(respone.body);
      });
      print(museumlist);
      return museumlist;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllmuseum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test ambil data'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
          itemCount: museumlist.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(museumlist[index]['nama']),
            );
          }),
    );
  }
}
*/