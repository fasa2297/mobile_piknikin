// Nama : Muh Akib A Yani
// NIM  : 1301194233

import 'package:flutter/material.dart';
import 'package:mobile_piknikin/pilihanmuseum_sejarah.dart';
import 'package:mobile_piknikin/pilihanmuseum_budaya.dart';
import 'package:mobile_piknikin/pilihanmuseum_seni.dart';

class KatagoriMuseum extends StatefulWidget {
  const KatagoriMuseum({super.key});
  @override
  _KatagoriMuseum createState() => _KatagoriMuseum();
}

class _KatagoriMuseum extends State<KatagoriMuseum> {
  @override
  Widget build(BuildContext context) {
    //final title = 'MyApp';
    return MaterialApp(
      //title: title,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 100, right: 0, bottom: 2),
              padding: EdgeInsets.fromLTRB(10, 20, 5, 0),
              /*kiri */
              child: Center(
                child: Text(
                  'Pilih museum yang mau kamu Piknikin!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 8),
              child: Center(
                child: Text(
                  'Lebih suka yang mana sih? Sekarang pilih tujuanmu!',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, top: 8, right: 50, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PilihanMuseum_seni()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.8),
                          topRight: Radius.circular(10.8),
                          bottomLeft: Radius.circular(10.8),
                          bottomRight: Radius.circular(10.8),
                        ),
                        child: Image.asset('assets/images/Museum_seni.png',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, top: 8, right: 50, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PilihanMuseum_budaya()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.8),
                          topRight: Radius.circular(10.8),
                          bottomLeft: Radius.circular(10.8),
                          bottomRight: Radius.circular(10.8),
                        ),
                        child: Image.asset('assets/images/Museum_budaya.png',
                            //width: 100,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, top: 8, right: 50, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PilihanMuseum_sejarah()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.8),
                          topRight: Radius.circular(10.8),
                          bottomLeft: Radius.circular(10.8),
                          bottomRight: Radius.circular(10.8),
                        ),
                        child: Image.asset('assets/images/Museum_sejarah.png',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
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
