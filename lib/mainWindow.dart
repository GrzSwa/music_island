import 'dart:math';
import 'package:ai_desktop_chat/settings/config.dart';
import 'package:ai_desktop_chat/widgets/animate_wave_music/aniamted_waves.dart';
import 'package:ai_desktop_chat/widgets/audio_button.dart';
import 'package:ai_desktop_chat/widgets/menu.dart';
import 'package:ai_desktop_chat/widgets/title_song_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:async';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MainWindow extends StatefulWidget {
  MainWindow({Key? key}) : super(key: key);

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> with WindowListener {
  Size _screen = ApplicationConfiguration().getSize;
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
          Menu(visible: _submenuVisible),
          DragToMoveArea(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                      transform: GradientRotation(pi / 3),
                      colors: [
                        Color.fromRGBO(197, 0, 0, 1),
                        Color.fromRGBO(0, 0, 0, 1),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topCenter),
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
                            AudioButton.backward(
                              onPressed: () {
                                print("back");
                              },
                            ),
                            AudioButton.play(
                              onPressed: () {
                                print("play");
                                setState(() {
                                  _isPlaying = !_isPlaying;
                                });
                              },
                              play: _isPlaying,
                            ),
                            AudioButton.forward(
                              onPressed: () {
                                print("next");
                              },
                            ),
                          ]),
                    ),
                    Container(
                      height: _screen.height,
                      width: _screen.width * 0.38,
                      child: TitleSongWidget(
                        onDoubleTap: () {
                          windowManager.setPosition(const Offset(200, 0));
                          debugPrint("double click");
                        },
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
                          child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Align(
                                  child: AniamtedWaves(
                                size: const Size(2.0, 10.0),
                                animation: _isPlaying,
                                color: Color.fromRGBO(236, 236, 241, 1),
                                duration: const [
                                  700,
                                  500,
                                  400,
                                  600,
                                  300,
                                  200,
                                ],
                              ))),
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
