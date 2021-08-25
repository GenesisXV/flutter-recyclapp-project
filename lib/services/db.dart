import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recyclapp_v1/model/user.dart';

class DBServices {
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference articlecollection =
      FirebaseFirestore.instance.collection("articles");

  Future saveUser(UserModel user) async {
    try {
      await usercollection.doc(user.id).set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getUser(String id) async {
    try {
      final DocumentSnapshot data = await usercollection.doc(id).get();
      return data;
    } catch (e) {
      return false;
    }
  }

  /* Future<List?> getAllArticles() async {
    List listArticles = [];
    try {
      await articlecollection.get().then((QuerySnapshot querySnapshot) =>
          querySnapshot.docs.forEach((element) {
            listArticles.add(element.data());
          }));
      return listArticles;
    } catch (e) {
      print(e);
      return null;
    }
  }*/
}
