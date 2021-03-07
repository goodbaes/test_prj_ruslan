import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectBoxDecor {
  ProjectBoxDecor._();

  static const boxShadowInCard = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 20.0, // soften the shadow
        spreadRadius: 1.2, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          1, // Move to bottom 10 Vertically
        ),
      )
    ],
  );
  static const black = Color(0xFF000000);
}
