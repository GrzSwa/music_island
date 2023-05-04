import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AudioButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final bool play = false;

  const AudioButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  const AudioButton.play({Key? key, required this.onPressed, bool play = false})
      : icon = null,
        super(key: key);

  const AudioButton.backward({Key? key, required this.onPressed})
      : icon = FontAwesomeIcons.backward,
        super(key: key);

  const AudioButton.forward({Key? key, required this.onPressed})
      : icon = FontAwesomeIcons.forward,
        super(key: key);

  const AudioButton.loop({Key? key, required this.onPressed})
      : icon = FontAwesomeIcons.repeat,
        super(key: key);

  const AudioButton.shuffle({Key? key, required this.onPressed})
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
                size: 12,
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
                size: 16,
                color: Colors.white70,
              )));
    }
  }
}
