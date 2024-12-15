import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziconews/Core/Conest.dart';
import 'package:ziconews/view/HomeNews/Detiles.dart';
import 'fav.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: Text("المفضلات"),
      ),
      body: Obx(() {
        if (favoritesController.favorites.isEmpty) {
          return Center(
            child: Text("لا توجد مفضلات حالياً"),
          );
        } else {
          return ListView.builder(
            itemCount: favoritesController.favorites.length,
            itemBuilder: (context, index) {
              final item = favoritesController.favorites[index];
              return GestureDetector(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>Detiles(listnews: item,)));

                },
                child: Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      'http://10.0.2.2/Signup${item['imagee']}',
                    ),
                    title: Text(item['title'] ?? "عنوان غير متوفر",
                    maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(item['content'] ?? "محتوى غير متوفر",
                      maxLines: 3,


                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        favoritesController.toggleFavorite(item);
                      },
                    ),
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
