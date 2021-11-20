import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  Size size;
  int index;
  List list_project;
  ProjectWidget(this.size, this.index, this.list_project, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
          children: list_project.map((e) {
        int index1 = list_project.indexWhere((element) => element == e);
        //print('index1' + index1.toString());

        return Container(
          width: size.width / 2,
          height: index == 2 ? 300 : 200,
          //clipBehavior: Clip.antiAlias,
          //decoration: BoxDecoration(),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text((index1 + 1).toString(),
                    style: const TextStyle(
                        color: Color(0xffc51162),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Color(0xffaaaaaa),
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Image.asset(e,
                    fit: BoxFit.cover,
                    width: index == 2 ? 90 : 100,
                    height: index == 2 ? 150 : 100),
              )
            ],
          ),
        );
      }).toList()),
    );
  }
}
