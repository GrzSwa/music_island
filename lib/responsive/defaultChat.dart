import 'dart:developer';

import 'package:ai_desktop_chat/components/chatInputField.dart';
import 'package:ai_desktop_chat/components/topBar.dart';
import 'package:ai_desktop_chat/responsive/responsiveLayoutController.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:ai_desktop_chat/components/drawer.dart' as components;

class DefaultChat extends StatefulWidget {
  const DefaultChat({Key? key}) : super(key: key);

  @override
  _DefaultChatState createState() => _DefaultChatState();
}

const borderColor = Color.fromRGBO(52, 53, 65, 1);
final GlobalKey<ScaffoldState> _key = GlobalKey();

class _DefaultChatState extends State<DefaultChat> {
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _key,
          drawer: const Drawer(
            width: 230,
            backgroundColor: Color.fromRGBO(52, 53, 65, 1),
            child: components.Drawer(),
          ),
          body: WindowBorder(
              color: borderColor,
              width: 0,
              child: Column(
                children: [
                  SizedBox(height: 45, child: TopBar(_key)),
                  Expanded(
                      child: Container(
                    color: Color.fromRGBO(68, 70, 84, 1),
                  )),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromRGBO(52, 53, 65, 1),
                    child: ChatInputField(onSendMessage: _sendMessage),
                  )
                ],
              )),
        ));
  }

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }
}
