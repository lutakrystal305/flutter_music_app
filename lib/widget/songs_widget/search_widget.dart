import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/bloc/songs_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    final _songBloc = BlocProvider.of<SongsBloc>(context);
    return Container(
      child: Column(
        children: [
          StreamBuilder(
              stream: _songBloc!.searchSinger,
              builder: (context, AsyncSnapshot<List> snapshot) {
                return snapshot.hasData && snapshot.data!.isNotEmpty
                    ? Container(
                        width: double.infinity,
                        height: 200.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xffaaaaaa)),
                            color: Color(0xff0d1117)),
                        child: SingleChildScrollView(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: snapshot.data!
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      _songBloc.onClickSingerSearch(e);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xffaaaaaa)))),
                                      child: Text(
                                        e,
                                        style:
                                            TextStyle(color: Color(0xffbbbbbb)),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )),
                      )
                    : Container(
                        height: 0,
                      );
              }),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Container(
                color: Color(0xff0d1117),
                child: TextField(
                  controller: _textController,
                  onChanged: (text) {
                    _songBloc.onSearch(text);
                  },
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white54, width: 0.0)),
                      border: OutlineInputBorder(),
                      labelText: 'Search singers that you want!',
                      labelStyle: TextStyle(color: Colors.white54)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white38,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
