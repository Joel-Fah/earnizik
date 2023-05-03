import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor myPaletteDark = MaterialColor(
    0xFF7466e6,
    <int, Color>{
      50: Color(0xFF685ccf), //10%
      100: Color(0xFF5d52b8), //20%
      200: Color(0xFF5147a1), //30%
      300: Color(0xFF463d8a), //40%
      400: Color(0xFF3a3373), //50%
      500: Color(0xFF2e295c), //60%
      600: Color(0xFF231f45), //70%
      700: Color(0xFF17142e), //80%
      800: Color(0xFF0c0a17), //90%
      900: Color(0xFF000000), //100%
    },
  );

  static const MaterialColor myPaletteLight = MaterialColor(
    0xFF,
    <int, Color>{
      50: Color(0xFF8275e9), //10%
      100: Color(0xFF9085eb), //20%
      200: Color(0xFF9e94ee), //30%
      300: Color(0xFFaca3f0), //40%
      400: Color(0xFFbab3f3), //50%
      500: Color(0xFFc7c2f5), //60%
      600: Color(0xFFd5d1f8), //70%
      700: Color(0xFFe3e0fa), //80%
      800: Color(0xFFf1f0fd), //90%
      900: Color(0xFFffffff), //100%
    },
  );
}
