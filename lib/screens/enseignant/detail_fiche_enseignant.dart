import 'package:flutter/material.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/ValideDialogue.dart';
import 'package:foft/components/reject_dialogue.dart';

class DetailFicheEnseignant extends StatefulWidget {
  DetailFicheEnseignant({Key? key}) : super(key: key);

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
                      backgroundImage: AssetImage("assets/images/p1.jpg")),
                  title: Text("Dr. MONTHE VALERY",
                      style: TextStyle(
                          color: kBlack, fontSize: 16, fontFamily: 'Bold')),
                  subtitle: Text("IL YA ENVIRON 3 MINUTES",
                      style: TextStyle(
                          color: kBlack, fontSize: 11, fontFamily: 'Light')),
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "1",
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
                          text: "Conception orientée object",
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
                          text: "S105",
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
                          text: "TD",
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
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                      TextSpan(
                          text: "fin diagramme uml",
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
                          text: "17/01/2023",
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
                          text: "7h30",
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
                          text: "9h30",
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
                          text: "2h",
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
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare velit hendrerit pellentesque id. Tellus nulla fringilla mattis lacus. Nisl arcu et, elit velit facilisis tellus sed enim. Suscipit a, tincidunt aliquam quam tellus aenean ornare dui.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare velit hendrerit pellentesque id. Tellus nulla fringilla mattis lacus. Nisl arcu et, elit velit facilisis tellus sed enim. Suscipit a, tincidunt aliquam quam tellus aenean ornare dui.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare velit hendrerit pellentesque id. Tellus nulla fringilla mattis lacus. Nisl arcu et, elit velit facilisis tellus sed enim. Suscipit a, tincidunt aliquam quam tellus aenean ornare dui.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare velit hendrerit pellentesque id. Tellus nulla fringilla mattis lacus. Nisl arcu et, elit velit facilisis tellus sed enim. Suscipit a, tincidunt aliquam quam tellus aenean ornare dui."),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 197,
                  decoration: BoxDecoration(
                      color: graycolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text("signature du delegue",
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontFamily: 'Medium')),
                      Image.asset(
                        "assets/images/Vector 2.png",
                        width: 200,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
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
                          builder: (context) => RejectDialogue(),
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
                          builder: (context) => ValidateDialogue(),
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
