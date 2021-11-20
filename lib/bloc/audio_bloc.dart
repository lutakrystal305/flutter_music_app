import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/models/music_model.dart';
import 'package:rxdart/subjects.dart';

class AudioBloc implements BlocBase {
  AnimationController? animateController;
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer(
      mode: PlayerMode
          .MEDIA_PLAYER); //<uses-permission android:name="android.permission.WAKE_LOCK" />
  final _totalDuration = BehaviorSubject<Duration>();
  Stream<Duration> get totalDuration => _totalDuration.stream;
  final _currentSong = BehaviorSubject<Songs>();
  Stream<Songs> get currentSong => _currentSong.stream;
  Songs get currentSongValue =>
      _currentSong.hasValue ? _currentSong.value : Songs();
  String? get currentSongNameValue =>
      _currentSong.hasValue ? _currentSong.value.song : '';
  final _currentSinger = BehaviorSubject<String>();
  Stream<String> get currentSinger => _currentSinger.stream;
  final _currentSongs = BehaviorSubject<List>();
  Stream<List> get currentSongs => _currentSongs.stream;
  List get currentSongsValue => _currentSongs.value;
  final _checkPlay = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get checkPlay => _checkPlay.stream;

  onPlay() async {
    _checkPlay.sink.add(true);

    Songs x = _currentSong.value;
    // List a = x.audio!.split('');
    // a.insert(4, 's');
    // x.audio = a.join('');
    print(x.audio);
    int result = await audioPlayer.play(x.audio.toString());
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      if (!_totalDuration.hasValue ||
          (_totalDuration.hasValue && _totalDuration.value != d)) {
        _totalDuration.sink.add(d);
      } else if (_totalDuration.hasValue && _totalDuration.value == d) {
        animateController!.forward();
      }
    });
    print(result);

    // var duration = audioPlayer
    //     .getDuration()
    //     .then((value) => _totalDuration.sink.add(value));
    // print(_totalDuration.hasValue ? _totalDuration.value : ''); //await => sink
  }

  onPause() async {
    _checkPlay.sink.add(false);
    var audio = await audioPlayer.pause();
    if (animateController != null) {
      animateController!.stop();
    }
  }

  void onClick(Songs x, String y, List z) {
    //if (animateController != null) animateController!.dispose();
    _currentSong.sink.add(x);
    _currentSinger.sink.add(y);
    _currentSongs.sink.add(z);
  }

  void onNextSong() {
    //animateController!.dispose();
    onPause();

    int index = _currentSongs.value
        .indexWhere((element) => element == _currentSong.value);
    if (index < _currentSongs.value.length - 1) {
      _currentSong.sink.add(_currentSongs.value[index + 1]);
    } else {
      _currentSong.sink.add(_currentSongs.value[0]);
    }
    onPlay();
  }

  void onPreSong() {
    //animateController!.dispose();
    onPause();

    int index = _currentSongs.value
        .indexWhere((element) => element == _currentSong.value);
    if (index > 0) {
      _currentSong.sink.add(_currentSongs.value[index - 1]);
    } else {
      _currentSong.sink
          .add(_currentSongs.value[_currentSongs.value.length - 1]);
    }
    onPlay();
  }

  void disposeAnimate() {
    animateController?.dispose();
  }

  void dispose() {
    _currentSong.close();
    audioPlayer.dispose();
  }
}
