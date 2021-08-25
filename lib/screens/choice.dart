import 'package:flutter/material.dart';
import 'package:recyclapp_v1/utils/constants.dart';

import 'gestionAchat/achat_home.dart';
import 'gestionAchat/vente_home.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  int currentIndex = 0;
  final screens = [
    AchatHome(),
    VenteHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          showUnselectedLabels: false,
          selectedItemColor: colorOne,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.money),
                label: "Achat",
                backgroundColor: Colors.green[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.point_of_sale_outlined),
                label: "Vente",
                backgroundColor: Colors.green[900]),
          ],
        ));
  }
}
