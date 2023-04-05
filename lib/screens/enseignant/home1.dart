import 'package:flutter/material.dart';
import 'package:foft/api/AuthServiceEnseignant.dart';
import 'package:foft/api/FicheEnseignantService.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';
import 'package:foft/screens/fiche_attente.dart';
import 'package:provider/provider.dart';

class HomeEnseignent extends StatefulWidget {
  HomeEnseignent({Key? key}) : super(key: key);

  @override
  State<HomeEnseignent> createState() => _HomeEnseignentState();
}

class _HomeEnseignentState extends State<HomeEnseignent> {
  Future<void> refrech() async {
    context
        .read<FicheEnseignantService>()
        .FicheAttente(context.read<AuthEnseignantService>().user!.id, 0);
  }

  @override
  void initState() {
    super.initState();
    context
        .read<FicheEnseignantService>()
        .FicheAttente(context.read<AuthEnseignantService>().user!.id, 0);
    context
        .read<FicheEnseignantService>()
        .Ficherejeter(context.read<AuthEnseignantService>().user!.id, 2);
    context
        .read<FicheEnseignantService>()
        .Fichevalider(context.read<AuthEnseignantService>().user!.id, 1)
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthEnseignantService>();
    final fiche = context.watch<FicheEnseignantService>();
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<AuthEnseignantService>().logout();
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.red,
                  )),
            ],
            backgroundColor: whiteColor,
            title: RichText(
                text: TextSpan(
                    children: [
                  TextSpan(
                      text: auth.user!.nom!,
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
              Text("fiches en Encour",
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
                    fiche.ficheattente.length,
                    (index) => CardFiche(
                          fiche: fiche.ficheattente[index],
                          isEnsignant: true,
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
