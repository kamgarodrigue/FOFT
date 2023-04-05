import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foft/api/DioClient.dart';
import 'package:foft/modal/fiche.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class FicheService extends ChangeNotifier {
  List<Fiche> _ficheattente = [];
  List<Fiche> _ficherejeter = [];
  List<Fiche> _fichevalider = [];
  List<Fiche> get ficheattente => _ficheattente;
  List<Fiche> get ficherejeter => _ficherejeter;
  List<Fiche> get fichevalider => _fichevalider;

  Future addFiche(Fiche fiche, imag) async {
    //print(fiche.enseignant.id);
    Map<String, dynamic> data1 = {
      // "id": fiche.id,
      "niveau": fiche.niveau["id"].toString(),
      "semestre": fiche.semestre.toString(),
      "titre": fiche.titre.toString(),
      "date": fiche.date!,
      "heureDebut": fiche.heureDebut!,
      "heureFin": fiche.heureFin!,
      "totalHoraire": fiche.totalHoraire!,
      "contenu": fiche.contenu!,
      // "motif": fiche.motif,

      // "signatureEnseignant": fiche.signatureEnseignant,
      //"state": fiche.state,
      "enseignant": fiche.enseignant.id.toString(),
      "delegue": fiche.delegue.id.toString(),
      "uniteEnseignement": fiche.ue["id"].toString(),
      "salle": fiche.salle["id"].toString(),
      "specialite": fiche.specialite["id"].toString(),
      "seance": fiche.seance["id"].toString()
    };
    var request =
        http.MultipartRequest("POST", Uri.parse(baseurl + "/createFiche"));
    request.files.add(await http.MultipartFile.fromBytes(
      "signatureDelegue",
      imag,
      filename: "${fiche.enseignant.nom}signature.png",
      contentType: MediaType("image", "png"),
    ));

    request.fields.addAll(data1.cast<String, String>());
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final Responsedata = json.decode(responsed.body);
    print(Responsedata.toString());

    return responsed.body;
  }

  Future getFiche(iddelegue, state) async {
    print(iddelegue.toString() + state.toString());
    Dio.Response response = await dio().get(
      "fichedelegueandstate/$iddelegue/$state",
    );
    _fichevalider = decodeList(response.data);

    notifyListeners();
    return response;
  }

  Future Updatefiche(Fiche fiche) async {
    Dio.Response response =
        await dio().put("Fiche/${fiche.id}", data: fiche.toJson());
    print(response);
    return response;
  }

  Future Fichevalider(iddelegue, state) async {
    print(iddelegue.toString() + state.toString());
    Dio.Response response = await dio().get(
      "fichedelegueandstate/$iddelegue/$state",
    );
    _fichevalider = decodeList(response.data);

    notifyListeners();
    return response;
  }

  Future FicheAttente(iddelegue, state) async {
    print(iddelegue.toString() + state.toString());
    Dio.Response response = await dio().get(
      "fichedelegueandstate/$iddelegue/$state",
    );
    print(response.data);
    _ficheattente = decodeList(response.data);
    notifyListeners();
    return response;
  }

  Future Ficherejeter(iddelegue, state) async {
    print(iddelegue.toString() + state.toString());
    Dio.Response response = await dio().get(
      "fichedelegueandstate/$iddelegue/$state",
    );
    _ficherejeter = decodeList(response.data);
    notifyListeners();
    return response;
  }

  List<Fiche> decodeList(responseBody) {
    final parsed = responseBody;
    // print(parsed);
    return parsed.map<Fiche>((json) => Fiche.fromJson(json)).toList();
  }
}
