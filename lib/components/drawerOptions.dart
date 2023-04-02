import 'package:flutter/material.dart';

class DrawerOptions extends StatelessWidget {
  final Color borderColor = Color.fromRGBO(236, 236, 241, 1);

  DrawerOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: borderColor),
        OptionButton("Clear conversation",
            Icon(Icons.delete_outline_outlined, size: 14, color: borderColor)),
        OptionButton(
            "Choose model",
            Icon(Icons.mode_edit_outline_outlined,
                size: 14, color: borderColor)),
        OptionButton("Light mode",
            Icon(Icons.light_mode_outlined, size: 14, color: borderColor)),
        OptionButton("Updats & FAQ",
            Icon(Icons.question_answer_outlined, size: 14, color: borderColor)),
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final String title;
  final Icon icon;
  const OptionButton(this.title, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
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
              icon: icon,
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
