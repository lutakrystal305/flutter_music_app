import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';
import 'package:music_flutter_app/bloc/songs_bloc.dart';
import 'package:music_flutter_app/value/app_assets.dart';
import 'package:music_flutter_app/widget/flow_widget.dart';
import 'package:music_flutter_app/widget/page_widget/home_page/drawer_widget.dart';
import 'package:music_flutter_app/widget/page_widget/home_page/home1_widget.dart';
import 'package:music_flutter_app/widget/page_widget/home_page/home2_widget.dart';
import 'package:music_flutter_app/widget/page_widget/home_page/home3_widget.dart';
import 'package:music_flutter_app/widget/page_widget/home_page/home4_widget.dart';
import 'package:music_flutter_app/widget/page_widget/home_page/home5_widget.dart';
import 'package:music_flutter_app/widget/particle_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final SongsBloc _songsBloc = SongsBloc();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    final SongsBloc? _songsBloc = BlocProvider.of<SongsBloc>(context);
    // TODO: implement initState
    super.initState();
    _songsBloc!.fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    final SongsBloc? _songsBloc = BlocProvider.of<SongsBloc>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xff0d1117),
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green[900],
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Home1Widget(size),
              Home2Widget(size),
              Home3Widget(size),
              Home4Widget(size),
              Home5Widget(size)
            ],
          ),
        ),
      ),
      // ignore: prefer_const_constructors
      drawer: DrawerWidget(),
      floatingActionButton: FlowWidget(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.,
    );
  }
}
