import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

final buttonColors = WindowButtonColors(
    iconNormal: const Color.fromRGBO(236, 236, 241, 1),
    mouseOver: const Color.fromRGBO(62, 63, 75, 1),
    mouseDown: const Color.fromRGBO(236, 236, 241, 1),
    iconMouseOver: const Color.fromRGBO(236, 236, 241, 1),
    iconMouseDown: const Color.fromRGBO(62, 63, 75, 1));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color.fromRGBO(236, 236, 241, 1),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
