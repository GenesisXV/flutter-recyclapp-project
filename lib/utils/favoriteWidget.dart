import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool like = true;
  int nbrLike = 55;
  _toggleFavorite() {
    setState(() {
      if (like == true) {
        like = false;
        nbrLike -= 1;
      } else {
        like = true;
        nbrLike += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        icon: like ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        color: Colors.red,
        onPressed: _toggleFavorite,
      ),
      Text("$nbrLike")
    ]);
  }
}
