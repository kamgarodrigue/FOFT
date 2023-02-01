import 'package:foft/modal/delegue.dart';
import 'package:foft/modal/enseignant.dart';

class Fiche {
  String? id,
      titre,
      date,
      heureDebut,
      heureFin,
      totalHoraire,
      contenu,
      motif,
      signatureDelegue,
      signatureEnseignant,
      state,
      semestre;
  Map niveau, salle, ue, specialite, seance;
  Enseignant enseignant;
  Delegue delegue;
  Fiche(
      {required this.contenu,
      required this.seance,
      required this.specialite,
      required this.date,
      required this.delegue,
      required this.enseignant,
      required this.heureDebut,
      required this.heureFin,
      required this.id,
      required this.motif,
      required this.semestre,
      required this.signatureDelegue,
      required this.signatureEnseignant,
      required this.state,
      required this.titre,
      required this.totalHoraire,
      required this.niveau,
      required this.salle,
      required this.ue});
  factory Fiche.fromJson(Map<String, dynamic> json) => Fiche(
      seance: json["seance"],
      niveau: json["niveau"],
      specialite: json["specialite"],
      salle: json["salle"],
      contenu: json["contenu"],
      date: json["date"],
      delegue: Delegue.fromJson(json["delegue"]),
      enseignant: Enseignant.fromJson(json["enseignant"]),
      heureDebut: json["heureDeDebut"],
      heureFin: json["heureDeFin"],
      id: json["id"].toString(),
      motif: json["motif"],
      semestre: json["semestre"],
      signatureDelegue: json["signatureDelegue"],
      signatureEnseignant: json["signatureEnseignant"],
      state: json["state"].toString(),
      titre: json["titre"],
      totalHoraire: json["totalHoraire"],
      ue: json["ue"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "niveau": niveau,
        "semestre": semestre,
        "titre": titre,
        "date": date,
        "heureDeDebut": heureDebut,
        "heureDeFin": heureFin,
        "totalHoraire": totalHoraire,
        "contenu": contenu,
        "motif": motif,
        "signatureDelegue": signatureDelegue,
        "signatureEnseignant": signatureEnseignant,
        "state": state,
        "enseignant": enseignant.toJson(),
        "delegue": delegue.toJson(),
        "ue": ue,
        "salle": salle,
        "specialite": specialite,
        "seance": seance
      };
}
