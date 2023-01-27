import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';
import 'package:foft/screens/fiche_attente.dart';

class RejectFiche extends StatefulWidget {
  RejectFiche({Key? key}) : super(key: key);

  @override
  State<RejectFiche> createState() => _RejectFicheState();
}

class _RejectFicheState extends State<RejectFiche> {
  Future<void> refrech() async {}

  @override
  Widget build(BuildContext context) {
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
                    text: "kamga rodrigue",
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
                  5,
                  (index) => CardFiche(
                        isEnsignant: false,
                        ismodifier: true,
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
