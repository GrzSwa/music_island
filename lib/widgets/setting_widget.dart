import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  String title;
  Widget child;
  SettingWidget({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          textScaleFactor: 0.25,
          style:
              TextStyle(color: Colors.white, decoration: TextDecoration.none),
        ),
        child
      ]),
    );
  }
}
