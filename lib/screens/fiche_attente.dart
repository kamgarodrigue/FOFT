import 'package:flutter/material.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/FicheService.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';
import 'package:provider/provider.dart';

class Fiche_attente extends StatefulWidget {
  Fiche_attente({Key? key}) : super(key: key);

  @override
  State<Fiche_attente> createState() => _Fiche_attenteState();
}

class _Fiche_attenteState extends State<Fiche_attente> {
  Future<void> refrech() async {
    context
        .read<FicheService>()
        .FicheAttente(context.read<AuthService>().user!.id, 0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<FicheService>()
        .FicheAttente(context.read<AuthService>().user!.id, 0)
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final fiche = context.watch<FicheService>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kBlack),
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: false,
        title: Text("fiches en attente",
            style: TextStyle(
                color: kBlack, fontSize: 16, fontFamily: 'ComRegular.')),
      ),
      body: RefreshIndicator(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: List.generate(
              fiche.ficheattente.length,
              (index) => CardFiche(
                    isEnsignant: false,
                    fiche: fiche.ficheattente[index],
                    ismodifier: true,
                    isrejet: false,
                  )),
        ),
        onRefresh: () => refrech(),
      ),
    );
  }
}
