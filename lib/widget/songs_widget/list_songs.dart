import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/audio_bloc.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/bloc/songs_bloc.dart';
import 'package:music_flutter_app/pages/each_song_page.dart';

class ListSongs extends StatelessWidget {
  const ListSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _songBloc = BlocProvider.of<SongsBloc>(context);
    final _audioBloc = BlocProvider.of<AudioBloc>(context);
    return Container(
      key: _songBloc!.dataKey,
      //width: double.infinity,
      height: 350,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.3),
                offset: Offset(3, 4),
                blurRadius: 5.0)
          ],
          border: Border.all(width: 1, color: Color(0xffaaaaaa)),
          borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 135,
            child: Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                //margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.34),
                ),
                child: const Text(
                  'Songs',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.5),
                )),
          ),
          Expanded(
            child: Container(
              //width: size.width - 90,
              height: double.infinity,
              //padding: const EdgeInsets.symmetric(
              //    horizontal: 15.0, vertical: 25.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
              ),

              child: SingleChildScrollView(
                child: StreamBuilder(
                    stream: _songBloc.currentSingerSongs,
                    builder: (context, AsyncSnapshot<List> snapshot) {
                      return snapshot.hasData
                          ? Column(
                              children: snapshot.data!
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          _audioBloc!.onClick(
                                              e,
                                              _songBloc.currentSinger,
                                              snapshot.data!);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EachSongPage()));
                                        },
                                        child: Container(
                                          // alignment:
                                          //     Alignment.centerLeft,
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 15.0),
                                          //margin: const EdgeInsets.all(10.0),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  // top: BorderSide(
                                                  //     width: 1,
                                                  //     color:
                                                  //         Color(0xffaaaaaa)),
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color:
                                                          Color(0xffaaaaaa)))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  //clipBehavior: Clip.antiAlias,
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  decoration: BoxDecoration(
                                                    color: snapshot.data!.indexWhere(
                                                                    (element) =>
                                                                        element ==
                                                                        e) %
                                                                2 ==
                                                            0
                                                        ? Colors.pinkAccent
                                                            .withOpacity(0.6)
                                                        : Colors.indigo[800]!
                                                            .withOpacity(0.6),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: const Color(
                                                            0xffaaaaaa)),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    27.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    27.0)),
                                                  ),
                                                  child: Text(
                                                    snapshot.data!
                                                        .indexWhere((element) =>
                                                            element == e)
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Flexible(
                                                        child: Text(
                                                      e.song,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                    Flexible(
                                                        child: Text(
                                                      e.singer,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              const Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.play_circle,
                                                  color: Colors.greenAccent,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          : Container();
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
