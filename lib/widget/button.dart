// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final onTapButton;

  const MyButton(
      {super.key,
      this.color,
      required this.textColor,
      required this.buttonText,
      this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          clipBehavior: Clip.none,

          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),color: color, boxShadow:  [
              BoxShadow(offset: const Offset(1, 1), color:  color,blurRadius: 1,spreadRadius: 1),
              BoxShadow(offset: const Offset(-1, -1), color:  color,blurRadius: 1,spreadRadius: 2),
            ]),
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
