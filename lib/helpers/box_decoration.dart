import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration boxDecoration(){
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    border: Border.all(color: Colors.black),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 10,
        blurRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
  );
}