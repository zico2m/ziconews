import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controller/NewsPostControler.dart';
import 'Detiles.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // إنشاء كائن من الـ NewsController
    final NewsController controller = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        title: Text("الأخبار"),
      ),
      body: Obx(() {
        // مراقبة التغيير في الأخبار باستخدام Obx
        if (controller.news.isEmpty) {
          return Center(child: CircularProgressIndicator(
            color: Colors.red,
            backgroundColor: Colors.yellow,
            strokeWidth: 5,

          )); // عرض مؤشر التحميل إذا كانت الأخبار فارغة
        } else {
          return ListView.builder(
            itemCount: controller.news.length, // عدد الأخبار
            itemBuilder: (context, index) {
              final item = controller.news[index];
              return GestureDetector(

                onTap: () {
                  // الانتقال إلى صفحة التفاصيل مع الأنيميشن
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Detiles(listnews: item),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {

                        // تعريف نوع الأنيميشن
                        const begin = Offset(1.0, 2.0); // الصفحة تبدأ من اليمين
                        const end = Offset.zero; // تنتهي في مكانها الطبيعي
                        const curve = Curves.ease;

                        Tween(begin: begin, end: curve).chain(CurveTween(curve: Curves.decelerate));
                        // var offsetAnimation = animation.drive(tween);

                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );

                      },
                    ),
                  );
                },



                child: Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // عرض الصورة إذا كانت موجودة
                      if (item['imagee'] != null)
                        Image.network(
                          'http://10.0.2.2/Signup${item['imagee']}',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey,
                              child: Center(child: Text("خطأ في تحميل الصورة")),
                            );
                          },
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] ?? "عنوان غير متوفر",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              maxLines: 3,

                              textDirection: TextDirection.rtl,
                              item['content'] ?? "محتوى غير متوفر",
                              style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}