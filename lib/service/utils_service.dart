import 'package:flutter/material.dart';
import 'package:m_toast/m_toast.dart';

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

}