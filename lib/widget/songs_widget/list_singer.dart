import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/bloc/songs_bloc.dart';

class ListSinger extends StatelessWidget {
  Size size;
  ListSinger(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SongsBloc? _songBloc = BlocProvider.of<SongsBloc>(context);
    int i = 0;
    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          border: Border.all(width: 1, color: Color(0xffaaaaaa)),
          borderRadius: BorderRadius.circular(16.0)),
      alignment: Alignment.center,
      child: StreamBuilder(
          stream: _songBloc!.allSingers,
          builder: (context, AsyncSnapshot<Map<String, List>> snapshot) {
            //print(snapshot.data);
            //print(_songBloc.currentAllSinger);
            return snapshot.hasData && snapshot.data!.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                        children: snapshot.data!.keys
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    _songBloc.onClickSingerSearch(e);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Color(0xffaaaaaa)))),
                                    //margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [Text('${++i}'), Text(e)],
                                    ),
                                  ),
                                ))
                            .toList()),
                  )
                : Container();
          }),
    );
  }
}
