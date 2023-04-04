import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Message extends StatelessWidget {
  final String message;
  final bool chatRequest;
  const Message({required this.message, this.chatRequest = false, Key? key})
      : super(key: key);
  final String _svgAvatar = 'assets/Avatar.svg';
  final String _svgLogo = 'assets/ChatGPT.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: chatRequest ? Colors.transparent : Color.fromRGBO(52, 53, 65, 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            chatRequest ? _svgLogo : _svgAvatar,
            width: 35,
            height: 35,
          ),
          const Divider(
            indent: 15,
          ),
          Expanded(
              child: Text(
            message,
            style: TextStyle(color: Color.fromRGBO(236, 236, 241, 1)),
          ))
        ],
      ),
    );
  }
}
