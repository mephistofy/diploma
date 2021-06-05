
import 'package:diploma_v1/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hovering/hovering.dart';

import 'box_decoration.dart';

Widget hover_avatar(
    {
      child: CircularProgressIndicator,
      width: 200.0,
      height: 200.0,
      hoverWidth: 200.0,
      hoverHeight: 200.0,
      hoverPadding: const EdgeInsets.all(0.0),
      hoverMargin: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      alignment: null,
    }
    )
{
  return HoverAnimatedContainer(
    width: width,
    height: height,
    hoverHeight: hoverHeight,
    hoverWidth: hoverWidth,
    hoverPadding: hoverPadding,
    hoverMargin: hoverMargin,
    margin: margin,
    padding: padding,
    alignment: alignment,
    child: child,
  );
}
