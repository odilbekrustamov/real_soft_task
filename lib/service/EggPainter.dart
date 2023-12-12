import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:real_soft_task/log_service.dart';
import 'package:real_soft_task/service/utils_service.dart';

class EggPainter extends CustomPainter {
  final List<Face>? faces;
  final Size imageSize;
  final BuildContext context;

  EggPainter({required this.faces, required this.imageSize, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = facesInsideOval() ? greenBorderPaint() : redBorderPaint();

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double majorRadius = 120.0; // half of the width
    double minorRadius = 170.0; // half of the height

    canvas.drawOval(Rect.fromCenter(center: Offset(centerX, centerY), width: majorRadius * 2, height: minorRadius * 2), borderPaint);
  }

  @override
  bool shouldRepaint(covariant EggPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
  }

  bool facesInsideOval() {
    if (faces == null || faces!.isEmpty) return false;

    Face primaryFace = faces!.first;

    Rect faceBoundingBox = primaryFace.boundingBox;

    double faceCenterX = faceBoundingBox.left + (faceBoundingBox.width / 2);
    double faceCenterY = faceBoundingBox.top + (faceBoundingBox.height / 2);

    if(isPointInsideOval(faceCenterX, faceCenterY)){

      LogService.d("DFSCSASA${faceBoundingBox.width + faceBoundingBox.height}");

      if(faceBoundingBox.width + faceBoundingBox.height > 800){
        Utils.showToastError("Yuz ayala ichidadan tashqarigacha chiqgan", context);
        return false;
      }else if(faceBoundingBox.width + faceBoundingBox.height < 600){
        Utils.showToastError("Yuz ayala ichida kichik", context);
        return false;
      }else{
        Utils.showToastSuccess("Yuz ayala ichida", context);
        return true;
      }

    }else{
      Utils.showToastError("Yuz ayala ichida emas", context);
      return false;
    }
  }

  bool isPointInsideOval(double x, double y) {
    double centerX = imageSize.width / 2;
    double centerY = imageSize.height / 2;

    double majorRadius = 120.0; // half of the width
    double minorRadius = 170.0; // half of the height

    double normalizedX = (x - centerX) / majorRadius;
    double normalizedY = (y - centerY) / minorRadius;

    // Check if the point is inside the unit circle
    LogService.d("sccsacsavsav${ (normalizedX * normalizedX + normalizedY * normalizedY) <= 1.0}");
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
      ..strokeWidth = 6.0;
  }
}

// class EggPainter extends CustomPainter {
//   final List<Face>? faces;
//   final Size imageSize;
//
//   EggPainter({required this.faces, required this.imageSize});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint borderPaint = facesInsideOval() ? greenBorderPaint() : redBorderPaint();
//
//     double centerX = size.width / 2;
//     double centerY = size.height / 2;
//
//     double majorRadius = 120.0; // half of the width
//     double minorRadius = 170.0; // half of the height
//
//     canvas.drawOval(Rect.fromCenter(center: Offset(centerX, centerY), width: majorRadius * 2, height: minorRadius * 2), borderPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant EggPainter oldDelegate) {
//     return oldDelegate.imageSize != imageSize || oldDelegate.faces != faces;
//   }
//
//   bool facesInsideOval() {
//     if (faces == null || faces!.isEmpty) return false;
//
//     // Assuming the first face in the list represents the primary face
//     Face primaryFace = faces!.first;
//
//     // Assuming the bounding box of the face is represented by Rect object
//     Rect faceBoundingBox = primaryFace.boundingBox;
//
//     // Calculate the center of the face bounding box
//     double faceCenterX = faceBoundingBox.left + (faceBoundingBox.width / 2);
//     double faceCenterY = faceBoundingBox.top + (faceBoundingBox.height / 2);
//
//     // Check if the face center is inside the oval
//     return isPointInsideOval(faceCenterX, faceCenterY);
//   }
//
//   bool isPointInsideOval(double x, double y) {
//     double centerX = imageSize.width / 2;
//     double centerY = imageSize.height / 2;
//
//     double majorRadius = 120.0; // half of the width
//     double minorRadius = 170.0; // half of the height
//
//     double normalizedX = (x - centerX) / majorRadius;
//     double normalizedY = (y - centerY) / minorRadius;
//
//     // Check if the point is inside the unit circle
//     LogService.d("sccsacsavsav${ (normalizedX * normalizedX + normalizedY * normalizedY) <= 1.0}");
//     return (normalizedX * normalizedX + normalizedY * normalizedY) <= 1.0;
//   }
//
//   Paint greenBorderPaint() {
//     return Paint()
//       ..color = Colors.green
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//   }
//
//   Paint redBorderPaint() {
//     return Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//   }
// }
