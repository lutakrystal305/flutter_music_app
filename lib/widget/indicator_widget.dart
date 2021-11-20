import 'package:flutter/material.dart';

class IndicatorPage extends StatelessWidget {
  int current;
  List list_indicator;
  IndicatorPage(this.current, this.list_indicator, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list_indicator.map((e) {
              int index = list_indicator.indexWhere((x) => x == e);
              //print(e);
              return Container(
                width: list_indicator.length > 12
                    ? current == index
                        ? 15
                        : 5
                    : 12.0,
                height: list_indicator.length > 12
                    ? current == index
                        ? 15
                        : 5
                    : 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Colors.green.withOpacity(current == index ? 0.9 : 0.4)),
              );
            }).toList()));
  }
}
