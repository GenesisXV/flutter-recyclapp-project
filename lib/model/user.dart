class UserModel {
  String id, nom, prenom, email;
  UserModel(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.email});
  factory UserModel.fromJson(Map<String, dynamic> j) => UserModel(
      id: j['id'], nom: j['nom'], prenom: j['prenom'], email: j['email']);
  Map<String, dynamic> toMap() =>
      {"id": id, "nom": nom, "prenom": prenom, "email": email};
}
