import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_piknikin/pesantiket.dart';
import 'package:mobile_piknikin/detailmuseum.dart';
import 'package:mobile_piknikin/katagorimuseum.dart';
import 'package:mobile_piknikin/navigationbar.dart';

class PilihanMuseum_sejarah extends StatefulWidget {
  const PilihanMuseum_sejarah({super.key});
  @override
  _PilihanMuseum_sejarah createState() => _PilihanMuseum_sejarah();
}

class _PilihanMuseum_sejarah extends State<PilihanMuseum_sejarah> {
  final String url = 'http://127.0.0.1:8000/api/katagori/Sejarah';

  Future getMuseums() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getMuseums();
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
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 5, 0),
              /*kiri */
              child: Text(
                'Museum Sejarah',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navbarr()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset(
                            'assets/images/Monumen_jogja_kembali.jpg',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Monumen Jogja Kembali'),
                        subtitle: Text(
                            'Museum sejarah perjuangan kemerdekaan Indonesia yang ada di DIY dan dikelola oleh Kementerian Pariwisata dan Ekonomi Kreatif.'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navbarr()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset(
                            'assets/images/IndonesianAirForceMuseum.jpg',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Museum Pusat TNI AU Dirgantara Mandala'),
                        subtitle: Text(
                            'Museum ini berisikan benda-benda koleksi sejarah, dimana sebagian besarnya berupa pesawat terbang yang pernah mengabdikan diri di lingkungan TNI AU.'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navbarr()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset('assets/images/museum-jogja.jpg',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Museum HM Soeharto'),
                        subtitle: Text(
                            'Memorial Jenderal Besar H. M. Soeharto adalah adalah bangunan bersejarah berbentuk museum yang menyimpan memoar dan peninggalan-peninggalan Jenderal Besar TNI Soeharto.'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
