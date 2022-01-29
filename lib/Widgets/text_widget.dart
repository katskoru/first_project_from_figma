import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  // przez ? ma się nie przejmować, że nie ma tej danej:
  String? text;
  Color? color;
  double? size;
  TextDecoration? decor;
  FontWeight? weight;

  MyTextWidget({this.text, this.color, this.size, this.decor, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      // wykrzyknik daje nam info, że nie będzie w tej wartości nigdy nulla
      text!,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        decoration: decor,
      ),
    );
  }
}
