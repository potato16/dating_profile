import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path _path = Path()
      ..arcTo(Rect.fromLTWH(0, 0, 12, 12), pi / 2, 3 * pi / 2, true)
      ..arcTo(Rect.fromLTWH(8, 0, 12, 12), -pi / 4, pi - pi / 4, true);
    canvas.drawPath(
        _path,
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill
          ..strokeWidth = 1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
