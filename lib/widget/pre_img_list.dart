import 'package:flutter/cupertino.dart';
import 'package:music_flutter_app/value/pre_img.dart';

List<Widget> preImgList(Size size) => preImgs
    .map((e) => Container(
          clipBehavior: Clip.antiAlias,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(),
          child: Image.asset(
            e,
            fit: BoxFit.cover,
          ),
        ))
    .toList();
