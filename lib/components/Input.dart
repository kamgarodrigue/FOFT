import 'package:flutter/material.dart';
import 'package:foft/colors.dart';

class Input extends StatefulWidget {
  String? hintText;
  Widget suffixIcon, prefixIcon;
  bool? isTel;
  bool? obscureText;
  final ValueChanged<String> onChanged;
  Input(
      {Key? key,
      required this.hintText,
      required this.obscureText,
      required this.onChanged,
      required this.isTel,
      required this.prefixIcon,
      required this.suffixIcon})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          color: graycolor.withOpacity(0.1),
          child: TextField(
              keyboardType: TextInputType.text,
              obscureText: widget.obscureText!,
              onTap: () {},
              onSubmitted: (_) {},
              style: TextStyle(
                  color: kBlack, fontSize: 15, fontFamily: "Poppins-medium"),
              textAlign: TextAlign.start,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,

                // ]),
                suffixIcon: widget.suffixIcon,
                contentPadding: const EdgeInsets.all(12),
                // border: InputBorder(),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: kBlack, fontSize: 15, fontFamily: "Poppins-medium"),
              )),
        ),
      ],
    );
  }
}
