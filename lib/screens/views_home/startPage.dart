import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclapp_v1/main.dart';
import 'package:recyclapp_v1/screens/userControl.dart';
import 'package:recyclapp_v1/utils/constants.dart';
import 'package:recyclapp_v1/utils/delayed_animation.dart';

List texte = [
  "\t\t\tBienvenue sur Recyclapp",
  "\t\t\tLe recyclage facile,\nLe recyclage autrement",
  "\t\t\tCommencons!"
];
List images = ['images/s1.png', 'images/s2.png', 'images/s3.png'];

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: IntroContainer());
  }
}

class IntroContainer extends StatefulWidget {
  @override
  _IntroContainerState createState() => _IntroContainerState();
}

class _IntroContainerState extends State<IntroContainer> {
  int _nextIndex = 0;

  void initSate() {
    _nextIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (_nextIndex < 2) {
              _nextIndex += 1;
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserControl()));
            }
          });
        },
        child: Column(children: [
          DelayedAnimation(
            delay: 1000,
            child: Container(
              height: 550,
              child: Image.asset(images[_nextIndex]),
            ),
          ),
          DelayedAnimation(
            delay: 2000,
            child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      texte[_nextIndex],
                      style: GoogleFonts.poppins(
                          color: colorOne,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          ),
        ]));
  }
}
