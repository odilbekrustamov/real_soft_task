import 'dart:io';

import 'package:flutter/material.dart';
import 'package:real_soft_task/log_service.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";

  final String? imagePath;
  DetailPage({Key? key, required this.imagePath}) : super(key: key);


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    LogService.d("csdccvsvdsvdvd    ${widget.imagePath}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
              child: Image.file(File(widget.imagePath!))
          )
        ],
      ),
    );
  }
}
