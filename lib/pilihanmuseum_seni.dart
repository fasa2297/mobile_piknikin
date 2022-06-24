import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_piknikin/detailmuseum.dart';
import 'package:mobile_piknikin/katagorimuseum.dart';
import 'package:mobile_piknikin/navigationbar.dart';

class PilihanMuseum_seni extends StatefulWidget {
  const PilihanMuseum_seni({super.key});
  @override
  _PilihanMuseum_seni createState() => _PilihanMuseum_seni();
}

class _PilihanMuseum_seni extends State<PilihanMuseum_seni> {
  final String url = 'http://127.0.0.1:8000/api/katagori/Seni';

  Future getMuseums() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: title,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 15, 15, 15)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KatagoriMuseum()),
                );
              },
            ),
          ),
          body: FutureBuilder(
              future: getMuseums(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  //return Text('Data Oke');
                  return ListView.builder(
                      itemCount: snapshot.data['data'].length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data['data'][index]['nama']);
                      });
                } else {
                  return Text('Data error');
                }
              })),
    );
  }
}
