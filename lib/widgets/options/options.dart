import 'package:ai_desktop_chat/widgets/options/expanded_widget.dart';
import 'package:ai_desktop_chat/widgets/options/simple_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FlipCard(
      direction: FlipDirection.VERTICAL,
      front: SimpleWidget(),
      back: ExpandedWidget(),
    );
  }
}
