import 'package:ai_desktop_chat/widgets/animate_wave_music/animated_object.dart';
import 'package:flutter/material.dart';

class AniamtedWaves extends StatefulWidget {
  final int numberOfelements;
  final bool animation;
  final List<int> duration;
  late Size size;
  late Color? color;
  late CrossAxisAlignment? crossAxisAlignment;
  AniamtedWaves(
      {Key? key,
      this.numberOfelements = 6,
      this.size = const Size(10, 30),
      this.color,
      this.animation = true,
      this.crossAxisAlignment,
      this.duration = const [900, 700, 600, 800, 500, 400]})
      : super(key: key);

  @override
  _AniamtedWavesState createState() => _AniamtedWavesState();
}

class _AniamtedWavesState extends State<AniamtedWaves> {
  @override
  Widget build(BuildContext context) {
    if (widget.animation) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.center,
          children: List.generate(widget.numberOfelements, (index) {
            return AnimatedObject(
              duration: Duration(
                  milliseconds:
                      widget.duration[index % widget.numberOfelements]),
              size: Size(widget.size.width, widget.size.height),
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            );
          }));
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              widget.numberOfelements,
              (index) => Container(
                    width: widget.size.width,
                    height: widget.size.height * 0.1,
                    color: Colors.white,
                  )));
    }
  }
}
