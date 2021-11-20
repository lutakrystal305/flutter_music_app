import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_flutter_app/value/app_assets.dart';

class Home5Widget extends StatelessWidget {
  Size size;
  Home5Widget(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: size.width - 20,
            height: size.height * 3 / 4,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xff76ff03),
                  offset: Offset(2, 4),
                  blurRadius: 5.0)
            ]),
            child: Image.asset(
              AppAssets.creator,
              fit: BoxFit.cover,
              width: size.width - 20,
              height: size.height * 3 / 4,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Luta Krystal',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent,
                        letterSpacing: 1.5),
                  )),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: const Text('Creator',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffccff90),
                        fontStyle: FontStyle.italic)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Color(0xffc5e1a5),
                        style: BorderStyle.solid)),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.2)),
                      child: const Text(
                        'Read more!',
                        style: TextStyle(
                            color: Color(0xff00e5ff),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
