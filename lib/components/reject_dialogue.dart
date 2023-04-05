import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foft/api/FicheEnseignantService.dart';
import 'package:foft/colors.dart';
import 'package:foft/modal/fiche.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:provider/provider.dart';

class RejectDialogue extends StatefulWidget {
  Fiche fiche;
  RejectDialogue({Key? key, required this.fiche}) : super(key: key);

  @override
  State<RejectDialogue> createState() => _RejectDialogueState();
}

class _RejectDialogueState extends State<RejectDialogue> {
  bool isloding = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: isloding
          ? Container(
              height: 100,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularProgressIndicator(
                    color: kLinckColor,
                  ),
                  Text("rejet encour....",
                      style: TextStyle(
                          color: kLinckColor,
                          fontSize: 16,
                          fontFamily: 'Light'))
                ],
              ),
            )
          : Container(
              height: 350,
              width: 369,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("Rejet",
                      style: TextStyle(
                          color: kLinckColor,
                          fontSize: 32,
                          fontFamily: 'Chicle-Regular')),
                  SizedBox(
                    height: 10,
                  ),
                  if (!isloding)
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: graycolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        maxLines: 9,
                        onChanged: (value) {
                          widget.fiche.motif = value;
                        },
                        style: TextStyle(
                            color: kBlack, fontSize: 14, fontFamily: 'Medium'),
                        decoration: InputDecoration(
                            hintText: "Motif de rejet",
                            hintStyle: TextStyle(
                                color: kBlack,
                                fontSize: 17,
                                fontFamily: 'ComRegular.'),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8)),
                      ),
                    ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(widget.fiche.motif);
                      setState(() {
                        isloding = true;
                      });

                      context
                          .read<FicheEnseignantService>()
                          .rejeterfiche(widget.fiche.id, widget.fiche.motif)
                          .then((value) => {
                                //print(value),
                                setState(() {
                                  isloding = false;
                                }),
                                // initfiche(),
                                Navigator.of(context).pop(),
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    message: "fiche rejeter!",
                                  ),
                                )
                              })
                          .catchError((onError) {
                        print(onError);
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(
                            message: onError.toString(),
                          ),
                        );
                        setState(() {
                          isloding = false;
                        });
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 103,
                      child: Text("Rejeter",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 17,
                              fontFamily: 'Bold')),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
