import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Device {
  static final Device _instance = Device._internal();
  factory Device() {
    return _instance;
  }
  Device._internal();

  /// 屏幕宽度
  double get screenW {
    return Get.width;
  }
  /// 屏幕高度
  double get screenH {
    return Get.height;
  }
}