import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';

class ExpandableIconList extends StatefulWidget {
  const ExpandableIconList({Key? key}) : super(key: key);

  @override
  _ExpandableIconListListState createState() => _ExpandableIconListListState();
}

class _ExpandableIconListListState extends State<ExpandableIconList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TranslationAnimatedWidget.tween(
              enabled: _isExpanded,
              duration: const Duration(milliseconds: 200),
              translationDisabled: const Offset(400, 0),
              translationEnabled: const Offset(0, 0),
              child: OpacityAnimatedWidget.tween(
                enabled: _isExpanded,
                opacityDisabled: 0,
                opacityEnabled: 1,
                duration: const Duration(milliseconds: 200),
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(68, 70, 84, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    transform: Matrix4.translationValues(35, 0, 0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.document_scanner_outlined),
                            color: Color.fromRGBO(122, 122, 126, 1)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.image_outlined),
                            color: Color.fromRGBO(122, 122, 126, 1)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.library_music_outlined),
                            color: Color.fromRGBO(122, 122, 126, 1)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mic_outlined),
                            color: Color.fromRGBO(122, 122, 126, 1)),
                        const SizedBox(
                          width: 35,
                        )
                      ],
                    )),
              ),
            ),
            IconButton(
              icon: !_isExpanded
                  ? Icon(Icons.attach_file_outlined,
                      color: Color.fromRGBO(122, 122, 126, 1))
                  : Icon(Icons.close_rounded,
                      color: Color.fromRGBO(122, 122, 126, 1)),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            )
          ]),
    );
  }
}
