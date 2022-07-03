// Nama : Muh Akib A Yani
// NIM  : 1301194233

import 'package:flutter/material.dart';
import 'package:mobile_piknikin/katagorimuseum.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/Bg-landingpage.jpg"),
          ),
        ),
        child: Scaffold(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            // resizeToAvoidBottomInset: false,
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        'Piknikin di Museum',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        'Pecinta seni? Piknikin aja..',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.all(5),
                      width: 250,
                      height: 45,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xffF18265),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const KatagoriMuseum()),
                            );
                          },
                          child: Text(
                            "Yuk eksplor museum!",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffffffff),
                            ),
                          )))
                ]))));
  }
}

                        /*
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
                          primary: Color.fromARGB(255, 101, 101, 101),

                          /*side: BorderSide(
                              width: 3,
                              color: Color.fromARGB(
                                  255, 203, 170, 116)), */ //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(20),
                          textStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22,
                          ),
                        ),
                      )),*/
                
