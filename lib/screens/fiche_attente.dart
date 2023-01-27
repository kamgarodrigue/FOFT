import 'package:flutter/material.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/card_fiche.dart';

class Fiche_attente extends StatefulWidget {
  Fiche_attente({Key? key}) : super(key: key);

  @override
  State<Fiche_attente> createState() => _Fiche_attenteState();
}

class _Fiche_attenteState extends State<Fiche_attente> {
  Future<void> refrech() async {}
  @override
  Widget build(BuildContext context) {
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
              5,
              (index) => CardFiche(
                    isEnsignant: false,
                    ismodifier: true,
                    isrejet: false,
                  )),
        ),
        onRefresh: () => refrech(),
      ),
    );
  }
}
