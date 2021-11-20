import 'package:flutter/material.dart';
import 'package:music_flutter_app/value/app_assets.dart';

class Home1Widget extends StatelessWidget {
  Size size;
  Home1Widget(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      //clipBehavior: Clip.antiAlias,
      //decoration: BoxDecoration(),
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Image.asset(
          AppAssets.home1,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        //ParticleWidget(size),
        Container(
          margin: const EdgeInsets.only(bottom: 200.0),
          alignment: Alignment.center,
          child: const Text(
            'Amber hub',
            style: TextStyle(
                color: Color(0xffbbbbbb),
                fontSize: 45,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      color: Color(0xffaaaaaa),
                      offset: Offset(2, 3),
                      blurRadius: 5.0)
                ]),
          ),
        )
      ]),
    );
  }
}
