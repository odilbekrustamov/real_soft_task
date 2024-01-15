import 'dart:io';

import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    getUserAgent();
    super.initState();
  }

  Future<String> getUserAgent() async {
    try {
      await FkUserAgent.init();
      var platformVersion = FkUserAgent.userAgent!;
      LogService.d(" dcscvdzvdbfdd ${FkUserAgent.userAgent}");
      LogService.d(" dcscvdzvdbfdd ${FkUserAgent.webViewUserAgent}");
      return platformVersion;
    } on PlatformException {
      return "jgfdghjklhdfgdgghj";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            //  child: Image.file(File(widget.imagePath!))
          )
        ],
      ),
    );
  }
}
