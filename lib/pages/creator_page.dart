import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/value/app_assets.dart';
import 'package:music_flutter_app/value/projects.dart';
import 'package:music_flutter_app/value/quotes.dart';
import 'package:music_flutter_app/widget/flow_widget.dart';
import 'package:music_flutter_app/widget/indicator_widget.dart';
import 'package:music_flutter_app/widget/project_widget.dart';

class CreatorPage extends StatefulWidget {
  const CreatorPage({Key? key}) : super(key: key);

  @override
  _CreatorPageState createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  int _current = 0;
  int _current1 = 0;
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    final _pageController1 = PageController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creator'),
        backgroundColor: Colors.green[900],
      ),
      floatingActionButton: FlowWidget(),
      body: SingleChildScrollView(
          child: Container(
              color: const Color(0xff0d1117),
              alignment: Alignment.center,
              child: Column(children: [
                Container(
                  color: const Color(0xff0d1117),
                  width: size.width,
                  height: size.height / 2,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        margin: const EdgeInsets.only(top: 30.0),
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppAssets.avt,
                          fit: BoxFit.contain,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white38,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(1000)),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        child: const Text('Luta Krystal',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: const Text('Quotes: ',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontStyle: FontStyle.italic)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          alignment: Alignment.center,
                          height: 160,
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _current = index;
                              });
                            },
                            itemCount: quotes.length,
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(5.0),
                              child: RichText(
                                  text: TextSpan(
                                      text: quotes[index]['quote'],
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      children: [
                                    const TextSpan(text: ' ---- '),
                                    TextSpan(
                                        text: quotes[index]['author'],
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 1.5))
                                  ])),
                            ),
                          )),
                      IndicatorPage(_current, quotes),
                      Container(
                          //height: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                          )),
                          child: RichText(
                            text: TextSpan(
                                text: 'Age: ',
                                children: [
                                  const TextSpan(text: '  '),
                                  TextSpan(
                                      text: '21',
                                      style: TextStyle(
                                          color: Colors.purple[900],
                                          fontSize: 16))
                                ],
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15)),
                          )),
                      Container(
                          //height: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                          )),
                          child: RichText(
                            text: TextSpan(
                                text: 'Address: ',
                                children: [
                                  const TextSpan(text: '  '),
                                  TextSpan(
                                      text: 'Quang Nam - Da Nang',
                                      style: TextStyle(
                                          color: Colors.greenAccent[700],
                                          fontSize: 16))
                                ],
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15)),
                          )),
                      Container(
                          //height: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                            bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                          )),
                          child: RichText(
                            text: TextSpan(
                                text: 'Contact: ',
                                children: [
                                  const TextSpan(text: '  '),
                                  TextSpan(
                                      text: 'nguyenvanthai305@gmail.com',
                                      style: TextStyle(
                                          color: Colors.amber[400],
                                          fontSize: 16))
                                ],
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15)),
                          )),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Color(0xffaaaaaa),
                                    style: BorderStyle.solid))),
                        child: Text('Available !!!',
                            style: TextStyle(
                                letterSpacing: 2.0,
                                color: Colors.tealAccent[400],
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width,
                        height: size.height,
                        child: Column(
                          children: [
                            Container(
                              height: size.height - 100,
                              child: PageView.builder(
                                  controller: _pageController1,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _current1 = index;
                                    });
                                  },
                                  itemCount: projects.length,
                                  itemBuilder: (context, index) {
                                    String z;
                                    z = index == 0
                                        ? 'Web'
                                        : index == 1
                                            ? 'Computer Vision'
                                            : 'Mobile App';
                                    return Container(
                                      alignment: Alignment.center,
                                      width: size.width,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              margin:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(z,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                          ProjectWidget(
                                              size, index, projects[index])
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            IndicatorPage(_current1, projects)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]))),
    );
  }
}
