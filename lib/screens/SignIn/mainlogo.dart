import 'package:flutter/material.dart';

Widget mainLogo() {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: new RawMaterialButton(
            onPressed: () {},
            child: Image(
              width: 300,
              height: 100,
              image: AssetImage("images/lp1.png"),
            ),
            elevation: 2.0,
            padding: const EdgeInsets.all(38.0),
          ),
        ),
      ],
    ),
  );
}
