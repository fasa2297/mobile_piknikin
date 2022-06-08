import 'package:flutter/material.dart';
import 'package:mobile_piknikin/detailmuseum.dart';

class PilihanMuseum_seni extends StatefulWidget {
  const PilihanMuseum_seni({super.key});
  @override
  _PilihanMuseum_seni createState() => _PilihanMuseum_seni();
}

class _PilihanMuseum_seni extends State<PilihanMuseum_seni> {
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
                'Museum Seni',
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
                        child: Image.asset('assets/images/museum_affandi.jpeg',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Monumen Affandi'),
                        subtitle: Text(
                            'Salah satu museum seni di DIY yang berada di tepi Sungai Gajah Wong ini menyimpan berbagai macam lukisan karya Affandi.'),
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
                            'assets/images/museum_jogja_gallery.jpeg',
                            // width: 300,
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Museum Jogja Gallery'),
                        subtitle: Text(
                            'Jogja Gallery adalah sebuah galeri seni visual sebagai wahana yang strategis untuk menampilkan aneka hasil karya seni.'),
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
                            Image.asset('assets/images/museum_sangkring.jpeg',
                                // width: 300,
                                height: 150,
                                fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text('Sangkring Art Space'),
                        subtitle: Text(
                            'Ruang alternatif yang mengedepankan laku proyek seni eksperimental seniman dari berbagai latar belakang, termasuk usia dan disiplin ilmu.'),
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
