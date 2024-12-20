import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziconews/Core/Conest.dart';
import '../../controller/NewsPostControler.dart';
import '../Widgets/Widget.dart';
import 'Detiles.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        title: Text("الأخبار"),
      ),
      body: Obx(() {
        // استخدام StreamBuilder مع Stream الأخبار
        return StreamBuilder<List<dynamic>>(
          stream: controller.newsStream.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.yellow,
                  strokeWidth: 5,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                  child: Text("خطأ في جلب البيانات: ${snapshot.error}"));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Container(
                width: 140,
                child: Card(
                    child: Row(
                  children: [
                    Text("لا توجد أخبار متاحة"),
                    Icon(
                      Icons.newspaper,
                      size: 20,
                      color: Colors.blueAccent,
                    )
                  ],
                )),
              ));
            }

            final newsList = snapshot.data!;

            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final item = newsList[index];
                // final String publishDate = item['datae'] ?? "
                // تاريخ غير متوفر"; // تاريخ النشر
                final String formattedDate = formatDate(item['datae']);
                return GestureDetector(
                  onTap: () {
                    // الانتقال إلى صفحة التفاصيل مع الأنيميشن
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Detiles(listnews: item),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
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
                                child:
                                    Center(child: Text("خطأ في تحميل الصورة")),
                              );
                            },
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                      Images.icon,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      textDirection: TextDirection.rtl,
                                      item['title'] ?? "عنوان غير متوفر",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                maxLines: 3,
                                textDirection: TextDirection.rtl,
                                item['content'] ?? "محتوى غير متوفر",
                                style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
          },
        );
      }),
    );
  }
}
