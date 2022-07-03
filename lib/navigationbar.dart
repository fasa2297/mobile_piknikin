// Nama : Anindika Riska Intan Fauzy
// NIM  : 1301194254

// Nama : Zahra Fadiah Putri
// NIM  : 1301194212

import 'package:flutter/material.dart';
import 'package:mobile_piknikin/detailmuseum.dart';
import 'package:mobile_piknikin/pesantiket.dart';
import 'package:mobile_piknikin/pilihanmuseum_seni.dart';
import 'package:mobile_piknikin/pilihanmuseum_budaya.dart';
import 'package:mobile_piknikin/pilihanmuseum_sejarah.dart';
import 'package:mobile_piknikin/katagorimuseum.dart';

void main() {
  runApp(const Navbarr());
}

const String page1 = "Detail Museum";
const String page2 = "Katagori Museum";
const String page3 = "Tentang Piknikin";
const String title = "Demo";

class Navbarr extends StatelessWidget {
  const Navbarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 = const Page1();
    _page2 = const Page2();
    _page3 = Page3(changePage: _changeTab);
    _pages = [_page1, _page2, _page3];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: page1,
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: page2,
              icon: Icon(Icons.home_repair_service),
            ),
            BottomNavigationBarItem(
              label: page3,
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailMuseum();
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KatagoriMuseum();
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Informasi Tentang',
              style: Theme.of(context).textTheme.headline6),
          Container(
            margin: EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 0),
            child: Image.asset('assets/images/Logo.png',
                fit: BoxFit.contain, height: 32),
          ),
          ListTile(
            title: Text(
              '\n Piknikin merupakan aplikasi berbasis mobile yang dapat digunakan untuk melihat berbagai macam museum yang berada di Daerah Istimewa Yogyakarta. Pada aplikasi ini juga dapat digunakan untuk memesan tiket museum yang Anda inginkan, sehingga Anda tidak perlu khawatir jika kehabisan tiket museum tersebut.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              '\n Developed by Kelompok 2 \n Fauzi Arya Surya A \n Anindika Riska Intan Fauzy \n Muh Akib A. Yani \n Zahra Fadiah Putri',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
