import 'package:ai_desktop_chat/components/expandableIconList.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatefulWidget {
  final Function(String) onSendMessage;

  ChatInputField({required this.onSendMessage});

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _textController = TextEditingController();
  bool _showExpandableMenu = false;

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
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      cursorColor: Colors.white,
                      textAlign: TextAlign.left,
                      cursorWidth: 1,
                      style: const TextStyle(
                          color: Color.fromRGBO(122, 122, 126, 1)),
                      controller: _textController,
                      maxLines: null,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Send a message...',
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(122, 122, 126, 1)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 45),
              child: const ExpandableIconList(),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                    color: const Color.fromRGBO(52, 53, 65, 1),
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send_outlined,
                        color: Color.fromRGBO(122, 122, 126, 1),
                      ),
                      onPressed: _sendMessage,
                    ))),
          ],
        ));
  }
}
