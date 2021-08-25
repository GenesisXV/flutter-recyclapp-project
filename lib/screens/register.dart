import 'package:flutter/material.dart';
import 'package:recyclapp_v1/services/auth.dart';
import 'package:recyclapp_v1/utils/constants.dart';

class RegisterPage extends StatelessWidget {
  AuthServices auth = AuthServices();
  late String email, password, cpassword, nom, prenom;
  final keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: keys,
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: style,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.text,
                      onChanged: (e) => nom = e,
                      validator: (e) => e!.isEmpty ? "Champ vide" : null,
                      decoration: InputDecoration(
                          hintText: "Entrez votre nom", labelText: "Nom")),
                  TextFormField(
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.text,
                      onChanged: (e) => prenom = e,
                      validator: (e) => e!.isEmpty ? "Champ vide" : null,
                      decoration: InputDecoration(
                          hintText: "Entrez votre prenom",
                          labelText: "Prenom")),
                  TextFormField(
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (e) => email = e,
                      validator: (e) => e!.isEmpty ? "Champ vide" : null,
                      decoration: InputDecoration(
                          hintText: "Entrez votre email", labelText: "Email")),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    obscureText: true,
                    onChanged: (e) => password = e,
                    validator: (e) => e!.isEmpty
                        ? "Champ vide"
                        : e.length < 6
                            ? "Caractères superieurs à 6"
                            : null,
                    decoration: InputDecoration(
                        hintText: "************", labelText: "Password"),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    obscureText: true,
                    onChanged: (e) => cpassword = e,
                    validator: (e) => e!.isEmpty
                        ? "Champ vide"
                        : e.length < 6
                            ? "Caractères superieurs à 6"
                            : null,
                    decoration: InputDecoration(
                        hintText: "************",
                        labelText: "Confirmation Password"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (keys.currentState!.validate()) {
                          bool register =
                              await auth.signup(email, password, nom, prenom);
                          if (register) Navigator.of(context).pop();
                        }
                      },
                      child: Text("Sign", style: TextStyle(fontSize: 20)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green[900])))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
