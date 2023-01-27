import 'package:flutter/material.dart';
import 'package:foft/colors.dart';
import 'package:signature/signature.dart';

class ValidateDialogue extends StatefulWidget {
  ValidateDialogue({Key? key}) : super(key: key);

  @override
  State<ValidateDialogue> createState() => _ValidateDialogueState();
}

class _ValidateDialogueState extends State<ValidateDialogue> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
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
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 103,
                child: Text("Valider",
                    style: TextStyle(
                        color: whiteColor, fontSize: 17, fontFamily: 'Bold')),
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
