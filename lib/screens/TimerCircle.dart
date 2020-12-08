import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimerCircle extends CustomPainter{

  final Animation<double> animation;
  final Color backgroundColor, color;

  TimerCircle({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // size /=2;
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 4.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(new Rect.fromLTWH(size.width/4, size.width/4, size.width/2, size.height/2), math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerCircle old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }

}