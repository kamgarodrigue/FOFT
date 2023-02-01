import 'dart:io';

import 'package:dio/dio.dart' as Dio;

import 'package:flutter/cupertino.dart';
import 'package:foft/api/DioClient.dart';
import 'package:foft/modal/enseignant.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthEnseignantService extends ChangeNotifier {
  Future<SharedPreferences> sharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref;
  }

  Enseignant? _localClient;
  Enseignant? get user => _localClient;
  bool _isLoggedIn = false;
  bool get authenticate {
    sharedPreferences().then((value) {
      _isLoggedIn = value.getString("user") == null ? false : true;
      if (_isLoggedIn) {
        //logout();
        //print(json.decode(value.getString("user").toString()));

        _localClient =
            Enseignant.fromJson(json.decode(value.getString("user")!));
      }
      // print(json.decode(value.getString("user")!));
      notifyListeners();
    });
    return this._isLoggedIn;
  }

  Future login(String email, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get(
      "enseignant/$email/$password",
    );
    //print(response);
    print(response);
    pref.setString("user", response.toString());
    return response;
  }

  Future<void> getuser(String? id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("http://192.168.132.171:8080/clients/id/$id");
    Dio.Response response = await dio().get(
      "clients/id/$id",
    );

    //print(response);
    print(response);
    pref.setString("user", response.toString());
  }

  Future getUserById(String id) async {
    Map data = {
      "userID": id,
    };

    Dio.Response response = await dio().post("users/show", data: data);

    return response.data;
  }

  Future register(Enseignant delegue) async {
    print(delegue.toJson());
    Dio.Response response = await dio().post("clients", data: delegue.toJson());
    print(response);
    return response;
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("user");
    notifyListeners();
  }
}
