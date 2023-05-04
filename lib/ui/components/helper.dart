import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remixicon/remixicon.dart';

class ImagePath {
  static const String splashbg = 'assets/images/splashbg.png';
  static const String onboard1 = 'assets/images/onboard1.png';
  static const String onboard2 = 'assets/images/onboard2.png';
  static const String onboard3 = 'assets/images/onboard3.png';
}

class ContextVariables {
  // Sizes
  static width(BuildContext context) => MediaQuery.of(context).size.width;

  static height(BuildContext context) => MediaQuery.of(context).size.height;
}

// Placeholder and error widget
Widget placeholder(BuildContext context, String url) =>
    LoadingAnimationWidget.threeRotatingDots(
      color: Theme.of(context).primaryColor,
      size: 25.0,
    );

Widget errorWidget(context, url, error) => const Center(
      child: Icon(
        Remix.user_unfollow_line,
        color: Colors.red,
        size: 25,
      ),
    );

class PolygonClipper extends CustomClipper<Path> {
  final double borderRadius;

  PolygonClipper({this.borderRadius = 0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 2;
    const angle = 2 * pi / 12;
    final offset = Offset(size.width / 2, size.height / 2);

    path.moveTo(offset.dx + radius * cos(angle * 0),
        offset.dy + radius * sin(angle * 0));
    for (int i = 1; i <= 12; i++) {
      final x = offset.dx + radius * cos(angle * i);
      final y = offset.dy + radius * sin(angle * i);
      path.lineTo(x, y);
    }
    path.close();

    if (borderRadius > 0) {
      final rect = Rect.fromLTWH(0, 0, size.width, size.height);
      final clipPath = Path()
        ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)))
        ..close();
      path.addPath(clipPath, Offset.zero);
    }

    return path;
  }

  @override
  bool shouldReclip(PolygonClipper oldClipper) =>
      oldClipper.borderRadius != borderRadius;
}
