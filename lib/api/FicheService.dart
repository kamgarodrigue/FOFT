import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foft/api/DioClient.dart';
import 'package:foft/modal/fiche.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:http_parser/http_parser.dart';

class FicheService extends ChangeNotifier {
  List<Fiche> _ficheattente = [];
  List<Fiche> _ficherejeter = [];
  List<Fiche> _fichevalider = [];
  List<Fiche> get ficheattente => _ficheattente;
  List<Fiche> get ficherejeter => _ficherejeter;
  List<Fiche> get fichevalider => _fichevalider;
  Future addFiche(Fiche fiche, imag) async {
    Dio.FormData data = Dio.FormData.fromMap({
      // "id": fiche.id,
      "niveau": fiche.niveau["id"],
      "semestre": fiche.semestre["id"],
      "titre": fiche.titre,
      "date": fiche.date,
      "heureDebut": fiche.heureDebut,
      "heureFin": fiche.heureFin,
      "totalHoraire": fiche.totalHoraire,
      "contenu": fiche.contenu,
      // "motif": fiche.motif,
      "signatureDelegue": Dio.MultipartFile.fromBytes(
        imag,
        filename: "profil.png",
        contentType: MediaType("image", "png"),
      ),
      // "signatureEnseignant": fiche.signatureEnseignant,
      //"state": fiche.state,
      "enseignant": fiche.enseignant.id,
      "delegue": fiche.delegue.id,
      "uniteEnseignement": fiche.ue["id"],
      "salle": fiche.salle["id"],
    });
    print(data.files);

    Dio.Response response = await dio().post(
      "createFiche",
      data: data,
    );
    // print(response.data.toString());
    return response;
  }
}
