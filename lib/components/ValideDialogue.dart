import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:foft/api/FicheEnseignantService.dart';
import 'package:foft/colors.dart';
import 'package:foft/modal/fiche.dart';
import 'package:signature/signature.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ValidateDialogue extends StatefulWidget {
  Fiche fiche;
  ValidateDialogue({Key? key, required this.fiche}) : super(key: key);

  @override
  State<ValidateDialogue> createState() => _ValidateDialogueState();
}

class _ValidateDialogueState extends State<ValidateDialogue> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );
  bool isloding = false;
  Uint8List? image;
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
                  Text("validation encour....",
                      style: TextStyle(
                          color: kLinckColor,
                          fontSize: 16,
                          fontFamily: 'Light'))
                ],
              ),
            )
          : Container(
              height: 400,
              width: 369,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("Validation",
                      style: TextStyle(
                          color: kLinckColor,
                          fontSize: 32,
                          fontFamily: 'Chicle-Regular')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Signature",
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontFamily: 'ComRegular.')),
                      IconButton(
                          onPressed: () async {
                            _controller.clear();
                          },
                          icon: Icon(Icons.clear))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Signature(
                    controller: _controller,
                    width: 300,
                    height: 200,
                    backgroundColor: kSecondaryColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () async {
                      print(widget.fiche.motif);
                      setState(() {
                        isloding = true;
                      });
                      image = await _controller.toPngBytes();
                      context
                          .read<FicheEnseignantService>()
                          .validerfiche(widget.fiche.id, image, widget.fiche)
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
                                    message: "fiche valider !",
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
            ),
    );
  }
}
