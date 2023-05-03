import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TitleSongWidget extends StatefulWidget {
  late VoidCallback? onDoubleTap;
  final String? title;
  TitleSongWidget({Key? key, this.title, this.onDoubleTap}) : super(key: key);

  @override
  _TitleSongWidgetState createState() => _TitleSongWidgetState();
}

class _TitleSongWidgetState extends State<TitleSongWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: widget.onDoubleTap,
        child: widget.title != null
            ? Marquee(
                textScaleFactor: 0.25,
                blankSpace: 25,
                text: widget.title!,
                style: const TextStyle(
                    color: Colors.white70, decoration: TextDecoration.none),
              )
            : const SizedBox());
  }
}
