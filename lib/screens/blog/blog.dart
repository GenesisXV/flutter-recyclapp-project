import 'package:flutter/material.dart';
import 'package:recyclapp_v1/utils/constants.dart';
import 'package:recyclapp_v1/utils/favoriteWidget.dart';

import 'actualite.dart';

class BlogPage extends StatefulWidget {
  const BlogPage();

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
        backgroundColor: colorOne,
      ),
      body: ListView(
        children: [
          ActualiteItems(Actualite(
            "Togo/Mécanisme forêts et paysans : 10\n fermes agro écologiques ciblées",
            "images/article1.jpg",
            "La formation  mise en œuvre par la Coordination \ntogolaise des organisations paysannes et \nde producteurs agricoles (CTOP) en collaboration,avec le Réseau...\n",
            "Togo/Mécanisme forêts et paysans : 10 fermes agro écologiques ciblées\nLa formation  mise en œuvre par la Coordination togolaise des organisations paysannes et de producteurs agricoles (CTOP) en collaboration avec le Réseau des jeunes producteurs et professionnels agricoles du Togo (REJAPPAT) se déroulera dans 10 fermes agroécologique ciblées par le REJEPPAT dans la région centrale, a t-on appris. Les fermes sont notamment Essowereou, Capable-plus, Albarka, Ma joie, Pirenadou, Sath Agro Business, N’nakpeboni, Pain de vie, Teoufama et Togo food. \n\n2ème du genre, l’initiative, placée sous le thème :» appui aux organisations des producteurs forestiers et agricoles dans le cadre du Mécanisme forêts et paysans-FFF au Togo’, a été lancée à Tchavadè, elle vise à atteindre le résultat 3 du Mécanisme forêts et paysans (FFF).\n",
            "20/08/21\n",
          )),
          ActualiteItems(Actualite(
            "Plus de gaz à effet de serre rejeté\n dans l’atmosphère",
            "images/article2.jpg",
            "C’est la conclusion alarmante du sixième rapport du Giec,\n le Groupe d’experts intergouvernemental sur l’évolution du climat...\n",
            "Togo/Mécanisme forêts et paysans : 10 fermes agro écologiques ciblées\nLa formation  mise en œuvre par la Coordination togolaise des organisations paysannes et de producteurs agricoles (CTOP) en collaboration avec le Réseau des jeunes producteurs et professionnels agricoles du Togo (REJAPPAT) se déroulera dans 10 fermes agroécologique ciblées par le REJEPPAT dans la région centrale, a t-on appris. Les fermes sont notamment Essowereou, Capable-plus, Albarka, Ma joie, Pirenadou, Sath Agro Business, N’nakpeboni, Pain de vie, Teoufama et Togo food. \n\n2ème du genre, l’initiative, placée sous le thème :» appui aux organisations des producteurs forestiers et agricoles dans le cadre du Mécanisme forêts et paysans-FFF au Togo’, a été lancée à Tchavadè, elle vise à atteindre le résultat 3 du Mécanisme forêts et paysans (FFF).\n",
            "20/08/21\n",
          )),
          ActualiteItems(Actualite(
            "Togo/Mécanisme forêts et paysans : 10\n fermes agro écologiques ciblées",
            "images/article1.jpg",
            "La formation  mise en œuvre par la Coordination \ntogolaise des organisations paysannes et de\n producteurs agricoles (CTOP) en collaboration,avec le Réseau...\n",
            "Togo/Mécanisme forêts et paysans : 10 fermes agro écologiques ciblées\nLa formation  mise en œuvre par la Coordination togolaise des organisations paysannes et de producteurs agricoles (CTOP) en collaboration avec le Réseau des jeunes producteurs et professionnels agricoles du Togo (REJAPPAT) se déroulera dans 10 fermes agroécologique ciblées par le REJEPPAT dans la région centrale, a t-on appris. Les fermes sont notamment Essowereou, Capable-plus, Albarka, Ma joie, Pirenadou, Sath Agro Business, N’nakpeboni, Pain de vie, Teoufama et Togo food. \n\n2ème du genre, l’initiative, placée sous le thème :» appui aux organisations des producteurs forestiers et agricoles dans le cadre du Mécanisme forêts et paysans-FFF au Togo’, a été lancée à Tchavadè, elle vise à atteindre le résultat 3 du Mécanisme forêts et paysans (FFF).\n",
            "20/08/21\n",
          )),
          ActualiteItems(Actualite(
            "Togo/Mécanisme forêts et paysans : 10\n fermes agro écologiques ciblées",
            "images/article4.jpg",
            "La formation  mise en œuvre par la Coordination \ntogolaise des organisations paysannes et de\n producteurs agricoles (CTOP) en collaboration,avec le Réseau...\n",
            "Togo/Mécanisme forêts et paysans : 10 fermes agro écologiques ciblées\nLa formation  mise en œuvre par la Coordination togolaise des organisations paysannes et de producteurs agricoles (CTOP) en collaboration avec le Réseau des jeunes producteurs et professionnels agricoles du Togo (REJAPPAT) se déroulera dans 10 fermes agroécologique ciblées par le REJEPPAT dans la région centrale, a t-on appris. Les fermes sont notamment Essowereou, Capable-plus, Albarka, Ma joie, Pirenadou, Sath Agro Business, N’nakpeboni, Pain de vie, Teoufama et Togo food. \n\n2ème du genre, l’initiative, placée sous le thème :» appui aux organisations des producteurs forestiers et agricoles dans le cadre du Mécanisme forêts et paysans-FFF au Togo’, a été lancée à Tchavadè, elle vise à atteindre le résultat 3 du Mécanisme forêts et paysans (FFF).\n",
            "20/08/21\n",
          )),
          ActualiteItems(Actualite(
            "Togo/Mécanisme forêts et paysans : 10\n fermes agro écologiques ciblées",
            "images/article5.jpg",
            "La formation  mise en œuvre par la Coordination\n togolaise des organisations paysannes et de\n producteurs agricoles (CTOP) en collaboration,avec le Réseau...\n",
            "Togo/Mécanisme forêts et paysans : 10 fermes agro écologiques ciblées\nLa formation  mise en œuvre par la Coordination togolaise des organisations paysannes et de producteurs agricoles (CTOP) en collaboration avec le Réseau des jeunes producteurs et professionnels agricoles du Togo (REJAPPAT) se déroulera dans 10 fermes agroécologique ciblées par le REJEPPAT dans la région centrale, a t-on appris. Les fermes sont notamment Essowereou, Capable-plus, Albarka, Ma joie, Pirenadou, Sath Agro Business, N’nakpeboni, Pain de vie, Teoufama et Togo food. \n\n2ème du genre, l’initiative, placée sous le thème :» appui aux organisations des producteurs forestiers et agricoles dans le cadre du Mécanisme forêts et paysans-FFF au Togo’, a été lancée à Tchavadè, elle vise à atteindre le résultat 3 du Mécanisme forêts et paysans (FFF).\n",
            "20/08/21\n",
          )),
          ActualiteItems(Actualite(
            "Plus de gaz à effet de serre rejeté\n dans l’atmosphère",
            "images/article2.jpg",
            "C’est la conclusion alarmante du sixième rapport du Giec,\n le Groupe d’experts intergouvernemental sur l’évolution du climat...\n",
            "Togo/Mécanisme forêts et paysans : 10 fermes agro écologiques ciblées\nLa formation  mise en œuvre par la Coordination togolaise des organisations paysannes et de producteurs agricoles (CTOP) en collaboration avec le Réseau des jeunes producteurs et professionnels agricoles du Togo (REJAPPAT) se déroulera dans 10 fermes agroécologique ciblées par le REJEPPAT dans la région centrale, a t-on appris. Les fermes sont notamment Essowereou, Capable-plus, Albarka, Ma joie, Pirenadou, Sath Agro Business, N’nakpeboni, Pain de vie, Teoufama et Togo food. \n\n2ème du genre, l’initiative, placée sous le thème :» appui aux organisations des producteurs forestiers et agricoles dans le cadre du Mécanisme forêts et paysans-FFF au Togo’, a été lancée à Tchavadè, elle vise à atteindre le résultat 3 du Mécanisme forêts et paysans (FFF).\n",
            "20/08/21\n",
          )),
          ActualiteItems(Actualite(
            "Togo/Mécanisme forêts et paysans : 10\n fermes agro écologiques ciblées",
            "images/article1.jpg",
            "La formation  mise en œuvre par la Coordination \ntogolaise des organisations paysannes et de\n producteurs agricoles (CTOP) en collaboration,avec le Réseau...\n",
            "Togo/Mécanisme forêts et paysans : 10 fermes agro écologiques ciblées\nLa formation  mise en œuvre par la Coordination togolaise des organisations paysannes et de producteurs agricoles (CTOP) en collaboration avec le Réseau des jeunes producteurs et professionnels agricoles du Togo (REJAPPAT) se déroulera dans 10 fermes agroécologique ciblées par le REJEPPAT dans la région centrale, a t-on appris. Les fermes sont notamment Essowereou, Capable-plus, Albarka, Ma joie, Pirenadou, Sath Agro Business, N’nakpeboni, Pain de vie, Teoufama et Togo food. \n\n2ème du genre, l’initiative, placée sous le thème :» appui aux organisations des producteurs forestiers et agricoles dans le cadre du Mécanisme forêts et paysans-FFF au Togo’, a été lancée à Tchavadè, elle vise à atteindre le résultat 3 du Mécanisme forêts et paysans (FFF).\n",
            "20/08/21\n",
          )),
        ],
      ),
    );
  }
}

class ActualiteItems extends StatelessWidget {
  final Actualite actu;

  const ActualiteItems(@required this.actu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsActualite(actu)));
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Card(
          margin: EdgeInsets.all(5),
          elevation: 5,
          child: Row(
            children: [
              Hero(
                  tag: "article" + actu.title,
                  child: Image(
                    image: AssetImage(actu.imageUrl),
                    width: 100,
                    height: 100,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      actu.title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: colorOne),
                    ),
                    Text(
                      '${actu.date}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      actu.description,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsActualite extends StatelessWidget {
  final Actualite actu;
  const DetailsActualite(@required this.actu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actus"),
        backgroundColor: colorOne,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Hero(
              tag: "article" + actu.title,
              child: Image(
                image: AssetImage(actu.imageUrl),
                width: 100,
                height: 300,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Titre: " + actu.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colorOne),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Date: " + '${actu.date}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  actu.contenu,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "J'aime",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                FavoriteWidget(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
