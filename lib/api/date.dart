import 'package:flutter/material.dart';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;

import 'package:flutter/cupertino.dart';
import 'package:foft/api/DioClient.dart';
import 'package:foft/modal/delegue.dart';
import 'package:foft/modal/enseignant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Data extends ChangeNotifier {
  List _semestre = [];
  List get semestre => _semestre;

  List? _niveau = [];
  List? get niveau => _niveau;

  List? _UE = [];
  List? get UE => _UE;

  List? _specialite = [];
  List? get specialite => _specialite;

  List? _enseignant = [];
  List? get enseignant => _enseignant;

  List? _salle = [];
  List? get salle => _salle;

  List? _seance = [];
  List? get seance => _seance;
  Future semestres() async {
    Dio.Response response = await dio().get(
      "semestres",
    );
    _semestre = decodeList(response.data);
    notifyListeners();
    print("sem " + _semestre.toString());

    return response;
  }

  Future ue(semestre, niveau) async {
    Dio.Response response = await dio().get(
      "uniteEnseignements/$semestre/${niveau}",
    );
    _UE = decodeList(response.data);
    notifyListeners();
    return response;
  }

  Future niveaux() async {
    Dio.Response response = await dio().get(
      "niveaux",
    );
    _niveau = decodeList(response.data);
    notifyListeners();
    return response;
  }

  Future specialites() async {
    Dio.Response response = await dio().get(
      "Specialite",
    );
    _specialite = decodeList(response.data);
    notifyListeners();
    return response;
  }

  Future salles() async {
    Dio.Response response = await dio().get(
      "Salle",
    );
    _salle = decodeList(response.data);
    notifyListeners();
    return response;
  }

  Future enseignants() async {
    Dio.Response response = await dio().get(
      "Enseignant",
    );
    _enseignant = decodeList(response.data);
    notifyListeners();
    return response;
  }

  Future seances() async {
    Dio.Response response = await dio().get(
      "seance",
    );
    _seance = decodeList(response.data);
    notifyListeners();
    return response;
  }

  List decodeList(responseBody) {
    final parsed = responseBody;
    // print(parsed);
    return parsed.map<dynamic>((json) => json).toList();
  }
}
