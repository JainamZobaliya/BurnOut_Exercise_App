import 'package:burn_out/Theme.dart';
import 'package:flutter/material.dart';

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(-size.width/2, -size.width/1.8, size.width*2, size.height*1.55),
      Paint()
        ..shader = circleGradientBox.createShader(Rect.fromLTWH(-size.width/2, -size.width/1.4, size.width*2, size.height*1.5)),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
