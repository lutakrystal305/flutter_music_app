import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookTourWidget extends StatelessWidget {
  Map<String, dynamic> tour;
  int index;
  Size size;
  BookTourWidget(this.index, this.tour, this.size, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 1, color: Color(0xffaaaaaa), style: BorderStyle.solid),
              bottom: BorderSide(
                  width: 1,
                  color: Color(0xffaaaaaa),
                  style: BorderStyle.solid))),
      //decoration: BoxDecoration(color: Color(0xffdddddd).withOpacity(0.8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text('$index')),
              Column(
                children: [
                  Text(tour['name'],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  Text(tour['where'],
                      style: const TextStyle(
                        color: Color(0xff777777),
                        //fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ))
                ],
              ),
              Text('\$ ${tour['price']}'),
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy'),
                  style: ElevatedButton.styleFrom(primary: Colors.green[900]),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
