import 'package:flutter/material.dart';

class ExistedChatButton extends StatelessWidget {
  final String title;
  const ExistedChatButton(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: FractionallySizedBox(
            widthFactor: 1,
            child: OutlinedButton.icon(
              style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                      (states) => const BorderSide(
                            style: BorderStyle.none,
                          )),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                          (states) => const EdgeInsets.fromLTRB(5, 17, 0, 17))),
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 14,
                color: Color.fromRGBO(236, 236, 241, 1),
              ),
              label: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromRGBO(236, 236, 241, 1)),
                  )),
            )));
  }
}
