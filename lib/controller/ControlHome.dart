
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Core/Conest.dart';

class Controlhome extends GetxController {
  final imageSlider imageSlider1 = imageSlider();
  final PageController controller = PageController();

  var currentTime = "".obs;

  @override
  void onInit() {
    super.onInit();
    // تحديث الوقت كل ثانية
    Timer.periodic(Duration(seconds: 1), (timer) {
      currentTime.value = _getCurrentTime();
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final formattedTime =
        DateFormat('hh:mm a').format(now); // تنسيق الوقت بتنسيق 12 ساعة
    return formattedTime;
  }

  var corentindexpage = 0.obs;

  void changepage(int index) {
    corentindexpage.value = index;
  }









}
//
