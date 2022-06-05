import 'package:flutter/material.dart';
import 'package:mobile_piknikin/pilihanmuseum.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    'Piknikin di Museum',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    'Pecinta seni? piknikin aja..',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                  )),
              Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PilihanMuseum()),
                      );
                    },
                    label: Text('Ayo Eksplor Museumnya ->'),
                    icon: Icon(Icons.favorite),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 139, 139, 139),
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 31, 31, 31),
                        fontSize: 22,
                      ),
                    ),
                  )),
            ]))));
  }
}
/*
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Bg-landingpage.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: ElevatedButton(
              child: const Text('Ayo eksplor Museumnya ->'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PilihanMuseum()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
            child: Text(
              "Piknikin di Museum",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
),*/