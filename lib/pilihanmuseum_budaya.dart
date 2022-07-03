// Nama : Fauzi Arya Surya Abadi
// NIM  : 1301194101

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_piknikin/detailmuseum.dart';
import 'package:mobile_piknikin/katagorimuseum.dart';
import 'package:mobile_piknikin/navigationbar.dart';

class PilihanMuseum_budaya extends StatefulWidget {
  const PilihanMuseum_budaya({super.key});
  @override
  _PilihanMuseum_budaya createState() => _PilihanMuseum_budaya();
}

class _PilihanMuseum_budaya extends State<PilihanMuseum_budaya> {
  final String url = 'http://127.0.0.1:8000/api/katagori/Budaya';

  Future getMuseums() async {
    var response = await http.get(Uri.parse(url));
    //print(json.decode(response.body));
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
                Text(
                  "  Museum Budaya",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navbarr()),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.stretch, // add this
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Image.network(
                                        snapshot.data['data'][index]
                                            ['linkfoto'], // width: 300,
                                        height: 150,
                                        fit: BoxFit.fill),
                                  ),
                                  ListTile(
                                    title: Text(
                                        snapshot.data['data'][index]['nama']),
                                    subtitle: Text(snapshot.data['data'][index]
                                        ['deskripsi']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Text('Loading data');
                }
              })),
    );
  }
}
