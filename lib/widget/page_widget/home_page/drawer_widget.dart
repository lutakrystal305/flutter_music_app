import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/pages/creator_page.dart';
import 'package:music_flutter_app/pages/home_page.dart';
import 'package:music_flutter_app/pages/song_page.dart';
import 'package:music_flutter_app/value/app_assets.dart';
import 'package:music_flutter_app/widget/app_button.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green[900],
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Color(0xffaaaaaa),
                        style: BorderStyle.solid)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: const Text(
                        'Amber hub',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            AppButton(
                label: 'Home',
                onTap: () {
                  Navigator.push(
                      context,
                      // ignore: prefer_const_constructors
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            AppButton(
                label: 'Chilly',
                onTap: () {
                  Navigator.push(
                      context,
                      // ignore: prefer_const_constructors
                      MaterialPageRoute(builder: (context) => SongPage()));
                }),
            AppButton(
                label: 'Creator',
                onTap: () {
                  Navigator.push(
                      context,
                      // ignore: prefer_const_constructors
                      MaterialPageRoute(builder: (context) => CreatorPage()));
                })
          ],
        ),
      ),
    );
  }
}
