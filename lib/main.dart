import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/audio_bloc.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/bloc/songs_bloc.dart';
import 'package:music_flutter_app/pages/pre_page.dart';
//import 'package:rxdart/rxdart.dart';

void main() {
  final _songsBloc = SongsBloc();
  final _audioBloc = AudioBloc();
  runApp(BlocProvider(
      child: BlocProvider(
        child: const MaterialApp(home: PrePage()),
        bloc: _audioBloc,
      ),
      bloc: _songsBloc));
}
