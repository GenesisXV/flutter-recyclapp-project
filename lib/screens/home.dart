import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recyclapp_v1/model/user.dart';
import 'package:recyclapp_v1/screens/gestionAchat/achat_home.dart';
import 'package:recyclapp_v1/screens/userControl.dart';
import 'package:recyclapp_v1/services/Database/database_helper.dart';
import 'package:recyclapp_v1/services/auth.dart';
import 'package:recyclapp_v1/services/db.dart';
import 'package:recyclapp_v1/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();
  late Map<String, dynamic> _useData;

  @override
  void initState() {
    _query();
    super.initState();
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');

    allRows.forEach((row) => print(row));
    setState(() {
      _useData = allRows[0];
    });
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('deleted $rowsDeleted row(s): row $id');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserControl()),
    );
  }

  Widget selectedNews({
    required String titre,
    required String soustitre,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.only(left: 15),
      height: 180,
      width: 260,
      decoration: BoxDecoration(
        gradient: (LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titre, style: TextStyle(fontSize: 22, color: Colors.white)),
          SizedBox(
            height: 5,
          ),
          Text(soustitre, style: TextStyle(fontSize: 19, color: Colors.white70))
        ],
      ),
    );
  }

  Widget selectedExtra({
    required String image,
    required String name,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          Text(name, style: TextStyle(fontSize: 17, color: Colors.white70))
        ],
      ),
    );
  }

  Widget selectedCategory(
      {required Color color,
      required String titre,
      required BoxBorder border,
      required TextStyle textstyle}) {
    return Container(
      height: 45,
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 20),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(7), border: border),
      child: Center(
        child: Text(
          titre,
          style: textstyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: colorOne,
        title: Column(children: [
          Text(
            "Welcome",
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.person,
              size: 12,
            ),
            Padding(padding: EdgeInsets.all(2)),
            Text(
              "user",
              style: TextStyle(fontSize: 18),
            )
          ]),
        ]),
        actions: [
          IconButton(
              onPressed: () async {
                print('delete user');
                _delete();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
          child: Container(
              height: 800,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView(padding: EdgeInsets.only(top: 30), children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    "Liste de News:",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Row(
                      children: [
                        selectedNews(
                            titre: "Article du Jour",
                            soustitre: "La Deforestation"),
                        selectedNews(
                            titre: "Article Semaine",
                            soustitre: "La Gestion des ordures"),
                        selectedNews(
                            titre: "Article Semaine",
                            soustitre: "Noyade à Tsévié")
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Text(
                        "Les articles les plus demandés:",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 300,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.30,
                            children: [
                              selectedExtra(
                                  image: "images/papier.jpg", name: "One"),
                              selectedExtra(
                                  image: "images/plastique.jpg", name: "Two"),
                              selectedExtra(
                                  image: "images/fer.jpg", name: "Three")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          "Selectionner une catégorie:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            selectedCategory(
                                color: colorTwo,
                                titre: "plastique",
                                border: Border.all(color: colorTwo),
                                textstyle: TextStyle(color: Colors.white)),
                            selectedCategory(
                                color: Colors.white,
                                titre: "metal",
                                border: Border.all(color: Colors.grey),
                                textstyle: TextStyle(color: Colors.black)),
                            selectedCategory(
                                color: Colors.white,
                                titre: "papier",
                                border: Border.all(color: Colors.grey),
                                textstyle: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 5, right: 25),
                          child: Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Valider",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => colorOne),
                                  fixedSize: MaterialStateProperty.resolveWith(
                                      (states) => Size.infinite),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(color: colorTwo)))),
                            ),
                          ))
                    ],
                  ),
                )
              ]))),
    );
  }
}
