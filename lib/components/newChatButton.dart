import 'package:flutter/material.dart';

class NewChatButton extends StatelessWidget {
  const NewChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        child: OutlinedButton.icon(
          style: ButtonStyle(
              side: MaterialStateProperty.resolveWith<BorderSide>((states) =>
                  const BorderSide(color: Colors.white, width: 0.2)),
              padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                  (states) => const EdgeInsets.fromLTRB(5, 17, 0, 17))),
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            size: 14,
            color: Color.fromRGBO(236, 236, 241, 1),
          ),
          label: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "New chat",
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(236, 236, 241, 1)),
              )),
        ));
  }
}
