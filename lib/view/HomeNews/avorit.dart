// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'fav.dart';
//
// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final FavoritesController favoritesController = Get.find();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("المفضلات"),
//       ),
//       body: Obx(() {
//         if (favoritesController.favorites.isEmpty) {
//           return Center(
//             child: Text("لا توجد مفضلات حالياً"),
//           );
//         } else {
//           return ListView.builder(
//             itemCount: favoritesController.favorites.length,
//             itemBuilder: (context, index) {
//               final item = favoritesController.favorites[index];
//               return Card(
//                 margin: EdgeInsets.all(8.0),
//                 child: ListTile(
//                   title: Text(item['title'] ?? "عنوان غير متوفر"),
//                   subtitle: Text(item['content'] ?? "محتوى غير متوفر"),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red),
//                     onPressed: () {
//                       favoritesController.toggleFavorite(item);
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
