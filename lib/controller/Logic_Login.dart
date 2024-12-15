import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../core/Conest.dart';
import '../modle/Data_login.dart';
import '../modle/auth_service.dart';
import '../view/Screens/HomaBasic.dart';

class LogInLogic extends GetxController {
  final AuthService authService = AuthService();
  final box = GetStorage();
  final Data = DataLogin();

  String? Validatoremail(String? value) {
    if (value!.isEmpty) {
      Data.EmileEnter.value = 'ادخل البريد الإلكتروني';
      return Data.EmileEnter.value;
    }
    Data.EmileEnter.value = '';
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

  Future<void> SignIn() async {
    final response =
        await authService.signIn(Data.EmailControler.text, Data.pass.text);

    if (response['status'] == 'ok') {
      box.write('isLoggedIn', true);
      Data.USername.clear();
      Data.EmailControler.clear();
      Data.pass.clear();

      Get.snackbar("Success", "تم التسجيل بنجاح");
      Get.to(Homabasic()); // الانتقال إلى الصفحة الرئيسية
    } else {
      Get.snackbar("Error", response['message']);
    }
  }

  void Verification() {
    if (Data.formKey.currentState!.validate()) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
            backgroundColor: Colors.blue,
            strokeWidth: 5,
          ),
        ),
        barrierDismissible: false,
        barrierColor: primary1.withOpacity(0.5),
      );

      // محاكاة تأخير العملية (للاختبار فقط)
      Future.delayed(Duration(seconds: 3), () {
        Get.back(); // إغلاق مؤشر التحميل

        SignIn();
      });
    }
  }
}
