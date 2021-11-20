import 'package:flutter/material.dart';
import 'package:music_flutter_app/pages/creator_page.dart';
import 'package:music_flutter_app/pages/home_page.dart';
import 'package:music_flutter_app/pages/pre_page.dart';
import 'package:music_flutter_app/pages/song_page.dart';
import 'package:music_flutter_app/widget/flow_delegate.dart';

class FlowWidget extends StatefulWidget {
  //double height;
  const FlowWidget({Key? key}) : super(key: key);

  @override
  _FlowWidgetState createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final List<IconData> _icons = <IconData>[
    Icons.home,
    Icons.music_note_outlined,
    Icons.account_circle_rounded,
    Icons.menu,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: MyFlowDelegate(_animationController),
      children:
          _icons.map<Widget>((IconData icon) => _buildItem(icon)).toList(),
    );
  }

  Widget _buildItem(IconData icon) {
    return Align(
      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
      alignment: Alignment.bottomRight,
      child: RawMaterialButton(
        fillColor: Colors.green,
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size.square(50.0)),
        onPressed: () {
          _animationController.status == AnimationStatus.completed
              ? _animationController.reverse()
              : _animationController.forward();
          if (icon != Icons.menu) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => icon == Icons.home
                        ? HomePage()
                        : icon == Icons.music_note_outlined
                            ? SongPage()
                            : CreatorPage()));
          }
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
