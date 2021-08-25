import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recyclapp_v1/screens/gestionAchat/article.dart';
import 'package:recyclapp_v1/screens/home.dart';
import 'package:recyclapp_v1/services/Database/database_helper.dart';
import 'package:recyclapp_v1/services/db.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:recyclapp_v1/utils/constants.dart';
import 'package:recyclapp_v1/utils/favoriteWidget.dart';

class AchatHome extends StatefulWidget {
  const AchatHome({Key? key}) : super(key: key);

  @override
  _AchatHomeState createState() => _AchatHomeState();
}

class _AchatHomeState extends State<AchatHome> {
  Future<List<dynamic>>? articleList;

  // Future<List> getAllArticles() async {
  //   List listArticles = [];
  //   try {
  //     await DBServices().articlecollection.get().then(
  //         (QuerySnapshot querySnapshot) =>
  //             querySnapshot.docs.forEach((element) {
  //               listArticles.add(element.data());
  //             }));
  //     return listArticles;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   articleList = getAllArticles();
  // }

  /*fetchArticleList() async {
    dynamic resultat = await DBServices().getAllArticles();
    if (resultat == null) {
      print("Pas de donnes!");
    } else {
      articleList = resultat;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
        backgroundColor: colorOne,
      ),
      /* bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40, bottom: 8),
        child: Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Tout",
                  style: TextStyle(fontSize: 20),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Metal",
                  style: TextStyle(fontSize: 20),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Papier",
                  style: TextStyle(fontSize: 20),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Plastique",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ), */
      body: FutureBuilder<List<Article>>(
          future: DatabaseHelper().articles(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          DatabaseHelper().deleteArticles(article.title);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("${article.title} supprimé")));
                      },
                      background: Container(color: Colors.red),
                      child: ArticleItems(article));
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class ArticleItems extends StatelessWidget {
  final Article article;

  const ArticleItems(@required this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsArticle(article)));
      },
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 5,
        child: Row(
          children: [
            Hero(
                tag: "article" +
                    article.categorie +
                    "${new Random().nextInt(100)}",
                child: Image(
                  image: AssetImage(article.imageUrl),
                  width: 100,
                  height: 100,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900]),
                  ),
                  Text(
                    '${article.prix}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Text(
                    article.description,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsArticle extends StatelessWidget {
  final Article article;
  const DetailsArticle(@required this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Article"),
        backgroundColor: Colors.green[900],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Hero(
              tag: "article" + article.categorie,
              child: Image(
                image: AssetImage(article.imageUrl),
                width: 310,
                height: 250,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categorie: " + article.categorie,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900]),
                ),
                Text(
                  "Prix: " + '${article.prix}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Quantite: " + '${article.quantite}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[900]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description:    " + article.description,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Localisation:    ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("images/carte.jpg"),
                      width: 500,
                      height: 300,
                    ),
                  ],
                ),
                Text(
                  "Contact:   90002500 ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Acheter()));
                      },
                      child: Text("Acheter", style: TextStyle(fontSize: 20)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green[900]))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Acheter extends StatelessWidget {
  const Acheter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 200),
        Text("Choississez votre moyen de payement:",
            style: TextStyle(
              fontSize: 18,
              color: colorTwo,
            )),
        SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("images/tgcel.png"),
              width: 150,
              height: 100,
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Image(
              image: AssetImage("images/flooz.jpg"),
              width: 150,
              height: 100,
            )
          ],
        ),
      ]),
    );
  }
}
