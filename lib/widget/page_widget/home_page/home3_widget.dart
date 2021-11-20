import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/value/app_assets.dart';
import 'package:music_flutter_app/value/tour_value.dart';
import 'package:music_flutter_app/widget/app_button.dart';
import 'package:music_flutter_app/widget/book_tour_widget.dart';

class Home3Widget extends StatefulWidget {
  Size size;
  Home3Widget(this.size, {Key? key}) : super(key: key);

  @override
  _Home3WidgetState createState() => _Home3WidgetState();
}

class _Home3WidgetState extends State<Home3Widget> {
  final a = [0, 1];
  int _current = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      alignment: Alignment.center,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Image.asset(
          AppAssets.home2,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          //width: widget.size.width * 3 / 4,
          height: widget.size.height * 2 / 3,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: PageView.builder(
              controller: _pageController,
              itemCount: 2,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    //width: widget.size.width * 3 / 4,
                    //height: widget.size.height * 3 / 4,
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.65)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: tours.length,
                            itemBuilder: (context, index1) => BookTourWidget(
                                index1 + 1, tours[index], widget.size)),
                      ],
                    ),
                  );
                }
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    //borderRadius: BorderRadius.circular(16.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       color: Colors.white,
                    //       offset: Offset(3, 4),
                    //       blurRadius: 5.0)
                    // ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: const Text(
                          'Member Card',
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.cyan,
                                    offset: Offset(1, 2),
                                    blurRadius: 5.0)
                              ],
                              color: Colors.tealAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              fontSize: 25),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 10.0),
                                  child: const Text('Advantages: ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic))),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: const Text(
                                        '- Safe off for book ticket tour',
                                        textAlign: TextAlign.left,
                                      )),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: const Text(
                                          '- Free exchange ticket tour',
                                          textAlign: TextAlign.left)),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: const Text('- Free Girls',
                                          textAlign: TextAlign.left)),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: const Text('- Vip music',
                                          textAlign: TextAlign.left))
                                ],
                              )
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Upgrade to member'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 15.0),
                              primary: Colors.green[800]),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: a.map((e) {
                //print(e);
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Colors.green.withOpacity(_current == e ? 0.9 : 0.4)),
                );
              }).toList(),
            ))
      ]),
    );
  }
}
