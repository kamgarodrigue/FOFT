import 'dart:convert';

class Delegue {
  String id, nom, email, matricule, password, photo;
  Map niveau;
  Delegue(
      {required this.email,
      required this.id,
      required this.matricule,
      required this.niveau,
      required this.nom,
      required this.password,
      required this.photo});
  factory Delegue.fromJson(Map<String, dynamic> json) => Delegue(
      email: json["email"],
      id: json["id"].toString(),
      matricule: json["matricule"],
      niveau: json["niveau"],
      nom: json["nom"],
      password: json["password"],
      photo: json["photo"].toString());
  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "matricule": matricule,
        "niveau": niveau,
        "nom": nom,
        "password": password,
        "photo": photo
      };
}
