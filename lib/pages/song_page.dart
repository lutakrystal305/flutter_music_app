import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/bloc/songs_bloc.dart';
import 'package:music_flutter_app/value/app_assets.dart';
import 'package:music_flutter_app/widget/flow_widget.dart';
import 'package:music_flutter_app/widget/indicator_widget.dart';
import 'package:music_flutter_app/widget/songs_widget/list_singer.dart';
import 'package:music_flutter_app/widget/songs_widget/list_songs.dart';
import 'package:music_flutter_app/widget/songs_widget/search_widget.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _current = 0;
  List songs = [];

  @override
  Widget build(BuildContext context) {
    final SongsBloc? _songsBloc = BlocProvider.of<SongsBloc>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff0d1117),
      appBar: AppBar(
        title: Text('Chilly'),
        backgroundColor: Colors.green[900],
      ),
      floatingActionButton: FlowWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  child: Image.asset(
                    AppAssets.songsBackground,
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height,
                  ),
                ),
                Container(
                    child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  height: size.height - 20,
                  child: StreamBuilder(
                      stream: _songsBloc!.allSingers,
                      builder:
                          (context, AsyncSnapshot<Map<String, List>> snapshot) {
                        return SafeArea(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: IndicatorPage(
                                    _current,
                                    snapshot.hasData
                                        ? snapshot.data!.keys.toList()
                                        : []),
                              ),
                              Container(
                                height: 80,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _songsBloc.pageController,
                                    onPageChanged: (index) {
                                      _songsBloc.onSingerChange(snapshot
                                          .data!.values
                                          .elementAt(index));
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                    itemCount: snapshot.hasData
                                        ? snapshot.data!.keys.length
                                        : 0,
                                    itemBuilder: (context, index) => Container(
                                          width: double.infinity,
                                          height: 70,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                          margin: const EdgeInsets.all(10.0),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff0d1117),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color(0xffaaaaaa),
                                                    offset: Offset(2, 3),
                                                    blurRadius: 5)
                                              ],
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffaaaaaa),
                                                  style: BorderStyle.solid)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(5.0),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: const Color(
                                                          0xffaaaaaa),
                                                      style: BorderStyle.solid),
                                                ),
                                                child: Image.network(
                                                  snapshot.data!.values
                                                      .elementAt(index)[0]
                                                      .img,
                                                  fit: BoxFit.cover,
                                                  width: 50,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  snapshot.hasData
                                                      ? snapshot.data!.keys
                                                          .elementAt(index)
                                                      : '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  //maxLines: 1,
                                                  style: const TextStyle(
                                                      color: Color(0xffcccccc),
                                                      fontSize: 18,
                                                      //letterSpacing: 1.5,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                              ),
                              ListSongs()
                            ],
                          ),
                        );
                      }),
                )),
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 20.0),
                child: const Text(
                  'List Singer is available !!!',
                  style: TextStyle(color: Color(0xffaaaaaa), fontSize: 23),
                )),
            ListSinger(size)
          ],
        ),
      ),
    );
  }
}
