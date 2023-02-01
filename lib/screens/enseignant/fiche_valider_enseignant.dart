import 'package:flutter/material.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/AuthServiceEnseignant.dart';
import 'package:foft/api/FicheEnseignantService.dart';
import 'package:foft/api/FicheService.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';
import 'package:provider/provider.dart';

class FicheValiderEnseignant extends StatefulWidget {
  FicheValiderEnseignant({Key? key}) : super(key: key);

  @override
  State<FicheValiderEnseignant> createState() => _FicheValiderEnseignantState();
}

class _FicheValiderEnseignantState extends State<FicheValiderEnseignant> {
  Future<void> refrech() async {
    context
        .read<FicheEnseignantService>()
        .Fichevalider(context.read<AuthEnseignantService>().user!.id, 1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        iconTheme: IconThemeData(color: kBlack),
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: false,
        title: Text("Fiches Validées",
            style: TextStyle(
                color: kBlack, fontSize: 16, fontFamily: 'ComRegular.')),
      ),
      body: RefreshIndicator(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: List.generate(
              fiche.fichevalider.length,
              (index) => CardFiche(
                    isEnsignant: false,
                    fiche: fiche.fichevalider[index],
                    ismodifier: true,
                    isrejet: false,
                  )),
        ),
        onRefresh: () => refrech(),
      ),
    );
  }
}
