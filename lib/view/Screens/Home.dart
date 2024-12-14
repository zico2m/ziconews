import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:get/get.dart';

import '../../Core/Conest.dart';
import '../../controller/ControlHome.dart';
import '../HomeNews/HomeNews.dart';
import '../HomeNews/NewsPost.dart';

class Home extends StatelessWidget {
  final Controlhome control = Get.put(Controlhome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                controller: control.controller,
                itemCount: control.imageSlider1.imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    control.imageSlider1.imagePaths[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: control.controller,
                    count: control.imageSlider1.imagePaths.length,
                    effect: WormEffect(
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (k) => Homenews()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'News',
                          style: Styles.Title,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "live News ",
                          textAlign: TextAlign.center,
                          style: Styles.TitleSmal,
                        )
                      ],
                    ),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primary1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(5, 5),
                          ),
                        ]),
                  ),
                )),
            InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (k)=>News()));
                  Navigator.push(context, MaterialPageRoute(builder: (k)=>NewsPage()));

                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('News', style: Styles.Title),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Last News In The world",
                          textAlign: TextAlign.center,
                          style: Styles.TitleSmal,
                        )
                      ],
                    ),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primary1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(5, 5),
                          ),
                        ]),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (k)=>News()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('News', style: Styles.Title),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "dnvdljvkdvjknln hvhzdvhzk cdhjvzjk ",
                          textAlign: TextAlign.center,
                          style: Styles.TitleSmal,
                        )
                      ],
                    ),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primary1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(5, 5),
                          ),
                        ]),
                  ),
                )),
            InkWell(
                onTap: () {
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('News', style: Styles.Title),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "dnvdljvkdvjknkllk ",
                          textAlign: TextAlign.center,
                          style: Styles.TitleSmal,
                        )
                      ],
                    ),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primary1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(5, 5),
                          ),
                        ]),
                  ),
                )),
          ],
        ),
      ]),
    );
  }
}

