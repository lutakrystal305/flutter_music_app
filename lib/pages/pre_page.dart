import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/pages/home_page.dart';
import 'package:music_flutter_app/value/app_assets.dart';
import 'package:music_flutter_app/value/pre_img.dart';
import 'package:music_flutter_app/widget/pre_img_list.dart';

class PrePage extends StatefulWidget {
  const PrePage({Key? key}) : super(key: key);

  @override
  _PrePageState createState() => _PrePageState();
}

class _PrePageState extends State<PrePage> {
  int _current = 0;
  //final CarouselController _carouselController = CarouselController();
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_current < 4) {
        _current++;
      } else {
        _current = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _current,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    _current = 100;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_pageController.animateToPage(page, duration: duration, curve: curve)
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0d1117),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(),
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          // CarouselSlider(
          //   items: preImgList(size),
          //   carouselController: _carouselController,
          //   options: CarouselOptions(
          //       height: size.height,
          //       viewportFraction: 1.0,
          //       autoPlay: true,
          //       enlargeCenterPage: true,
          //       aspectRatio: 2.0,
          //       onPageChanged: (index, reason) {
          //         setState(() {
          //           _current = index;
          //         });
          //       }),
          // ),

          PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              itemCount: preImgs.length,
              itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: size.height,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset(preImgs[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity),
                  )),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              //clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                  const Text('Amber hub',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic))
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(top: 150, left: 50, right: 50),
              child: const Text(
                'Welcome to Music hub that contain best song, best porn, festival, ...',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xffdddddd),
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Container(
            //color: Colors.green[900],
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              child: const Text("Let's go"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: preImgs.map((e) {
              var index = preImgs.indexWhere((x) => x == e);
              //print('index:  $index');
              //print('current: $_current');
              return Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                        .withOpacity(_current == index ? 0.9 : 0.4)),
              );
            }).toList(),
          )
        ]),
      ),
    );
  }
}
