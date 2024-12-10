import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class Functions {


  static void Theme(){
   if (Get.isDarkMode) {
     Get.changeTheme(ThemeData.light());
   } else {
     Get.changeTheme(ThemeData.dark());
   }
 }

}