import 'package:flutter/material.dart';
import 'package:music_flutter_app/value/app_assets.dart';

class Home2Widget extends StatelessWidget {
  Size size;
  Home2Widget(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Image.asset(
              AppAssets.home3,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          //ParticleWidget(size),
          Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '30 : 05 : 2030',
                    style: TextStyle(
                        color: Color(0xffeeeeee),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.green,
                              offset: Offset(2, 3),
                              blurRadius: 5.0)
                        ]),
                  ),
                  Text(
                    'Coming soon!!',
                    style: TextStyle(
                        color: Color(0xffD1C4E9),
                        fontSize: 32,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.5),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
