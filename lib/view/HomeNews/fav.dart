import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var favorites = <dynamic>[].obs; // قائمة المفضلات

  // إضافة أو إزالة عنصر من المفضلات
  void toggleFavorite(dynamic newsItem) {
    if (favorites.contains(newsItem)) {
      favorites.remove(newsItem); // إزالة إذا كان موجودًا
      Get.snackbar("Error", 'message');

    } else {
      favorites.add(newsItem); // إضافة إذا لم يكن موجودًا
      Get.snackbar("Error",'kkjmkmkl');

    }
  }

  // التحقق إذا كان العنصر مضافًا بالفعل
  bool isFavorite(dynamic newsItem) {
    return favorites.contains(newsItem);
  }
}
