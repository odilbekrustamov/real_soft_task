import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:m_toast/m_toast.dart';
import 'package:path_provider/path_provider.dart';

class Utils{

  static void showToastError(String msg,  BuildContext context) {
    ShowMToast toast = ShowMToast(context);
    toast.errorToast(
        message: msg,
        backgroundColor: Colors.white,
        alignment: Alignment.topCenter,
        duration: 300,
        width: 10
    );
  }

  static void showToastSuccess(String msg, BuildContext context) {
    ShowMToast toast = ShowMToast(context);
    toast.successToast(
        message: msg,
        backgroundColor: Colors.white,
        alignment: Alignment.topCenter,
        duration: 300,
        width: 10
    );
  }

  static void showToastButtom(String msg, BuildContext context) {
    ShowMToast toast = ShowMToast(context);
    toast.successToast(
        message: msg,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        alignment: Alignment.center,
        duration: 300,
        width: 20,
    );
  }

  static Future<String?> cropAndSaveImage(String? imagePath, double x, double y,
      double width, double height) async {
    if (imagePath != null) {
      final File imageFile = File(imagePath);
      final List<int> imageBytes = await imageFile.readAsBytes();

      final img.Image originalImage =
      img.decodeImage(Uint8List.fromList(imageBytes))!;

      final img.Image croppedImage = img.copyCrop(
        originalImage,
        x.toInt(),
        y.toInt(),
        width.toInt(),
        height.toInt(),
      );

      final Uint8List croppedBytes = img.encodeJpg(croppedImage) as Uint8List;

      final Directory documentsDirectory =
      await getApplicationDocumentsDirectory();

      final String fileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';

      final File savedFile = File('${documentsDirectory.path}/$fileName');
      await savedFile.writeAsBytes(croppedBytes);

      return savedFile.path;
    } else {
      print('Image path is null');
      return null;
    }
  }

}