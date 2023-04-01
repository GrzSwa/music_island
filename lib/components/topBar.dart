import 'package:ai_desktop_chat/components/windowButtons.dart';
import 'package:ai_desktop_chat/responsive/responsiveLayoutController.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key;

  TopBar(this._key, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(52, 53, 65, 1),
      child: Column(children: [
        WindowTitleBarBox(
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Color.fromRGBO(236, 236, 241, 1),
                ),
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
              ),
              Expanded(child: MoveWindow()),
              const WindowButtons()
            ],
          ),
        )
      ]),
    );
  }
}
