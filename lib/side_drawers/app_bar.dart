import 'package:diploma_v1/constants/colors.dart';
import 'package:flutter/material.dart';

Widget customAppBar(title, context){
  final mobileSize = 18.0;
  final webSize = 30.0;
  final fontSize = MediaQuery.of(context).size.width <= 320 ? mobileSize : webSize;

  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
      ),
    ),
    backgroundColor: mainColor,
  );
}