  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
import 'package:intl/intl.dart';
  import '../modle/auth_service.dart';

  // class NewsController extends GetxController {
  //   // تخزين الأخبار
  //   var news = <dynamic>[].obs;
  //
  //   final NewsService newsService = NewsService();
  //
  //   @override
  //   void onInit() {
  //     super.onInit();
  //     fetchNews(); // جلب الأخبار عند تحميل الصفحة
  //   }
  //
  //   // دالة لجلب الأخبار
  //   Future<void> fetchNews() async {
  //     try {
  //       final fetchedNews = await newsService.fetchNews(); // جلب الأخبار من الخدمة
  //       news.value = fetchedNews; // تحديث البيانات
  //     } catch (e) {
  //       print("Error: $e");
  //     }
  //   }
  // }




  class NewsController extends GetxController {
    final AuthService newsService = AuthService();

    // الأخبار كـ RxList مرتبطة بـ Stream
    var newsStream = Stream<List<dynamic>>.empty().obs;

    @override
    void onInit() {
      super.onInit();
      newsStream.value = newsService.fetchNewsStream(); // تعيين Stream عند التهيئة
    }
  }

  String formatDate(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    return DateFormat('MM-dd-yyyy').format(date); // صيغة اليوم الشهر السنة
  }
