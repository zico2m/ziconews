
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ziconews/view/Screens/Home.dart';

import '../core/Conest.dart';
import '../modle/Data_login.dart';
import 'package:http/http.dart' as http;



// class LogicSinin extends GetxController{
//
// final DataLogin logic1 =DataLogin();
// // final DataBase Dbdata=DataBase();
//
//
//   String? ValidatorName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'يرجى إدخال اسم المستخدم';
//     }
//     return null;
//   }
//
//   String? Validatoremail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'يرجى إدخال البريد الإلكتروني';
//     }
//     return null;
//   }
//
//   String? Validatorpassowrd(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'يرجى إدخال كلمة السر';
//     } else if (value.length < 6) {
//       return 'كلمة السر يجب أن تكون 6 أحرف على الأقل';
//     }
//     return null;
//   }
//
//
//
//   void togglePasswordVisibility() {
//     logic1.isPasswordVisible.value = !logic1.isPasswordVisible.value;
//   }
//
//
//   void Verificatoin() {
//     if (logic1.formKey.currentState!.validate()) {
//
//     } else {
//       Get.snackbar(
//         'خطأ',
//         'يرجى التحقق من إدخال الحقول بشكل صحيح',
//         backgroundColor: primary3,
//         snackPosition: SnackPosition.TOP,
//       );
//     }
//   }
//
//
//
// }

class LogicSinin extends GetxController {
  final DataLogin logic1 = DataLogin();

  String? ValidatorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال اسم المستخدم';
    }
    return null;
  }

  String? Validatoremail(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    return null;
  }

  String? Validatorpassowrd(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة السر';
    } else if (value.length < 6) {
      return 'كلمة السر يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  void togglePasswordVisibility() {
    logic1.isPasswordVisible.value = !logic1.isPasswordVisible.value;
  }

  Future<void> SignIn(String name, String email, String password) async {
    final uri = Uri.parse("http://10.0.2.2/Signup/auth/Sign_up.php");

    try {
      final response = await http.post(uri, body: {
        "name": name,
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        if (result['status'] == 'ok') {
          // final box = GetStorage();
          // box.write('isLoggedIn', true);
          // box.write('userEmail', email);
          // box.write('userName', name);


          logic1.EmailControler.clear();
          logic1.USername.clear();
          logic1.pass.clear();

          Get.snackbar("Success", "تم تسجيل الدخول بنجاح");
          Get.to(Home());
        } else {
          Get.snackbar("Error", result['message']);
        }
      } else {
        Get.snackbar("Error", "فشل الاتصال بالخادم");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "حدث خطأ ما");
    }
  }

  void Verificatoin() {
    if (logic1.formKey.currentState!.validate()) {

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

      Future.delayed(Duration(seconds: 3), () {
        Get.back(); // إغلاق مؤشر التحميل
        SignIn(logic1.USername.text, logic1.EmailControler.text, logic1.pass.text);


      });

    } else {
      Get.snackbar(
        'خطأ',
        'يرجى التحقق من إدخال الحقول بشكل صحيح',
        backgroundColor: primary3,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
