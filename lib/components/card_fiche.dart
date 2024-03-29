import 'package:flutter/material.dart';
import 'package:foft/api/DioClient.dart';
import 'package:foft/colors.dart';
import 'package:foft/modal/fiche.dart';
import 'package:foft/screens/enseignant/detail_fiche_enseignant.dart';
import 'package:foft/screens/update_fiche.dart';

class CardFiche extends StatefulWidget {
  bool isrejet, ismodifier, isEnsignant;
  Fiche fiche;
  CardFiche(
      {Key? key,
      required this.ismodifier,
      required this.isrejet,
      required this.fiche,
      required this.isEnsignant})
      : super(key: key);

  @override
  State<CardFiche> createState() => _CardFicheState();
}

class _CardFicheState extends State<CardFiche> {
  @override
  Widget build(BuildContext context) {
    //print(widget.fiche.toJson());
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailFicheEnseignant(
                  isEnsignant: widget.isEnsignant, fiche: widget.fiche),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.only(right: 10, left: 10, top: 16, bottom: 16),
        //height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: graycolor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            widget.ismodifier || widget.isrejet
                ? ListTile(
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UpdateFiche(fiche: widget.fiche),
                            ));
                      },
                      child: Image.asset(
                        "assets/images/Vector (5).png",
                      ),
                    ),
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            baseurl + "${widget.fiche.enseignant.photo}")),
                    title: Text("${widget.fiche.enseignant.nom}",
                        style: TextStyle(
                            color: kBlack, fontSize: 16, fontFamily: 'Bold')),
                    subtitle: Text("",
                        style: TextStyle(
                            color: kBlack, fontSize: 11, fontFamily: 'Light')),
                  )
                : ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            baseurl + "${widget.fiche.enseignant.photo}")),
                    title: Text("${widget.fiche.enseignant.nom}",
                        style: TextStyle(
                            color: kBlack, fontSize: 16, fontFamily: 'Bold')),
                    subtitle: Text("",
                        style: TextStyle(
                            color: kBlack, fontSize: 11, fontFamily: 'Light')),
                  ),
            RichText(
                text: TextSpan(
                    children: [
                  TextSpan(
                      text: "${widget.fiche.niveau["intitule"]}",
                      style: TextStyle(
                          color: kLinckColor,
                          fontSize: 17,
                          fontFamily: 'Medium'))
                ],
                    text: "Niveau : ",
                    style: TextStyle(
                        color: kBlack, fontSize: 17, fontFamily: 'Medium'))),
            SizedBox(
              height: 16,
            ),
            RichText(
                text: TextSpan(
                    children: [
                  TextSpan(
                      text: " ${widget.fiche.titre}",
                      style: TextStyle(
                          color: kLinckColor,
                          fontSize: 17,
                          fontFamily: 'Medium'))
                ],
                    text: "Seance: ${widget.fiche.seance["nom"]}",
                    style: TextStyle(
                        color: kBlack, fontSize: 17, fontFamily: 'Medium'))),
            SizedBox(
              height: 16,
            ),
            if (widget.isrejet)
              Container(
                height: 40,
                width: 281,
                child: Text("${widget.fiche.motif.toString()}",
                    maxLines: 3,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.red,
                        fontSize: 11,
                        fontFamily: 'Medium')),
              ),
            if (widget.isEnsignant)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
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
                  Container(
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
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
