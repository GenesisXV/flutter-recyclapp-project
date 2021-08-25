import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recyclapp_v1/screens/gestionAchat/achat_home.dart';
import 'package:recyclapp_v1/screens/gestionAchat/article.dart';
import 'package:recyclapp_v1/services/Database/database_helper.dart';
import 'package:recyclapp_v1/utils/constants.dart';
import 'package:recyclapp_v1/utils/getImage.dart';

class VenteHome extends StatefulWidget {
  const VenteHome({Key? key}) : super(key: key);

  @override
  _VenteHomeState createState() => _VenteHomeState();
}

class _VenteHomeState extends State<VenteHome> {
  static String IMAGE_URL = '';

  final key = GlobalKey<FormState>();
  final categorieController = TextEditingController();
  final descriptionController = TextEditingController();
  final prixController = TextEditingController();
  final quantiteController = TextEditingController();

  late String categorie, description, prix, quantite;
  List<File> images = [];

  @override
  void dispose() {
    categorieController.dispose();
    descriptionController.dispose();
    prixController.dispose();
    quantiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Poster un Article"),
          backgroundColor: colorOne,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
                    onChanged: (e) => categorie = e,
                    controller: categorieController,
                    decoration: InputDecoration(
                        hintText: "Categorie du Produit",
                        labelText: "Categorie ",
                        helperStyle: TextStyle(color: colorOne),
                        focusColor: colorOne,
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
                    onChanged: (e) => prix = e,
                    controller: prixController,
                    decoration: InputDecoration(
                        hintText: "Prix du Produit",
                        labelText: "Prix ",
                        helperStyle: TextStyle(color: colorOne),
                        focusColor: colorOne,
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
                    onChanged: (e) => quantite = e,
                    controller: quantiteController,
                    decoration: InputDecoration(
                        hintText: "Quantite de Produit",
                        labelText: "Quantite ",
                        helperStyle: TextStyle(color: colorOne),
                        focusColor: colorOne,
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
                    onChanged: (e) => description = e,
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Description du Produit",
                        labelText: "Description ",
                        helperStyle: TextStyle(color: colorOne),
                        focusColor: colorOne,
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4)),
                          margin: const EdgeInsets.only(right: 5, bottom: 5),
                          height: 70,
                          width: 70,
                          child: Stack(
                            children: [
                              Image.file(
                                images[i],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.minusCircle,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      images.removeAt(i);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      InkWell(
                        onTap: () async {
                          final data = await showModalBottomSheet(
                              context: context,
                              builder: (ctx) {
                                return GetImage();
                              });
                          setState(() {
                            images.add(data);
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          color: colorOne,
                          child: const Icon(FontAwesomeIcons.plusCircle),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          IMAGE_URL = "images/" +
                              categorieController.value.text.toLowerCase() +
                              ".jpg";
                          Article article = Article(
                            categorieController.value.text,
                            IMAGE_URL,
                            categorieController.value.text,
                            int.parse(prixController.value.text),
                            int.parse(quantiteController.value.text),
                            descriptionController.value.text,
                          );
                          DatabaseHelper().insertArticle(article);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AchatHome()));
                        }
                      },
                      child: const Text("Enregistrer",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (States) => colorOne),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      side: BorderSide(color: colorOne)))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
