import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/Conest.dart';
import '../modle/Data_login.dart';
import '../view/Screens/HomaBasic.dart';

class LogInLogic extends GetxController {
  final Data = DataLogin();

  String? Validatoremail(String? value) {
    if (value!.isEmpty) {
      Data.EmileEnter.value = 'ادخل البريد الإلكتروني';
      return Data.EmileEnter.value;
    }
    Data.EmileEnter.value='';
    return null;
  }

  String? Validatorpassowrd(String? value) {
    if (value!.isEmpty) {
      Data.PasswordEnter.value = 'ادخل كلمة المرور';
      return Data.PasswordEnter.value;
    }
    Data.PasswordEnter.value = '';
    return null;
  }

  void togglePasswordVisibility() {
    Data.isPasswordVisible.value = !Data.isPasswordVisible.value;
  }



  void Verification() {
    if (Data.formKey.currentState!.validate()) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(

            color: Colors.yellow,
            backgroundColor: Colors.blue,
           strokeWidth:5 ,

          ),
        ),
        barrierDismissible: false,
        barrierColor: primary1.withOpacity(0.5),

      );

      // محاكاة تأخير العملية (للاختبار فقط)
      Future.delayed(Duration(seconds: 3), () {
        Get.back(); // إغلاق مؤشر التحميل

        if (Data.EmailControler.text == 'zico' && Data.pass.text == '12') {
          Get.to(
            () => Homabasic(),
            transition: Transition.size,
          );
        } else {
          Get.snackbar(
            'خطأ',
            'يرجى التحقق من كلمة السر او البريد',
            backgroundColor: Colors.orange,
            snackPosition: SnackPosition.TOP,
          );
        }
      });
    }
  }





  
}

