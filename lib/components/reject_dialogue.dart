import 'package:flutter/material.dart';
import 'package:foft/colors.dart';

class RejectDialogue extends StatefulWidget {
  RejectDialogue({Key? key}) : super(key: key);

  @override
  State<RejectDialogue> createState() => _RejectDialogueState();
}

class _RejectDialogueState extends State<RejectDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
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
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: graycolor, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                maxLines: 9,
                style: TextStyle(
                    color: kBlack, fontSize: 14, fontFamily: 'Medium'),
                decoration: InputDecoration(
                    hintText: "Motif de rejet",
                    hintStyle: TextStyle(
                        color: kBlack, fontSize: 17, fontFamily: 'ComRegular.'),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8)),
              ),
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
                child: Text("Rejeter",
                    style: TextStyle(
                        color: whiteColor, fontSize: 17, fontFamily: 'Bold')),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
