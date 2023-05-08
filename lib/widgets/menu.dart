import 'package:ai_desktop_chat/settings/config.dart';
import 'package:ai_desktop_chat/widgets/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class Menu extends StatefulWidget {
  final bool visible;
  final VoidCallback? gradient;
  final ValueChanged<Size>? changeSize;
  ApplicationConfiguration config;
  Menu(
      {Key? key,
      this.visible = false,
      this.gradient,
      required this.config,
      this.changeSize})
      : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: widget.config.getSize.width,
        height: widget.visible ? 300 : 0,
        margin: EdgeInsets.only(top: widget.config.getSize.height * 0.5),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.8),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Settings",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      letterSpacing: 1.5)),
            ),
            SettingWidget(
              title: "Change Size",
              child: Wrap(
                  runSpacing: 5,
                  spacing: 5,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => widget.changeSize!(Size(100.0, 25.0)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      child: const Text(
                        "100x25",
                        textScaleFactor: 0.7,
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    TextButton(
                      onPressed: () => widget.changeSize!(Size(200.0, 25.0)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      child: const Text(
                        "200x25",
                        textScaleFactor: 0.7,
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    TextButton(
                      onPressed: () => widget.changeSize!(Size(250.0, 115.0)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      child: const Text(
                        "250x115",
                        textScaleFactor: 0.7,
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ]),
            ),
            SettingWidget(
                title: "Change position",
                child: TextButton(
                  onPressed: () {
                    windowManager
                        .getPosition()
                        .then((value) => widget.config.setPosition = value);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text(
                    "Set current position",
                    textScaleFactor: 0.7,
                    style: TextStyle(
                        color: Colors.white, decoration: TextDecoration.none),
                  ),
                )),
            SettingWidget(
                title: "Change opacity",
                child: Material(
                    color: Colors.transparent,
                    child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 15.0),
                            showValueIndicator: ShowValueIndicator.always,
                            trackHeight: 1.5,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 5.0)),
                        child: Slider(
                          min: 0.1,
                          thumbColor: Colors.grey,
                          activeColor: Colors.grey,
                          value: widget.config.getOpacity,
                          label:
                              "Opacity: ${(widget.config.getOpacity * 100).round().toString()}",
                          onChanged: (value) {
                            setState(() {
                              windowManager.setOpacity(value);
                              widget.config.setOpacity = value;
                            });
                          },
                        )))),
            SettingWidget(
                title: widget.config.getGradientVisible
                    ? "Disabled gradeint"
                    : "Enable Gradient",
                child: Material(
                    color: Colors.transparent,
                    child: Transform.scale(
                        scale: 0.8,
                        child: Switch(
                            activeColor: Color.fromARGB(255, 214, 214, 214),
                            activeTrackColor: Colors.grey,
                            inactiveTrackColor: Color.fromARGB(255, 66, 66, 66),
                            value: widget.config.getGradientVisible,
                            onChanged: (value) => widget.gradient!()))))
          ],
        )));
  }
}
