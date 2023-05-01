import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'package:ai_desktop_chat/constants/const.dart' as constants;
import 'package:marquee/marquee.dart';
import 'package:flutter/services.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({Key? key}) : super(key: key);

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> with WindowListener {
  Size _screen = constants.SIZE;
  String defaultText = "Sea Shanty - Wellerman (official music Video)";
  String? _link;
  bool _submenuVisible = false;
  bool _pasteLink = false;
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(children: [
          Container(
            width: _submenuVisible ? _screen.width : 0,
            height: _submenuVisible ? 300 : 0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text("test"),
          ),
          DragToMoveArea(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(197, 0, 0, 1),
                    Color.fromRGBO(52, 53, 65, 1),
                  ], begin: Alignment.bottomRight, end: Alignment.topCenter),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: _screen.height,
                      width: _screen.width * 0.40,
                      padding: EdgeInsets.only(right: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  print("menu");
                                  windowManager
                                      .setSize(Size(_screen.width, 200));
                                  setState(() {
                                    _submenuVisible = !_submenuVisible;
                                  });
                                },
                                child: const Icon(
                                  FontAwesomeIcons.ellipsisVertical,
                                  size: 12,
                                  color: Colors.white,
                                )),
                            GestureDetector(
                                onTap: () {
                                  print("back");
                                },
                                child: const Icon(
                                  FontAwesomeIcons.backward,
                                  size: 12,
                                  color: Colors.white70,
                                )),
                            GestureDetector(
                                onTap: () {
                                  print("play");
                                  Clipboard.getData(Clipboard.kTextPlain)
                                      .then((value) {
                                    print(value?.text);
                                  });
                                },
                                child: const Icon(
                                  FontAwesomeIcons.pause,
                                  size: 12,
                                  color: Colors.white70,
                                )),
                            GestureDetector(
                                onTap: () {
                                  print("next");
                                },
                                child: const Icon(
                                  FontAwesomeIcons.forward,
                                  size: 12,
                                  color: Colors.white70,
                                )),
                          ]),
                    ),
                    Container(
                      height: _screen.height,
                      width: _screen.width * 0.39,
                      child: Marquee(
                        textScaleFactor: 0.25,
                        blankSpace: 25,
                        text: defaultText,
                        style: const TextStyle(
                            color: Colors.white70,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Container(
                      height: _screen.height,
                      width: _screen.width * 0.14,
                      child: GestureDetector(
                          onTap: () {
                            print("wave");
                            setState(() {
                              _pasteLink = !_pasteLink;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/wave.svg',
                            width: 10,
                            height: 10,
                            color: const Color.fromRGBO(236, 236, 241, 1),
                          )),
                    ),
                  ],
                )),
          ),
          Container(
            height: _pasteLink ? _screen.height : 0,
            width: _pasteLink ? _screen.width : 0,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
            child: GestureDetector(
                onTap: () {
                  print("wave");
                  setState(() {
                    _pasteLink = !_pasteLink;
                  });
                },
                child: Text(
                  "test",
                  style: TextStyle(fontSize: 10),
                )),
          )
        ]));
  }
}
