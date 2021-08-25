import 'package:flutter/cupertino.dart';

class Article {
  // late List<String> images;
  late String title;
  late String imageUrl;
  late String categorie;
  late int prix;
  late int quantite;
  late String description;

  Article(this.title, this.imageUrl, this.categorie, this.prix, this.quantite,
      this.description);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'categorie': categorie,
      'prix': prix,
      'quantite': quantite,
      'description': description
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) => Article(
        map['title'],
        map['imageUrl'],
        map['categorie'],
        map['prix'],
        map['quantite'],
        map['description'],
      );
}
