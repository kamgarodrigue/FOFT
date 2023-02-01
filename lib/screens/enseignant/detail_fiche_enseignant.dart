import 'package:flutter/material.dart';
import 'package:foft/api/DioClient.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/ValideDialogue.dart';
import 'package:foft/components/reject_dialogue.dart';
import 'package:foft/modal/fiche.dart';

class DetailFicheEnseignant extends StatefulWidget {
  final bool isEnsignant;
  final Fiche fiche;
  DetailFicheEnseignant(
      {Key? key, required this.isEnsignant, required this.fiche})
      : super(key: key);

  @override
  State<DetailFicheEnseignant> createState() => _DetailFicheEnseignantState();
}

class _DetailFicheEnseignantState extends State<DetailFicheEnseignant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: kBlack),
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: false,
          title: Text("Detaille fiche de suivit",
              style: TextStyle(
                  color: kLinckColor,
                  fontSize: 20,
                  fontFamily: 'Chicle-Regular')),
        ),
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          baseurl + "${widget.fiche.enseignant.photo}")),
                  title: widget.isEnsignant
                      ? Text("${widget.fiche.enseignant.nom}",
                          style: TextStyle(
                              color: kBlack, fontSize: 16, fontFamily: 'Bold'))
                      : Text("${widget.fiche.enseignant.nom}",
                          style: TextStyle(
                              color: kBlack, fontSize: 16, fontFamily: 'Bold')),
                  /*  subtitle: Text("IL YA ENVIRON 3 MINUTES",
                      style: TextStyle(
                          color: kBlack, fontSize: 11, fontFamily: 'Light')),
              */
                ),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.semestre}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "Semestre : ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: " ${widget.fiche.specialite["code"]}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "Specialite: ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.ue["code"]}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "UE : ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.salle["nom"]}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "salle : ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.seance["nom"]}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "Seance de : ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                if (widget.fiche.state!.compareTo("2") == 0)
                  SizedBox(
                    height: 16,
                  ),
                if (widget.fiche.state!.compareTo("2") == 0)
                  RichText(
                      text: TextSpan(
                          children: [
                        TextSpan(
                            text: "${widget.fiche.motif}",
                            style: TextStyle(
                                color: kLinckColor,
                                fontSize: 17,
                                fontFamily: 'Medium'))
                      ],
                          text: "Motif : ",
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.titre}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "Titre : ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.date}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "date : ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.heureDebut}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "heure de debut: ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.heureFin}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "heure de fin : ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "${widget.fiche.totalHoraire}",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "total hauraire: ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "",
                          style: TextStyle(
                              color: kLinckColor,
                              fontSize: 17,
                              fontFamily: 'Medium'))
                    ],
                        text: "Contenu: ",
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 17,
                            fontFamily: 'Medium'))),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                      style: TextStyle(fontSize: 14, fontFamily: "Light"),
                      "${widget.fiche.contenu}"),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: graycolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text("signature du delegue",
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontFamily: 'Medium')),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  baseurl + "${widget.fiche.signatureDelegue}",
                                ))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 16,
                ),
                if (widget.fiche.state!.compareTo("1") == 0)
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: graycolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text("signature de Enseignant",
                            style: TextStyle(
                                color: kBlack,
                                fontSize: 17,
                                fontFamily: 'Medium')),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    baseurl +
                                        "${widget.fiche.signatureEnseignant}",
                                  ))),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            if (widget.isEnsignant)
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) =>
                                RejectDialogue(fiche: widget.fiche),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 103,
                            child: Text("rejeter",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 17,
                                    fontFamily: 'Bold')),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) =>
                                ValidateDialogue(fiche: widget.fiche),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 103,
                            child: Text("Valider",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 17,
                                    fontFamily: 'Bold')),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(123, 229, 170, 1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    ),
                  ))
          ],
        ));
  }
}
