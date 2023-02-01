import 'package:flutter/material.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/FicheService.dart';
import 'package:foft/api/date.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';
import 'package:foft/screens/fiche_attente.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> refrech() async {
    context
        .read<FicheService>()
        .Fichevalider(context.read<AuthService>().user!.id, 1)
        .then((value) => print(value));
  }

  @override
  void initState() {
    super.initState();
    context
        .read<FicheService>()
        .FicheAttente(context.read<AuthService>().user!.id, 0);
    context
        .read<FicheService>()
        .Ficherejeter(context.read<AuthService>().user!.id, 2);
    context
        .read<FicheService>()
        .Fichevalider(context.read<AuthService>().user!.id, 1)
        .then((value) => print(value));

    context.read<Data>().niveaux();
    context.read<Data>().salles();
    context.read<Data>().seances();
    context.read<Data>().specialites();

    context.read<Data>().enseignants();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final fiche = context.watch<FicheService>();
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<AuthService>().logout();
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.red,
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Fiche_attente(),
                      ));
                },
                child: Image.asset("assets/images/Vector (5).png",
                    color: kLinckColor),
              )
            ],
            backgroundColor: whiteColor,
            title: RichText(
                text: TextSpan(
                    children: [
                  TextSpan(
                      text: "${auth.user!.nom}",
                      style: TextStyle(
                          color: kLinckColor,
                          fontSize: 17,
                          fontFamily: 'Medium'))
                ],
                    text: "Salut ! ",
                    style: TextStyle(
                        color: kBlack, fontSize: 17, fontFamily: 'Medium')))),
        body: RefreshIndicator(
          color: kLinckColor,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text("fiches du jour",
                  style: TextStyle(
                      color: kLinckColor,
                      fontSize: 20,
                      fontFamily: 'Chicle-Regular')),
              SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    fiche.fichevalider.length,
                    (index) => CardFiche(
                          isEnsignant: false,
                          fiche: fiche.fichevalider[index],
                          ismodifier: false,
                          isrejet: false,
                        )),
              )
            ],
          ),
          onRefresh: () => refrech(),
        ));
  }
}
