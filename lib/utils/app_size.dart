import 'package:flutter/material.dart';

class AppSize {
  static getDeviceWith(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
