import 'package:foft/modal/delegue.dart';

class Enseignant {
  String? id, nom, email, matricule, password, photo;

  Enseignant(
      {required this.email,
      required this.id,
      required this.matricule,
      required this.nom,
      required this.password,
      required this.photo});
  factory Enseignant.fromJson(Map<String, dynamic> json) => Enseignant(
      email: json["email"],
      id: json["id"].toString(),
      matricule: json["matricule"].toString(),
      nom: json["nom"],
      password: json["password"],
      photo: json["photo"].toString());

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "matricule": matricule,
        "nom": nom,
        "password": password,
        "photo": photo
      };
}
