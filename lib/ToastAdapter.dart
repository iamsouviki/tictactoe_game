import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastAdapter{
  on200(String msg){
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black.withOpacity(0.1),
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
      fontSize: 16,
      webBgColor: "linear-gradient(to right, #000000, #000000)",
      webPosition: "center"
    );
  }
  on500(String msg){
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
      fontSize: 16,
      webBgColor: "linear-gradient(to right, #FF0000, #FF0000)",
      webPosition: "center"
    );
  }
}