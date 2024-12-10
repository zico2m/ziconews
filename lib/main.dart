
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ziconews/view/Login/View_body.dart';

void main() async {

  runApp( GetMaterialApp(

    home: ViewBodyLogin(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
  )
  );
}




