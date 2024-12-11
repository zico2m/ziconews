import 'dart:ui';

import 'package:flutter/material.dart';

const primary = Color(0xff30006E);
// const primary1 = Color(0xff330045);
const primary1 = Color(0xff1A2430);
const primary2 = Color(0xff1F2F3F);
const primary3 = Colors.white;
const primary4 = Colors.blue;


abstract class Images{

 static const Image="assets/Images/sport.jpg";
 static const Image1="assets/Images/jj.webp";
 static const Image2="assets/Images/economic.jpg";
 static const Image22="assets/Images/net.webp";
 static const profil="assets/Images/prof.jpg";
 static const back="assets/Images/pack.jpg";
 // static const icon="assets/Images/zico.png";
 static const icon="assets/Images/icon.png";
 static const icon1="assets/Images/zico.jpg";
 static const icon2="assets/Images/zico.jpg";



}





class imageSlider{
 List imagePaths = <String>[

  Images.Image,
  Images.Image1,
  Images.Image2,

 ];
}





abstract class Styles{

 static const Title =TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  textBaseline: TextBaseline.ideographic,
  // color: primary3





 );
 static const TitleSmal =TextStyle(
     fontSize: 15,
    color: primary3,
    wordSpacing: 2,


 );
 static const Discrib =TextStyle(
  fontSize: 20,
// color: Colors.black


 );



}







