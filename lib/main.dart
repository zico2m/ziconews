import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ziconews/view/Login/LogIn.dart';
import 'package:ziconews/view/Screens/HomaBasic.dart';

void main() async {
  await GetStorage.init();
  runApp(AppNews());
}

class AppNews extends StatelessWidget {
  const AppNews({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool isLoggedIn = box.read('isLoggedIn') ?? false;
    return GetMaterialApp(
      home: isLoggedIn ? Homabasic() : LogInPage1(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}
