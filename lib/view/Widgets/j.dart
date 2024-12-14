import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Roww extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [

        Text("data"),


      ],
    );
  }
}

abstract class Widgets{


 static const row =Row(
   mainAxisSize: MainAxisSize.max,
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,

   children: [
     FaIcon(
       FontAwesomeIcons.apple,
       size: 40,
       color: Colors.yellow,
     ),

     FaIcon(
       FontAwesomeIcons.facebook,
       size: 40,
       color: Colors.blue,
     ),

     FaIcon(
       FontAwesomeIcons.twitter,
       size: 40,
       color: Colors.blue,
     ),

   ],
 ) ;


 static var row1=Row(
   children: [

     Container(
       margin: EdgeInsets.only(left: 30),
       height: 1,
       width: 150,
       color: Colors.white.withOpacity(0.5),
     ),
     const SizedBox(
       width: 20,
     ),
     const Text(
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


}