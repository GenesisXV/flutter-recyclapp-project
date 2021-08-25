import 'package:flutter/material.dart';
import 'package:recyclapp_v1/utils/constants.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique"),
        backgroundColor: colorOne,
      ),
      body: Center(
        child: Text(
          "No Data",
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
