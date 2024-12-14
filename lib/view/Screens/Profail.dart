import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Core/Conest.dart';
import 'dd.dart';

class Profail extends StatelessWidget {
  const Profail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

body: Center(
  child: ElevatedButton(onPressed: (){

    // Get.to(NewsPage());

  }, child: Text("data")),
),

    );
  }
}




//
// class NewsPage extends StatefulWidget {
//   @override
//   _NewsPageState createState() => _NewsPageState();
// }
//
// class _NewsPageState extends State<NewsPage> {
//   final NewsService newsService = NewsService(); // إنشاء كائن من خدمة الأخبار
//   List<dynamic> news = []; // تخزين الأخبار
//
//   @override
//   void initState() {
//     super.initState();
//     fetchNews(); // جلب الأخبار عند تحميل الصفحة
//     setState(() {
//
//     });
//   }
//
//   // دالة لجلب الأخبار
//   Future<void> fetchNews() async {
//     try {
//       final fetchedNews = await newsService.fetchNews(); // جلب الأخبار من الخدمة
//       setState(() {
//         news = fetchedNews;
//       });
//     } catch (e) {
//       print("Error: $e");
//     }
// setState(() {
//
// });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("الأخبار"),
//       ),
//       body: news.isEmpty
//           ? Center(child: CircularProgressIndicator()) // عرض مؤشر التحميل إذا كانت الأخبار فارغة
//           : ListView.builder(
//         itemCount: news.length, // عدد الأخبار
//         itemBuilder: (context, index) {
//           final item = news[index];
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // عرض الصورة إذا كانت موجودة
//                 // عرض الصورة إذا كانت موجودة
//                 if (item['imagee'] != null)
//                   Image.network(
//                     'http://10.0.2.2/Signup${item['imagee']}', // يجب أن تكون الصورة في URL الصحيح
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: 200,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         height: 200,
//                         color: Colors.grey,
//                         child: Center(child: Text("خطأ في تحميل الصورة")),
//                       );
//                     },
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item['title'] ?? "عنوان غير متوفر",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         item['content'] ?? "محتوى غير متوفر",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//           );
//
//         },
//
//       ),
//     );
//   }
// }
