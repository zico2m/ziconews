import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modle/auth_service.dart';

class NewsController extends GetxController {
  // تخزين الأخبار
  var news = <dynamic>[].obs;

  final NewsService newsService = NewsService();

  @override
  void onInit() {
    super.onInit();
    fetchNews(); // جلب الأخبار عند تحميل الصفحة
  }

  // دالة لجلب الأخبار
  Future<void> fetchNews() async {
    try {
      final fetchedNews = await newsService.fetchNews(); // جلب الأخبار من الخدمة
      news.value = fetchedNews; // تحديث البيانات
    } catch (e) {
      print("Error: $e");
    }
  }
}

