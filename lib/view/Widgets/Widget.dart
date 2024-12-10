import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextFormField1({
  String? hintText,
  TextEditingController? controller,
  String? Function(String?)? validator,
  String? Function(String?)? onhange,
  Color fillColor = Colors.white,
  Color avatarColor = Colors.blue,
  IconData icon = Icons.person,
}) {
  return Container(
    margin: EdgeInsets.only(left: 35),
    width: 350,
    child: Stack(
      children: [
        TextFormField(
          onChanged: onhange,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(),
            contentPadding: EdgeInsets.only(top: 40),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          textAlign: TextAlign.center,
          controller: controller,
          validator: validator,
        ),
        Positioned(
          left: 287,
          child: CircleAvatar(
            backgroundColor: avatarColor,
            child: Icon(icon),
            radius: 32,
          ),
        ),
      ],
    ),
  );
}


Widget customButton({
  required VoidCallback onPressed,
  required Widget child, // إضافة الـ Widget child بدل النص
  Color color = Colors.blue,
  double width = 350,
  double height = 60,
  double borderRadius = 20,
  EdgeInsets margin = const EdgeInsets.only(left: 30),
}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    margin: margin,
    width: width,
    height: height,
    child: MaterialButton(
      onPressed: onPressed,

      child: Center(
        child: child, // يتم عرض أي ويدجت تمرره
      ),
    ),
  );
}




Widget customPasswordFormField({
  TextEditingController? controller,
  String? Function(String?)? validator,
  required RxBool isPasswordVisible,
  // String? Function(String?)? validator,

  required void Function() togglePasswordVisibility,
  required Color fillColor,
  String hintText = 'Password',
}) {
  return Container(
    margin: EdgeInsets.only(left: 35),
    width: 350,
    child: Stack(
      children: [
        Obx(() => TextFormField(  // إحاطة TextFormField بـ Obx لضمان التحديث
          controller: controller,
          obscureText: !isPasswordVisible.value,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          textAlign: TextAlign.center,
        )),
        Positioned(
          left: 287,
          child: GestureDetector(
            onTap: togglePasswordVisibility,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Obx(() => Icon(
                isPasswordVisible.value ? Icons.visibility : Icons.visibility_off_outlined,
                color: isPasswordVisible.value ? Colors.red : Colors.black,
              )),
              radius: 32,
            ),
          ),
        ),
      ],
    ),
  );
}


Widget Roww({
  List<Widget>? children

})=> Row(
children: [
Container(
margin: EdgeInsets.only(left: 30),
height: 1,
width: 150,
color: Colors.white.withOpacity(0.5),
),
SizedBox(
width: 20,
),
Text(
"OR",
style: TextStyle(color: Colors.blue, fontSize: 20),
),
Container(
margin: EdgeInsets.only(left: 20),
height: 1,
width: 150,
color: Colors.white.withOpacity(0.5),
),
],
);



Widget Fcebook({

  String? h="",

})=> Container(

child: Row(

mainAxisSize: MainAxisSize.max
,
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
FaIcon(
FontAwesomeIcons.apple,
size: 40,
color: Colors.yellow.shade300,
),

FaIcon(
FontAwesomeIcons.facebook,
size: 40,
color: Colors.blue,
),
// SizedBox(
//   width: 40,
// ),
FaIcon(
FontAwesomeIcons.twitter,
size: 40,
color: Colors.blue,
),
],
),
);





