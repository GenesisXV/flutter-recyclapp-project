import 'package:flutter/cupertino.dart';

class Actualite {
  // late List<String> images;
  late String title;
  late String imageUrl;
  late String description;
  late String contenu;
  late String date;

  Actualite(
      this.title, this.imageUrl, this.description, this.contenu, this.date);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'decription': description,
      'contenu': contenu,
      'date': date
    };
  }

  factory Actualite.fromMap(Map<String, dynamic> map) => Actualite(
        map['title'],
        map['imageUrl'],
        map['description'],
        map['contenu'],
        map['date'],
      );
}
