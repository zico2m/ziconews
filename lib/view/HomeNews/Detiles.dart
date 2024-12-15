import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';

import '../../Core/Conest.dart';
import '../../controller/NewsPostControler.dart';
import 'fav.dart';

class Detiles extends StatelessWidget {
  final FavoritesController favoritesController = Get.put(FavoritesController());

  final dynamic listnews;


  Detiles({
   this.listnews
  });
  @override
  Widget build(BuildContext context) {
    final String formattedDate = formatDate(listnews['datae']);

    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل الخبر"),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: ListView(
          children: [



            Container(
              width: double.infinity,
              height: 250,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black26,
              //       blurRadius: 8,
              //       offset: Offset(0, 4),
              //     ),
              //   ],
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //       image: Image.network(),
              //   ),
              // ),

             child: Image.network('http://10.0.2.2/Signup${listnews['imagee']}',
             errorBuilder:  (context,error,stckTrack){
               return Container(

                 height: 400,
                 color: Colors.grey,
                 child: Center(
                   child: Text("error in photo"),

                 ),

               );

             },
               width: 250,
                fit: BoxFit.cover,
             ),

            ),
            SizedBox(height: 10),

            Text(
              textDirection: TextDirection.rtl,
              "تاريخ النشر: $formattedDate",
              style: TextStyle(
                fontSize: 15,
                // color: Colors.black,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(listnews['title']?? "erre in title",
                    textDirection: TextDirection.rtl,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,textBaseline: TextBaseline.alphabetic ),),
                SizedBox(height: 8),
                Text(
                  listnews['content'],
                  textDirection: TextDirection.rtl,
                  style: Styles.Discrib,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 70,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      size: 30,
                      // color: isFavorite ? Colors.yellow : Colors.grey,
                    ),
                    onPressed: () {
                      // _addToFavorites(context);

                      favoritesController.toggleFavorite(listnews);


                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share_rounded, size: 30),
                    onPressed: () {
                      // إضافة الوظيفة عند الضغط
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.save_alt, size: 30),
                    onPressed: () {
                      // إضافة الوظيفة عند الضغط
                    },
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: LikeButton(
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
