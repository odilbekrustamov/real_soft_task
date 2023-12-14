import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:real_soft_task/detail_page.dart';
import 'package:real_soft_task/log_service.dart';
import 'package:real_soft_task/model/FaceRes.dart';
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
  String? imagePath;
  Size? imageSize;
  bool _detectingFaces = false;
  bool _initializing = false;
  ValueNotifier<int> countdown = ValueNotifier<int>(4);
  ValueNotifier<bool> faceFound = ValueNotifier<bool>(false);
  late Timer _countdownTimer;

  // service injection
  FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();

  @override
  void initState() {
    super.initState();
    _faceDetectorService.initialize();
    _start();

    faceFound.addListener(() {
      LogService.e('Counter changed: ${faceFound.value}');
      if (faceFound.value) {
        startCountdown();
      } else {
        countdown.value = 4;
        stopCountdown();
      }
    });

    countdown.addListener(() async {
      if (countdown.value == 0) {
        LogService.e('Counter changed: ${faceFound.value}  new page');
        _countdownTimer.cancel();
        String? imagePath = await onShot();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailPage(imagePath: imagePath),
          ),
        );
        countdown.value = 4;
      }
    });
  }

  Future<String?> onShot() async {
    if (faces != null) {
      if (faces!.first != null) {
        await Future.delayed(Duration(milliseconds: 500));
        // await _cameraService.cameraController?.stopImageStream();
        await Future.delayed(Duration(milliseconds: 200));
        XFile? file = await _cameraService.takePicture();
        imagePath = file?.path;

        Face face = faces!.first;
        double x = face.boundingBox!.left.toDouble() - 10;
        double y = face.boundingBox!.top.toDouble() - 50;
        double width = face.boundingBox!.width.toDouble() + 10;
        double height = face.boundingBox!.height.toDouble() + 50;

        String? croppedByteData =
            await Utils.cropAndSaveImage(imagePath, x, y, width, height);
        return croppedByteData;
      }
    }
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
              faces = _faceDetectorService.faces;
            });
          } else {
            setState(() {
              faces = null;
            });
          }

          _detectingFaces = false;
        } catch (e) {
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
                      painter: EggPainter(
                        faces: faces,
                        imageSize: imageSize!,
                        context: context,
                        onBackResult: _onBackResultCallback,
                      ),
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
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 3,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  // Content for the second container
                  child: Center(
                    child: Text(
                      "${countdown.value != 4 && countdown.value != 0 ? "${countdown.value} soniya kuting" : ""}",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  void _onBackResultCallback(FaceRes faceRes) {
    LogService.e('Counter hvbhgvvhvvvh: ${faceRes.faceFound} ');

    // Future.delayed(Duration.zero, () {
    faceFound.value = faceRes.faceFound;
    //});
  }

  void startCountdown() {
    const oneSecond = Duration(seconds: 1);

    _countdownTimer = Timer.periodic(oneSecond, (timer) {
      if (faceFound.value && countdown.value > 0) {
        LogService.d('Countdown: ${countdown.value}');
        countdown.value--;
      }
    });
  }

  void stopCountdown() {
    if (_countdownTimer.isActive) {
      LogService.d('timer cencel');
      _countdownTimer.cancel();
    }
  }
}
