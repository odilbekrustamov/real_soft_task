import 'package:get_it/get_it.dart';
import 'package:real_soft_task/service/camera.service.dart';
import 'package:real_soft_task/service/face_detector_service.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator
      .registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
}
