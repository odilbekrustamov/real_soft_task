import 'package:flutter/material.dart';
import 'package:real_soft_task/camera/camera_page.dart';
import 'package:real_soft_task/service/locator.dart';

Future<void> main() async {
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CameraPage(),
      // routes: {
      //   DetailPage.id: (context) => DetailPage(""),
      //   CameraPage.id: (context) => CameraPage()
      // },
    );
  }
}
