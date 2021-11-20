import 'package:flutter/material.dart';
import 'package:music_flutter_app/bloc/audio_bloc.dart';
import 'package:music_flutter_app/bloc/bloc_provider.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  Duration duration;
  ProgressIndicatorWidget(this.duration, {Key? key}) : super(key: key);

  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with TickerProviderStateMixin {
  //late AnimationController _controller;
  AudioBloc? _audioBloc;

  @override
  void initState() {
    // TODO: implement initState4
    print(true);
    print(widget.duration);

    super.initState();
    _audioBloc = BlocProvider.of<AudioBloc>(context);
    _audioBloc!.animateController =
        AnimationController(vsync: this, duration: widget.duration)
          ..addListener(() {
            setState(() {});
            if (_audioBloc!.animateController != null) {
              if (_audioBloc!.animateController!.value == 1.0) {
                _audioBloc!.onPause();
              }
            }
          });
    //_audioBloc!.animateController!.repeat(max: 1);
    _audioBloc!.animateController!.forward();
  }

  @override
  void didUpdateWidget(covariant ProgressIndicatorWidget oldWidget) {
    // TODO: implement didUpdateWidget

    super.didUpdateWidget(oldWidget);
    _audioBloc!.animateController!.dispose();
    if (_audioBloc!.animateController != null) {
      _audioBloc!.animateController =
          AnimationController(vsync: this, duration: widget.duration)
            ..addListener(() {
              setState(() {});
              if (_audioBloc!.animateController != null) {
                if (_audioBloc!.animateController!.value == 1.0) {
                  _audioBloc!.onPause();
                }
              }
            });
      //_audioBloc!.animateController!.repeat(max: 1);
      _audioBloc!.animateController!.forward();
    }
  }

  @override
  void dispose() {
    //if (_audioBloc!.animateController != null) {
    //_audioBloc!.animateController!.stop();
    _audioBloc!.animateController!.dispose();
    //AnimationController(vsync: this).dispose();

    //}
    //_audioBloc!.animateController = null;
    //_audioBloc!.disposeAnimate();
    //if (_audioBloc!.animateController == null) {
    super.dispose();
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      //color: Colors.green[700]!.withOpacity(0.7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 9,
            child: LinearProgressIndicator(
              value: _audioBloc!.animateController != null
                  ? _audioBloc!.animateController!.value
                  : 0.0,
              semanticsLabel: 'Linear progress indicator',
              color: Colors.greenAccent[400],
              //backgroundColor: Colors.white
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.duration
                    .toString()
                    .split('.')
                    .first
                    .padLeft(8, "0"))),
          )
        ],
      ),
    );
  }
}
