import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePath {
  static const String splashbg = 'assets/images/splashbg.png';
  static const String onboard1 = 'assets/images/onboard1.png';
  static const String onboard2 = 'assets/images/onboard2.png';
  static const String onboard3 = 'assets/images/onboard3.png';
}

class ContextVariables {
  // Sizes
  static width(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .width;

  static height(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .height;
}


