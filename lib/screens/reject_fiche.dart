import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/AuthServiceEnseignant.dart';
import 'package:foft/api/FicheService.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';
import 'package:foft/screens/fiche_attente.dart';
import 'package:provider/provider.dart';

class RejectFiche extends StatefulWidget {
  RejectFiche({Key? key}) : super(key: key);

  @override
  State<RejectFiche> createState() => _RejectFicheState();
}

class _RejectFicheState extends State<RejectFiche> {
  Future<void> refrech() async {
    context
        .read<FicheService>()
        .Ficherejeter(context.read<AuthService>().user!.id, 2)
        .then((value) => print(value));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<FicheService>()
        .Ficherejeter(context.read<AuthService>().user!.id, 2);
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
                    text: auth.user!.nom.toString(),
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
