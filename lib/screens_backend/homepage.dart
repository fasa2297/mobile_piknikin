import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final String url = 'http://127.0.0.1:8000/api/museum';

  Future getMuseums() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getMuseums();
    return Scaffold(
      appBar: AppBar(
        title: Text('Test get data'),
      ),
      body: Container(),
    );
  }
}
