import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AudioButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final bool play = false;
  final double? size;

  const AudioButton(
      {Key? key, required this.onPressed, required this.icon, this.size})
      : super(key: key);

  const AudioButton.play(
      {Key? key,
      required this.onPressed,
      bool play = false,
      double this.size = 14})
      : icon = null,
        super(key: key);

  const AudioButton.backward(
      {Key? key, required this.onPressed, double this.size = 10})
      : icon = FontAwesomeIcons.backward,
        super(key: key);

  const AudioButton.forward(
      {Key? key, required this.onPressed, double this.size = 10})
      : icon = FontAwesomeIcons.forward,
        super(key: key);

  const AudioButton.loop(
      {Key? key, required this.onPressed, double this.size = 10})
      : icon = FontAwesomeIcons.repeat,
        super(key: key);

  const AudioButton.shuffle(
      {Key? key, required this.onPressed, double this.size = 10})
      : icon = FontAwesomeIcons.shuffle,
        super(key: key);

  @override
  createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.icon != null) {
      return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
              onTap: widget.onPressed,
              child: Icon(
                widget.icon,
                size: widget.size,
                color: Colors.white70,
              )));
    } else {
      return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
              onTap: () {
                _onPressed();
                widget.onPressed();
              },
              child: AnimatedIcon(
                icon: widget.play
                    ? AnimatedIcons.pause_play
                    : AnimatedIcons.play_pause,
                progress: _animationController,
                size: widget.size,
                color: Colors.white70,
              )));
    }
  }
}
