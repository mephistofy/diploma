import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration boxDecoration({color= Colors.white}){
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(20.0),
    border: Border.all(color: Colors.black),
    boxShadow: [
      BoxShadow(
        color: Colors.blueGrey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 5,
        offset: Offset(3, 3),
      ),
    ],
  );
}
