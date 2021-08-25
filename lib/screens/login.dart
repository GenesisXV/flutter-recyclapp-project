import 'package:flutter/material.dart';
import 'package:recyclapp_v1/screens/register.dart';
import 'package:recyclapp_v1/services/auth.dart';
import 'package:recyclapp_v1/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthServices auth = AuthServices();
  late String email, password;
  final keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: keys,
            child: Column(
              children: [
                Text(
                  "Login",
                  style: style,
                ),
                SizedBox(
                  height: 15,
                ),
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
                      hintText: "************", labelText: "mot de passe"),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (keys.currentState!.validate()) {
                          bool login = await auth.signin(email, password);
                          if (!login) print("email ou mot de passe incorrects");
                        }
                      },
                      child: Text("Log", style: TextStyle(fontSize: 20)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green[900]))),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Avez-vous un compte?",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "enregistrer",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
