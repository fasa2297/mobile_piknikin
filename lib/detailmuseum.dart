import 'package:flutter/material.dart';
import 'package:mobile_piknikin/pesantiket.dart';
import 'package:mobile_piknikin/pilihanmuseum_seni.dart';
import 'package:mobile_piknikin/pilihanmuseum_budaya.dart';
import 'package:mobile_piknikin/pilihanmuseum_sejarah.dart';

class DetailMuseum extends StatefulWidget {
  const DetailMuseum({Key? key});
  @override
  _DetailMuseum createState() => _DetailMuseum();
}

class _DetailMuseum extends State<DetailMuseum> {
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
                MaterialPageRoute(builder: (context) => PilihanMuseum_budaya()),
              );
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Keraton Yogyakarta',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'oleh Piknikin - 12 Maret 2022',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
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
                        title: Text('Alamat:'),
                        subtitle: Text(
                            'Jl. Rotowijayan, Kadipaten, Kecamatan Kraton, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55132'),
                      ),
                      ListTile(
                        title: Text('Harga Tiket Masuk:'),
                        subtitle: Text('Rp 7.000,00'),
                      ),
                      ListTile(
                        title: Text('Jam Buka:'),
                        subtitle: Text(
                            ' Senin 08.30 - 14.00 \n Selasa 08.30 - 14.00 \n Rabu 08.30 - 14.00 \n Kamis 08.30 - 14.00 \n Jumat 08.30 - 13.00 \n Sabtu 08.30 - 14.00 \n Minggu 08.30 - 14.00'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
              //padding: EdgeInsets.all(8.0),
              child: Text(
                'Museum Keraton Yogyakarta terletak di tengah Kota Yogyakarta. Dekat dengan alun-alun Utara Yogyakarta. Museum ini bernuansa budaya jawa dengan daya tarik utama Karaton Kasultanan Ngayogyakarta Hadiningrat.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
              //padding: EdgeInsets.all(8.0),
              child: Text(
                'Sejarah mencatat bahwa Keraton Yogyakarta telah dibangun sejak masa pemerintahan Sultan Hamengku Buwana I pada 7 Oktober 1756 yang disempurnakan kemudiana oleh para sultan berikutnya. Di masa pemerintahan Sultan HB IX, Kraton dibuka agar masyarakat luas dapat menikmatinya.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
              child: Text(
                'Keraton Yogyakarta yang terletak ditengah kota Yogyakarta ini memiliki beberapa museum, yaitu Museum Lukisan, Museum Sri Sultan Hamengkubuwono IX, Museum Kereta, dan Museum Batik. Di samping itu, hampir seluruh bagian kraton digunakan sebagai tempat penyimpanan benda-benda budaya bernilai termasuk replikanya.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(5),
                width: 50,
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 119, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PesanTiket()),
                      );
                    },
                    child: Text(
                      "Pesan Tiket",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
