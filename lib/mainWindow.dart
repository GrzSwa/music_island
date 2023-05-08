import 'dart:math';
import 'package:ai_desktop_chat/settings/config.dart';
import 'package:ai_desktop_chat/widgets/animate_wave_music/aniamted_waves.dart';
import 'package:ai_desktop_chat/widgets/audio_button.dart';
import 'package:ai_desktop_chat/widgets/menu.dart';
import 'package:ai_desktop_chat/widgets/title_song_widget.dart';
import 'package:flutter/cupertino.dart';
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
  ApplicationConfiguration config = ApplicationConfiguration();
  String _defaultText = "";
  String _link = 'https://www.youtube.com/watch?v=WXBHCQYxwr0';
  bool _gradientVisible = true;
  bool _pasteLinkVisible = false;
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
      windowManager.setSize(Size(config.getSize.width, 250));
    } else {
      setState(() {
        _submenuVisible = false;
      });
      Timer(const Duration(milliseconds: 520), () {
        windowManager
            .setSize(Size(config.getSize.width, config.getSize.height));
      });
    }
  }

  void _drawingMenu() {
    if (!_pasteLinkVisible) {
      setState(() {
        _pasteLinkVisible = true;
      });
      windowManager.setSize(Size(config.getSize.width, 125));
    } else {
      setState(() {
        _pasteLinkVisible = false;
      });
      Timer timer = Timer(const Duration(milliseconds: 520), () {
        windowManager
            .setSize(Size(config.getSize.width, config.getSize.height));
      });
    }
  }

  void _changeSizeFunction(Size size) {
    if (size.width > 200) {
      windowManager
          .setSize(size)
          .then((value) => setState(() => config.setSize = size));
    } else
      setState(() => config.setSize = size);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(children: [
          AnimatedContainer(
              width: config.getSize.width,
              height: _pasteLinkVisible ? 200 : 0,
              margin: EdgeInsets.only(top: config.getSize.height * 0.5),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                  ])))),
          Menu(
            visible: _submenuVisible,
            gradient: () => setState(
              (() {
                config.setGradientVisible = !config.getGradientVisible;
              }),
            ),
            config: config,
            changeSize: (value) => _changeSizeFunction(value),
          ),
          DragToMoveArea(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInQuart,
                height: config.getSize.height,
                width: config.getSize.width,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(25),
                  gradient: config.getGradientVisible
                      ? const LinearGradient(
                          transform: GradientRotation(pi / 3),
                          colors: [
                            Color.fromRGBO(197, 0, 0, 1),
                            Color.fromRGBO(0, 0, 0, 1),
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topCenter)
                      : null,
                ),
                child: config.getSize.width <= 200
                    ? Row(
                        children: [
                          Flexible(
                              flex: 2,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                  ])),
                          config.getSize.width == 200
                              ? Flexible(
                                  flex: 2,
                                  child: TitleSongWidget(
                                    title: "Trzech króli - Akropol",
                                    onDoubleTap: () {
                                      windowManager
                                          .setPosition(const Offset(200, 0));
                                      debugPrint("double click");
                                    },
                                  ))
                              : SizedBox(),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              print("wave");
                              config.getSize.width < 200
                                  ? _drawingMenu()
                                  : setState(() {
                                      _pasteLink = !_pasteLink;
                                    });
                            },
                            child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 5, right: 8),
                                    child: AniamtedWaves(
                                      size: const Size(2.0, 12.0),
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
                          ))
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            color: Colors.green,
                            width: config.getSize.width,
                            child: Row(children: [
                              Container(
                                child: Icon(
                                  CupertinoIcons.music_albums,
                                  size: 40,
                                ),
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Nea",
                                      textScaleFactor: 0.2,
                                      style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.none)),
                                  Text("Some Say (Lyric Video)",
                                      textScaleFactor: 0.2,
                                      style: TextStyle(
                                          color: Colors.white70,
                                          decoration: TextDecoration.none))
                                ],
                              )),
                              Container(
                                  child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 8),
                                          child: AniamtedWaves(
                                            size: const Size(2.0, 12.0),
                                            animation: _isPlaying,
                                            color: Color.fromRGBO(
                                                236, 236, 241, 1),
                                            duration: const [
                                              700,
                                              500,
                                              400,
                                              600,
                                              300,
                                              200,
                                            ],
                                          ))))
                            ]),
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.indigo,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    size: 18,
                                    onPressed: () {
                                      print("back");
                                    },
                                  ),
                                  AudioButton.play(
                                    size: 24,
                                    onPressed: () {
                                      print("play");
                                      setState(() {
                                        _isPlaying = !_isPlaying;
                                      });
                                    },
                                    play: _isPlaying,
                                  ),
                                  AudioButton.forward(
                                    size: 18,
                                    onPressed: () {
                                      print("next");
                                    },
                                  ),
                                ]),
                          ),
                        ],
                      )),
          ),
          TranslationAnimatedWidget.tween(
              enabled: _pasteLink,
              duration: const Duration(milliseconds: 500),
              translationDisabled: Offset(config.getSize.width + 20, 0),
              translationEnabled: const Offset(0, 0),
              child: Container(
                  height: _pasteLink ? config.getSize.height : 0,
                  width: _pasteLink ? config.getSize.width : 0,
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
