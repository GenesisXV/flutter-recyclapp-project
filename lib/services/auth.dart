import 'package:firebase_auth/firebase_auth.dart';
import 'package:recyclapp_v1/model/user.dart';
import 'package:recyclapp_v1/services/db.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future signinAnonimous() async {
    try {
      final result = await auth.signInAnonymously();
      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> get user async {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<bool> signup(
      String email, String password, String nom, String prenom) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        await DBServices().saveUser(UserModel(
            id: result.user!.uid, nom: nom, prenom: prenom, email: email));
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signin(String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future signOut() async {
    try {
      return auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
