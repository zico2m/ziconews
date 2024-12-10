import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../Core/Conest.dart';

class Detiles extends StatelessWidget {
  final String title1;
  final String description1;
  final String imagePath1;

  Detiles({
    required this.title1,
    required this.description1,
    required this.imagePath1,
  });
  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath1),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title1,
                    textDirection: TextDirection.ltr, style: Styles.Title),
                SizedBox(height: 8),
                Text(
                  description1,
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
