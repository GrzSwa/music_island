import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'package:ai_desktop_chat/constants/const.dart' as constants;
import 'package:marquee/marquee.dart';
import 'dart:async';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({Key? key}) : super(key: key);

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> with WindowListener {
  Size _screen = constants.SIZE;
  String _defaultText = "";
  String _link = 'https://www.youtube.com/watch?v=WXBHCQYxwr0';
  bool _submenuVisible = false;
  bool _pasteLink = false;
  bool _isPlaying = false;
  String _url = '';
  final player = AudioPlayer();

  Future<void> test() async {
    var yt = YoutubeExplode();
    var video = await yt.videos.streamsClient.getManifest('WXBHCQYxwr0');
    var audio = video.audioOnly;
    setState(() {
      _url = audio.first.url.toString();
    });
    print("succes");
    yt.close();
  }

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

  void _drawingSubmenu() {
    if (!_submenuVisible) {
      setState(() {
        _submenuVisible = true;
      });
      windowManager.setSize(Size(_screen.width, 250));
    } else {
      setState(() {
        _submenuVisible = false;
      });
      Timer timer = Timer(const Duration(milliseconds: 520), () {
        windowManager.setSize(Size(_screen.width, _screen.height));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(children: [
          AnimatedContainer(
            width: _screen.width,
            height: _submenuVisible ? 300 : 0,
            margin: EdgeInsets.only(top: _screen.height * 0.5),
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
            child: const Text("test"),
          ),
          DragToMoveArea(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(197, 0, 0, 1),
                    Color.fromRGBO(0, 0, 0, 1),
                  ], begin: Alignment.bottomRight, end: Alignment.topCenter),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: _screen.height,
                      width: _screen.width * 0.40,
                      padding: const EdgeInsets.only(right: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap: () {
                                      print("menu");
                                      _drawingSubmenu();
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.ellipsisVertical,
                                      size: 10,
                                      color: Colors.white,
                                    ))),
                            MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap: () async {
                                      print("back");
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.backward,
                                      size: 12,
                                      color: Colors.white70,
                                    ))),
                            MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap: () async {
                                      print("play");
                                      player.play(UrlSource(_url));
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.pause,
                                      size: 12,
                                      color: Colors.white70,
                                    ))),
                            MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap: () {
                                      print("next");
                                      player.pause();
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.forward,
                                      size: 12,
                                      color: Colors.white70,
                                    ))),
                          ]),
                    ),
                    Container(
                      height: _screen.height,
                      width: _screen.width * 0.38,
                      child: GestureDetector(
                          onDoubleTap: () {
                            windowManager.setPosition(Offset(200, 0));
                            debugPrint("double click");
                          },
                          child: _defaultText != ""
                              ? Marquee(
                                  textScaleFactor: 0.25,
                                  blankSpace: 25,
                                  text: _defaultText,
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      decoration: TextDecoration.none),
                                )
                              : SizedBox()),
                    ),
                    Container(
                        height: _screen.height,
                        width: _screen.width * 0.14,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                print("wave");
                                setState(() {
                                  _pasteLink = !_pasteLink;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/wave.svg',
                                width: 8,
                                height: 8,
                                color: const Color.fromRGBO(236, 236, 241, 1),
                              )),
                        )),
                  ],
                )),
          ),
          TranslationAnimatedWidget.tween(
              enabled: _pasteLink,
              duration: const Duration(milliseconds: 500),
              translationDisabled: Offset(_screen.width + 20, 0),
              translationEnabled: const Offset(0, 0),
              child: Container(
                  height: _pasteLink ? _screen.height : 0,
                  width: _pasteLink ? _screen.width : 0,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.repeat,
                            size: 8,
                            color: Colors.white,
                          ),
                          label: const Text("Loop",
                              textScaleFactor: 0.75,
                              style: TextStyle(color: Colors.white))),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.shuffle,
                              size: 8, color: Colors.white),
                          label: const Text("Shuffle",
                              textScaleFactor: 0.75,
                              style: TextStyle(color: Colors.white))),
                      TextButton.icon(
                          onPressed: () {
                            /*Clipboard.getData(Clipboard.kTextPlain)
                                .then((value) {
                              print(value?.text);
                            })*/
                            ;

                            test();
                          },
                          icon: const Icon(FontAwesomeIcons.paste,
                              size: 8, color: Colors.white),
                          label: const Text("Paste",
                              textScaleFactor: 0.75,
                              style: TextStyle(color: Colors.white))),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _pasteLink = !_pasteLink;
                                });
                              },
                              child: const Icon(
                                Icons.close,
                                size: 12,
                                color: Colors.red,
                              )))
                    ],
                  )))
        ]));
  }
}
