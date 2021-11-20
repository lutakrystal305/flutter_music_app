//import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_flutter_app/bloc/audio_bloc.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/bloc/songs_bloc.dart';
import 'package:music_flutter_app/pages/each_song_page.dart';
import 'package:music_flutter_app/value/music_home.dart';

class Home4Widget extends StatefulWidget {
  Size size;
  Home4Widget(this.size, {Key? key}) : super(key: key);

  @override
  _Home4WidgetState createState() => _Home4WidgetState();
}

class _Home4WidgetState extends State<Home4Widget> {
  // AudioCache audioCache = AudioCache();
  // AudioPlayer audioPlayer = AudioPlayer();
  final PageController _pageController = PageController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final _audioBloc = BlocProvider.of<AudioBloc>(context);
    final _songBloc = BlocProvider.of<SongsBloc>(context);
    return Container(
      width: widget.size.width,
      //height: widget.size.height,
      padding: const EdgeInsets.all(10.0),
      //clipBehavior: Clip.antiAlias,
      //decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Text(
                'Child with this song!!',
                style: TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          ListView.builder(
              //controller: _pageController,
              shrinkWrap: true,
              itemCount: music_home.length,
              itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color(0xffaaaaaa),
                                style: BorderStyle.solid))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          music_home[index].img!,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        Column(
                          children: [
                            Text(music_home[index].singer!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1.3,
                                  color: Color(0xffeeeeee),
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              music_home[index].singer!,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff999999),
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                        IconButton(
                            color: Colors.green[900],
                            onPressed: () {
                              _audioBloc!.onClick(music_home[index],
                                  music_home[index].singer!, music_home);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EachSongPage()));
                            },
                            icon: Icon(Icons.play_circle))
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
