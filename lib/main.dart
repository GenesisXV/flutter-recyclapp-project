import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:recyclapp_v1/screens/blog/blog.dart';
import 'package:recyclapp_v1/screens/choice.dart';
import 'package:recyclapp_v1/screens/gestionAchat/achat_home.dart';
import 'package:recyclapp_v1/screens/history.dart';
import 'package:recyclapp_v1/screens/home.dart';
import 'package:recyclapp_v1/screens/login.dart';
import 'package:recyclapp_v1/screens/profil.dart';
import 'package:recyclapp_v1/screens/statutAuth.dart';
import 'package:recyclapp_v1/screens/views_home/startPage.dart';
import 'package:recyclapp_v1/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Recyclapp';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: IntroPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    ChoicePage(),
    HistoryPage(),
    BlogPage(),
    ProfilPage()
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
              icon: Icon(Icons.home_outlined),
              label: "Home",
              backgroundColor: Colors.green[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.sell_outlined),
              label: "Transaction",
              backgroundColor: Colors.blue[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: "Historique",
              backgroundColor: Colors.blue[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: "Blog",
              backgroundColor: Colors.purple[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.personal_injury_outlined),
              label: "Personnal",
              backgroundColor: Colors.yellow[900])
        ],
      ),
    );
  }
}
