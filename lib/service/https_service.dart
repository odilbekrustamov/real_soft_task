import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../log_service.dart';

class Network {
  static String BASE = "api.ijtimoiy-himoya.uz";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer e0703e6d-e540-4a9c-a90c-12a2739b177a',
  };

  static String API_LIST = "/api/v1/flutter/need_treatment";

  static Future<String?> GET(String api, Map<String, String> params) async{

    var uri = Uri.https(BASE, api, params);

    var response = await get(uri, headers: headers);
    LogService.i(response.body);
    LogService.i(uri.toString());
    if(response.statusCode == 200){
      return response.body;
    }else{
      return null;
    }
  }


  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }
}
