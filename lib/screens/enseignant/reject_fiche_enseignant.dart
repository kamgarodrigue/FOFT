import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/AuthServiceEnseignant.dart';
import 'package:foft/api/FicheEnseignantService.dart';
import 'package:foft/api/FicheService.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';
import 'package:foft/screens/fiche_attente.dart';
import 'package:provider/provider.dart';

class RejectFicheEnseignant extends StatefulWidget {
  RejectFicheEnseignant({Key? key}) : super(key: key);

  @override
  State<RejectFicheEnseignant> createState() => _RejectFicheEnseignantState();
}

class _RejectFicheEnseignantState extends State<RejectFicheEnseignant> {
  Future<void> refrech() async {
    context
        .read<FicheEnseignantService>()
        .Ficherejeter(context.read<AuthEnseignantService>().user!.id, 2)
        .then((value) => print(value));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<FicheService>()
        .Ficherejeter(context.read<AuthEnseignantService>().user!.id, 2);
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
            /*
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
            ) */
          ],
          backgroundColor: whiteColor,
          title: RichText(
              text: TextSpan(
                  children: [
                TextSpan(
                    text: auth.user!.nom,
                    style: TextStyle(
                        color: kLinckColor, fontSize: 17, fontFamily: 'Medium'))
              ],
                  text: "Salut ! ",
                  style: TextStyle(
                      color: kBlack, fontSize: 17, fontFamily: 'Medium')))),
      body: RefreshIndicator(
        color: kLinckColor,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text("fiches Rejetés",
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
                  fiche.ficherejeter.length,
                  (index) => CardFiche(
                        isEnsignant: false,
                        fiche: fiche.ficherejeter[index],
                        ismodifier: false,
                        isrejet: true,
                      )),
            )
          ],
        ),
        onRefresh: () => refrech(),
      ),
    );
  }
}
