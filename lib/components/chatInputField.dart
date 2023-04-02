import 'dart:developer';

import 'package:flutter/material.dart';

class ChatInputField extends StatefulWidget {
  final Function(String) onSendMessage;

  ChatInputField({required this.onSendMessage});

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final String message = _textController.text.trim();
    if (message.isNotEmpty) {
      widget.onSendMessage(message);
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                cursorColor: Colors.white,
                cursorWidth: 1,
                style: TextStyle(color: Color.fromRGBO(122, 122, 126, 1)),
                controller: _textController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  hintText: 'Send a message...',
                  hintStyle: TextStyle(color: Color.fromRGBO(122, 122, 126, 1)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_box_outlined,
              color: Color.fromRGBO(122, 122, 126, 1),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.send_outlined,
              color: Color.fromRGBO(122, 122, 126, 1),
            ),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
