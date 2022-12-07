import 'dart:math';
import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color backgroundColor;
  final Color filledColor;
  final Color lineColor;
  final double lineWidth;
  final double lineMargin;

  const RadialPercentWidget({
    super.key,
    required this.child,
    required this.percent,
    required this.backgroundColor,
    required this.filledColor,
    required this.lineColor,
    required this.lineWidth,
    required this.lineMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            lineWidth: lineWidth,
            lineColor: lineColor,
            backgroundColor: backgroundColor,
            filledColor: filledColor,
            lineMargin: lineMargin,
          ),
        ),
        Center(child: child),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color backgroundColor;
  final Color filledColor;
  final Color lineColor;
  final double lineWidth;
  final double lineMargin;

  MyPainter({
    required this.percent,
    required this.backgroundColor,
    required this.filledColor,
    required this.lineColor,
    required this.lineWidth,
    required this.lineMargin,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect arcRect = calculateArcsRect(size);
    _drawBackground(canvas, size);
    _drawLineArc(canvas, arcRect);
    _drawFilledArc(canvas, arcRect);
  }

  void _drawLineArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void _drawFilledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = filledColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void _drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = backgroundColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    final offsets = lineWidth / 2 + lineMargin;
    final arcRect = Offset(offsets, offsets) &
        Size(size.width - offsets * 2, size.height - offsets * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
