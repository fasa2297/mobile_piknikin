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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$page3 Page', style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
            onPressed: () => changePage(0),
            child: const Text('Switch to Home Page'),
          )
        ],
      ),
    );
  }
}
