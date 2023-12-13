import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class EggPainter extends CustomPainter {
  final List<Face>? faces;
  final Size imageSize;
  final BuildContext context;
  late ValueChanged<bool> onBackResult;

  EggPainter({
    required this.faces,
    required this.imageSize,
    required this.context,
    required this.onBackResult,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint =
        facesInsideOval() ? greenBorderPaint() : redBorderPaint();

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double majorRadius = 120.0;
    double minorRadius = 170.0;

    final paint = Paint();
    paint.color = Colors.white;

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromLTRBR(
              0, 0, size.width, size.height, Radius.circular(0))),
        Path()
          ..addOval(Rect.fromCenter(
              center: Offset(centerX, centerY),
              width: majorRadius * 2,
              height: minorRadius * 2))
          ..close(),
      ),
      paint,
    );

    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(centerX, centerY),
            width: majorRadius * 2,
            height: minorRadius * 2),
        borderPaint);
  }

  @override
  bool shouldRepaint(covariant EggPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
  }

  bool facesInsideOval() {
    if (faces == null || faces!.isEmpty) {
      onBackResult(false);
      return false;
    }

    Face primaryFace = faces!.first;
    Rect faceBoundingBox = primaryFace.boundingBox;

    double faceCenterX = faceBoundingBox.left + (faceBoundingBox.width / 2);
    double faceCenterY = faceBoundingBox.top + (faceBoundingBox.height / 2);

    if (isPointInsideOval(faceCenterX, faceCenterY)) {
      if (faceBoundingBox.width + faceBoundingBox.height > 850 ||
          faceBoundingBox.width + faceBoundingBox.height < 750) {
        // Utils.showToastError("Yuz qizil aylana ichiga olib keling", context);
        onBackResult(false);
        return false;
      } else {
        // Utils.showToastSuccess("To'g'ri", context);
        onBackResult(true);
        return true;
      }
    } else {
      // Utils.showToastError("Yuz qizil aylana ichiga olib keling", context);
      onBackResult(false);
      return false;
    }
  }

  bool isPointInsideOval(double x, double y) {
    double centerX = imageSize.width / 2;
    double centerY = imageSize.height / 2;

    double majorRadius = 120.0;
    double minorRadius = 170.0;

    double normalizedX = (x - centerX) / majorRadius;
    double normalizedY = (y - centerY) / minorRadius;

    return (normalizedX * normalizedX + normalizedY * normalizedY) <= 1.0;
  }

  Paint greenBorderPaint() {
    return Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;
  }

  Paint redBorderPaint() {
    return Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
  }

  Paint backgroundBorderPaint() {
    return Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
  }
}