import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor myPaletteDark = MaterialColor(
    0xFFa33100,
    <int, Color>{
      50: Color(0xFF932c00), //10%
      100: Color(0xFF822700), //20%
      200: Color(0xFF722200), //30%
      300: Color(0xFF621d00), //40%
      400: Color(0xFF521900), //50%
      500: Color(0xFF411400), //60%
      600: Color(0xFF310f00), //70%
      700: Color(0xFF210a00), //80%
      800: Color(0xFF100500), //90%
      900: Color(0xFF000000), //100%
    },
  );

  static const MaterialColor myPaletteLight = MaterialColor(
    0xFF,
    <int, Color>{
      50: Color(0xFFac461a), //10%
      100: Color(0xFFac461a), //20%
      200: Color(0xFFbf6f4d), //30%
      300: Color(0xFFc88366), //40%
      400: Color(0xFFd19880), //50%
      500: Color(0xFFdaad99), //60%
      600: Color(0xFFe3c1b3), //70%
      700: Color(0xFFedd6cc), //80%
      800: Color(0xFFf6eae6), //90%
      900: Color(0xFFffffff), //100%
    },
  );
}
