import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AppButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Color(0xffaaaaaa),
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        width: 1,
                        color: Color(0xffaaaaaa),
                        style: BorderStyle.solid))),
            child: Text(label,
                style: TextStyle(color: Color(0xffdddddd), fontSize: 20))));
  }
}
