import 'package:flutter/material.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/AuthServiceEnseignant.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/Input.dart';
import 'package:foft/components/Loader.dart';
import 'package:foft/main.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email, psw;
  bool _isLoading = false;
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: heigth,
          width: widht,
          child: ListView(
            padding: EdgeInsets.only(left: 10, right: 10, top: heigth * .5),
            children: [
              Text(
                "Se Connecter",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kLinckColor,
                    fontSize: 40,
                    fontFamily: "Chicle-Regular"),
              ),
              SizedBox(
                height: 20,
              ),
              Input(
                  onChanged: (value) {
                    email = value;
                  },
                  obscureText: false,
                  isTel: false,
                  hintText: "Nom d’utilisateur",
                  prefixIcon: Icon(
                    Icons.person_outlined,
                    color: kBlack,
                  ),
                  suffixIcon: Text("")),
              SizedBox(
                height: 32,
              ),
              Input(
                  onChanged: (value) {
                    psw = value;
                  },
                  obscureText: visible,
                  isTel: false,
                  hintText: "Mot de passe",
                  prefixIcon: Icon(Icons.lock_outline, color: kBlack),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      icon: visible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off))),
              SizedBox(
                height: 8,
              ),
              Text(
                "J’ai oublié mon mot de passe",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: whiteColor, fontSize: 10, fontFamily: "Regular"),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: kLinckColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Se Connecter",
                    style: TextStyle(
                        color: whiteColor, fontSize: 20, fontFamily: "Bold"),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _isLoading = true;
                  });
                  context
                      .read<AuthEnseignantService>()
                      .login(email!, psw!)
                      .then((value) {
                    print(value);
                    setState(() {
                      _isLoading = false;
                    });
                    showTopSnackBar(
                      context,
                      CustomSnackBar.success(
                        message: "connecté",
                      ),
                    );
                  }).catchError((err) {
                    showTopSnackBar(
                      context,
                      CustomSnackBar.error(
                        message: err.toString(),
                      ),
                    );
                    setState(() {
                      _isLoading = false;
                    });
                  });
                },
              ),
            ],
          ),
        ),
        Container(
            child: _isLoading
                ? Loader(loadingTxt: 'Connexion encour...')
                : Container())
      ],
    ));
  }
}
