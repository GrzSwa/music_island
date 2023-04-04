import 'dart:developer';

import 'package:ai_desktop_chat/components/Message.dart';
import 'package:ai_desktop_chat/components/chatInputField.dart';
import 'package:ai_desktop_chat/components/expandableIconList.dart';
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
  final String _exampleMessage =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam maximus turpis id enim tincidunt convallis. Duis placerat facilisis arcu at consequat. Integer iaculis consequat auctor. Pellentesque eget mollis justo, ut tristique purus. Suspendisse vestibulum gravida mattis. Nulla cursus orci ut pulvinar fermentum. Cras sem ante, scelerisque sit amet iaculis sit amet, ";

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
                          padding: EdgeInsets.only(top: 5),
                          alignment: Alignment.centerLeft,
                          color: const Color.fromRGBO(68, 70, 84, 1),
                          child: ListView.builder(
                              itemCount: _messages.length,
                              itemBuilder: (context, index) {
                                return Message(message: _messages[index]);
                              }))),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
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
