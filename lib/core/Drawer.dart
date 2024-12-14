import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/Logic_Login.dart';
import '../view/Login/LogIn.dart';
import '../view/Screens/profaile.dart';
import 'Conest.dart';
import 'Function.dart';

class Drwer extends StatelessWidget {


  final box = GetStorage();


  @override
  Widget build(BuildContext context) {

    // String name = box.read('name') ?? 'اسم غير متوفر';
    // String email = box.read('email') ?? 'بريد غير متوفر';

    // TODO: implement build
    return Drawer(
      width: 250,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
            onTap: () {
              Get.to(() => Profaile(),
                  transition: Transition.rightToLeft
              );
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
              color: primary2

              ),

              accountName: Text(
                 box.read('name'),


                style:TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                box.read('email'),
                style: Styles.Discrib,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assetName") ,

              ),
            )),

        NwesRow(function: () {}, icon: Icons.home, text: "HOME"),
        Divider(),
        NwesRow(
            function: () {
              // Get.to(Setting());
            },
            icon: Icons.settings,
            text: "Settinge"),
        Divider(),
        NwesRow(function: () {}, icon: Icons.privacy_tip, text: "Security "),

        Divider(),
            NwesRow(function: () {
              Functions.Theme();

             },
                icon: Icons.dark_mode_outlined , text: "theme ",


            ),


            Divider(),



        NwesRow(
            function: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>

              //     home()));
              box.remove('isLoggedIn');
              box.remove('name');
              box.remove('email');
              Get.snackbar('تسجيل الخروج', 'تم تسجيل الخروج بنجاح');
              Get.offAll(() => LogInPage1());

            },
            icon: Icons.logout_sharp,
            text: "Log Out"),
      ]),
    );
  }
}

Widget NwesRow({
  final IconData? icon,
  final String? text,
  required Function() function,
}) {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      child: IconButton(
        onPressed: function,
        icon: Icon(icon),
      ),
    ),
    title: Text(
      text!,
      style: TextStyle(fontSize: 20),
    ),
    onTap: () {
      function;
    },
  );
}


// class Drwer extends StatelessWidget {
//   final box = GetStorage();
//
//   @override
//   Widget build(BuildContext context) {
//     // استرجاع البيانات المخزنة من GetStorage
//     String userName = box.read('name') ;
//     String userEmail = box.read('email') ;
//
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             accountName: Text(userName),  // استخدام اسم المستخدم من GetStorage
//             accountEmail: Text(userEmail),  // استخدام البريد الإلكتروني من GetStorage
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.orange,
//               child: Text(
//                 userName.isNotEmpty ? userName[0].toUpperCase() : '',
//                 style: TextStyle(fontSize: 40.0),
//               ),
//             ),
//           ),
//           // باقي عناصر الـ Drawer
//         ],
//       ),
//     );
//   }
// }
