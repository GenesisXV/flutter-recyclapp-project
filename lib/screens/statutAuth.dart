import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recyclapp_v1/main.dart';
import 'package:recyclapp_v1/screens/home.dart';
import 'package:recyclapp_v1/screens/login.dart';
import 'package:recyclapp_v1/services/auth.dart';

class Statut extends StatefulWidget {
  const Statut({Key? key}) : super(key: key);

  @override
  _StatutState createState() => _StatutState();
}

class _StatutState extends State<Statut> {
  User? user;
  AuthServices auth = AuthServices();
  Future<void> getUser() async {
    final userResult = await auth.user;
    setState(() {
      user = userResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return user == null ? LoginPage() : MainPage();
  }
}
