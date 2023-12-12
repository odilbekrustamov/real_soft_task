import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:real_soft_task/log_service.dart';
import 'package:real_soft_task/service/EggPainter.dart';
import 'package:real_soft_task/service/camera.service.dart';
import 'package:real_soft_task/service/utils_service.dart';

import '../service/face_detector_service.dart';
import '../service/locator.dart';

class CameraPage extends StatefulWidget {
  static final String id = "camera_page";

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<Face>? faces;
  Size? imageSize;
  bool _detectingFaces = false;

  bool _initializing = false;

  // service injection
  FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();

  @override
  void initState() {
    super.initState();
    _faceDetectorService.initialize();
    _start();
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }

  _start() async {
    setState(() => _initializing = true);
    await _cameraService.initialize();
    setState(() => _initializing = false);

    _frameFaces();
  }

  _frameFaces() {
    imageSize = _cameraService.getImageSize();

    _cameraService.cameraController?.startImageStream((image) async {
      if (_cameraService.cameraController != null) {
        if (_detectingFaces) return;

        _detectingFaces = true;

        try {
          await _faceDetectorService.detectFacesFromImage(image);
          if (_faceDetectorService.faces.isNotEmpty) {
            setState(() {
              LogService.d(
                  "555555555555555555555555${_faceDetectorService.faces.length}");
              faces = _faceDetectorService.faces;
              //Utils.showToastSuccess(
               //   "Yuzlar soni ${_faceDetectorService.faces.length}", context);
            });
          } else {
            //Utils.showToastError("Odamni rasmi yo'q", context);
            print('face is null');
            setState(() {
              faces = null;
            });
          }

          _detectingFaces = false;
        } catch (e) {
          print('Error _faceDetectorService face => $e');
          _detectingFaces = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    late Widget body;
    if (_initializing) {
      body = Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!_initializing) {
      body = Transform.scale(
        scale: 1.0,
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                width: width,
                height:
                    width * _cameraService.cameraController!.value.aspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CameraPreview(_cameraService.cameraController!),
                    // CustomPaint(
                    //   painter: FacePainter(faces: faces, imageSize: imageSize!),
                    // ),
                    CustomPaint(
                      painter: EggPainter(faces: faces, imageSize: imageSize!, context: context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        body: Stack(
      children: [
        body,
      ],
    ));
  }
}
