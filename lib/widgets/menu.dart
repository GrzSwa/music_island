import 'package:flutter/material.dart';
import 'package:ai_desktop_chat/constants/const.dart' as constants;

class Menu extends StatefulWidget {
  final Size _size = constants.SIZE;
  final bool visible;
  const Menu({Key? key, this.visible = false}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget._size.width,
      height: widget.visible ? 300 : 0,
      margin: EdgeInsets.only(top: widget._size.height * 0.5),
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      child: const Text("test"),
    );
  }
}
