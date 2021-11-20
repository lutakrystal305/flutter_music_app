import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/models/music_model.dart';
import 'package:music_flutter_app/repository/fetch_music.dart';
import 'package:rxdart/rxdart.dart';

class SongsBloc implements BlocBase {
  final _fetchMusic = FetchMusic();
  PageController _pageController = PageController(viewportFraction: 0.7);
  final dataKey = new GlobalKey();
  PageController get pageController => _pageController;
  final _songsFetcher = BehaviorSubject<List<Songs>>();
  final _searchSinger = BehaviorSubject<List>();
  final _currentSingerSongs = BehaviorSubject<List>();
  final _singerFetcher = BehaviorSubject<Map<String, List>>.seeded({});
  final _singer = BehaviorSubject<String>();

  Stream<List<Songs>> get allSongs => _songsFetcher.stream;
  Stream<List> get currentSingerSongs => _currentSingerSongs.stream;
  Stream<List> get searchSinger => _searchSinger.stream;
  Stream<String> get singer => _singer.stream;
  String get currentSinger => _singer.hasValue ? _singer.value : '';
  Stream<Map<String, List>> get allSingers => _singerFetcher.stream;
  Map<String, List>? get currentAllSinger => _singerFetcher.value;
  //Stream<bool> get hasValue => _singerFetcher.hasValue;

  Stream<Map<String, List>> getCurrent() async* {
    yield _singerFetcher.value;
  }

  void onInitial() {
    //print('current value: %%%' + _singerFetcher.value.toString());
    _singerFetcher.sink.add(_singerFetcher.value);
  }

  void onSingerChange(List a) {
    _currentSingerSongs.sink.add(a);
  }

  void onSearch(String x) {
    if (x.isNotEmpty) {
      List y = _singerFetcher.value != {}
          ? _singerFetcher.value.keys
              .where((element) => element.indexOf(x) >= 0)
              .toList()
          : [];
      _searchSinger.sink.add(y);
    } else {
      _searchSinger.sink.add([]);
    }
  }

  void onClickSingerSearch(String x) {
    var y = _singerFetcher.value != {} ? _singerFetcher.value[x] : [];
    _singer.sink.add(x);
    _searchSinger.sink.add([]);
    _currentSingerSongs.sink.add(y!);
    int index = _singerFetcher.value != {}
        ? _singerFetcher.value.keys
            .toList()
            .indexWhere((element) => element == x)
        : 0;
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 270), curve: Curves.easeIn);
    Scrollable.ensureVisible(dataKey.currentContext!);
  }

  void fetchSongs() async {
    List<Songs> songs = await _fetchMusic.fetchSongs();
    _songsFetcher.sink.add(songs);

    Map<String, List> a = {};
    // ignore: avoid_print
    //print(_songsFetcher.value);
    // ignore: avoid_function_literals_in_foreach_calls
    _songsFetcher.value.forEach((e) {
      //print(e);
      final x = e.singer;
      if (a[x] != null && a[x]!.isNotEmpty) {
        a[x]!.add(e);
      } else {
        a[x!] = [e];
      }
    });
    //print(a);
    _singerFetcher.sink.add(a);
    _currentSingerSongs.sink.add(a.values.elementAt(0));
    //print(_singerFetcher.value.toString());
  }

  void dispose() {
    _songsFetcher.close();
  }
}
