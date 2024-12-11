import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Conest.dart';
import 'Function.dart';

class Drwer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      width: 250,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
            onTap: () {
              // Get.to(() => Profail(),
              //     transition: Transition.rightToLeft
              // );
            },
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Zico2m",
                style: TextStyle(),
              ),
              accountEmail: Text(
                "zico2001s@yahoo.com",
                style: TextStyle(),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(Images.Image1),
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
