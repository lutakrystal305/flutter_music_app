import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/audio_bloc.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/models/music_model.dart';
import 'package:music_flutter_app/widget/flow_widget.dart';
import 'package:music_flutter_app/widget/songs_widget/progress_indicator_widget.dart';

class EachSongPage extends StatefulWidget {
  const EachSongPage({Key? key}) : super(key: key);

  @override
  _EachSongPageState createState() => _EachSongPageState();
}

class _EachSongPageState extends State<EachSongPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AudioBloc _audioBloc;
  //late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _audioBloc = BlocProvider.of<AudioBloc>(context)!;

    super.initState();

    _audioBloc.onPlay();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final _audioBloc = BlocProvider.of<AudioBloc>(context);
    Size size = MediaQuery.of(context).size;
    AppBar appBar = AppBar(
      title: Text(_audioBloc.currentSongNameValue!),
      backgroundColor: Colors.green[900],
    );
    double appBarHeight = appBar.preferredSize.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      backgroundColor: Color(0xff0d1117),
      body: Container(
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: _audioBloc.currentSong,
              builder: (context, AsyncSnapshot<Songs> snapshot) {
                // print(snapshot.data!.img);
                return snapshot.hasData
                    ? Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Image.network(
                                snapshot.data!.img!,
                                fit: BoxFit.cover,
                                width: size.width,
                                height: size.height - appBarHeight,
                              ),
                              Container(
                                color: Colors.green[700]!.withOpacity(0.7),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional.centerEnd,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          //margin: const EdgeInsets.only(bottom: 50),
                                          padding: const EdgeInsets.all(10.0),
                                          //color: Colors.cyan,
                                          child: Text(
                                            snapshot.data!.song!,
                                            style: const TextStyle(
                                                color: Color(0xffeeeeee),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () => showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: Text(
                                                        "${snapshot.data!.singer}'s song"),
                                                    content: Container(
                                                      height: 150.0,
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: _audioBloc
                                                              .currentSongsValue
                                                              .map((e) =>
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      _audioBloc.onClick(
                                                                          e,
                                                                          snapshot
                                                                              .data!
                                                                              .singer!,
                                                                          _audioBloc
                                                                              .currentSongsValue);
                                                                      _audioBloc
                                                                          .onPlay();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              border: Border(bottom: BorderSide(width: 1, color: Color(0xffaaaaaa)))),
                                                                      child:
                                                                          Text(
                                                                        e.song,
                                                                        style: TextStyle(
                                                                            color: e.song == snapshot.data!.song!
                                                                                ? Colors.redAccent[400]
                                                                                : Colors.black),
                                                                      ),
                                                                    ),
                                                                  ))
                                                              .toList(),
                                                        ),
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel'),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            icon: Icon(Icons.menu))
                                      ],
                                    ),
                                    Text(snapshot.data!.singer!,
                                        style: const TextStyle(
                                            color: Color(0xffcccccc),
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic)),
                                    StreamBuilder(
                                        stream: _audioBloc.totalDuration,
                                        builder: (context,
                                            AsyncSnapshot<Duration> snapshot) {
                                          return snapshot.hasData
                                              ? ProgressIndicatorWidget(
                                                  snapshot.data!)
                                              : Container();
                                        }),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _audioBloc.onPreSong();
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                            Color(0xffaaaaaa),
                                                        style:
                                                            BorderStyle.solid)),
                                                child:
                                                    Icon(Icons.skip_previous)),
                                          ),
                                          StreamBuilder(
                                              stream: _audioBloc.checkPlay,
                                              builder: (context,
                                                  AsyncSnapshot<bool>
                                                      snapshot) {
                                                return snapshot.hasData
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          if (snapshot.data!) {
                                                            _audioBloc
                                                                .onPause();
                                                          } else {
                                                            _audioBloc.onPlay();
                                                          }
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    width: 2,
                                                                    color: const Color(
                                                                        0xffaaaaaa),
                                                                    style: BorderStyle
                                                                        .solid)),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15.0),
                                                            child: Icon(
                                                              snapshot.data!
                                                                  ? Icons
                                                                      .pause_outlined
                                                                  : Icons
                                                                      .play_arrow,
                                                              size: 30.0,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      )
                                                    : Container();
                                              }),
                                          GestureDetector(
                                            onTap: () {
                                              _audioBloc.onNextSong();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                            Color(0xffaaaaaa),
                                                        style:
                                                            BorderStyle.solid)),
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(Icons.skip_next)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    : Container();
              }),
        ),
      ),
    );
  }
}
