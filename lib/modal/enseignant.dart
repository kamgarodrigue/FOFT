import 'package:foft/modal/delegue.dart';

class Enseignant extends Delegue {
  Enseignant(
      {required super.email,
      required super.id,
      required super.matricule,
      required super.niveau,
      required super.nom,
      required super.password,
      required super.photo});
  factory Enseignant.fromJson(Map<String, dynamic> json) => Enseignant(
      email: json["email"],
      id: json["id"].toString(),
      matricule: json["matricule"].toString(),
      niveau: json["niveau"].toString(),
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
