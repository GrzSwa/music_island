import 'package:ai_desktop_chat/settings/config.dart';
import 'package:ai_desktop_chat/widgets/options/options.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class Menu extends StatefulWidget {
  final Size _size = ApplicationConfiguration().getSize;
  final bool visible;

  Menu({Key? key, this.visible = false}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ApplicationConfiguration config = ApplicationConfiguration();

  void test() {
    windowManager.setOpacity(0.9);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: widget._size.width,
        height: widget.visible ? 300 : 0,
        margin: EdgeInsets.only(top: widget._size.height * 0.5),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.8),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        child: ListView(
          children: const [
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Settings",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      letterSpacing: 1.5)),
            )),
            Options(),
            Options(),
            Options(),
            Options(),
          ],
        ));
  }
}
