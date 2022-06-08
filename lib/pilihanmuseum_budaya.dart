import 'package:flutter/material.dart';
import 'package:mobile_piknikin/detailmuseum.dart';

class PilihanMuseum_budaya extends StatefulWidget {
  const PilihanMuseum_budaya({super.key});
  @override
  _PilihanMuseum_budaya createState() => _PilihanMuseum_budaya();
}

class _PilihanMuseum_budaya extends State<PilihanMuseum_budaya> {
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
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 5, 0),
              /*kiri */
              child: Text(
                'Museum Budaya',
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
                    MaterialPageRoute(builder: (context) => DetailMuseum()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset('assets/images/keratonjogja.jpg',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Museum Keraton Yogyakarta'),
                        subtitle: Text(
                            'Museum Keraton Yogyakarta bernuansa budaya Jawa dengan daya tarik utama Karaton Kasultanan Ngayogyakarta Hadiningrat.'),
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
                    MaterialPageRoute(builder: (context) => DetailMuseum()),
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
                            'assets/images/Museum_batik_yogyakarta.jpeg',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Museum Batik Yogyakarta'),
                        subtitle: Text(
                            'Museum ini mendapatkan sertifikat dari UNESCO sebagai warisan kultural dunia. Keberadaan museum Batik Yogyakarta ini telah mengangkat derajat kota Yogyakarta dengan diberikannya nama Kota Batik.'),
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
                    MaterialPageRoute(builder: (context) => DetailMuseum()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child:
                            Image.asset('assets/images/museum_sonobudoyo.jpeg',
                                // width: 300,
                                height: 150,
                                fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Museum Sonobudoyo'),
                        subtitle: Text(
                            'Museum ini menyimpan koleksi mengenai budaya dan sejarah Jawa yang dianggap paling lengkap setelah Museum Nasional Republik Indonesia di Jakarta.'),
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
