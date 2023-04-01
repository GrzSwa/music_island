import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget defaultChat;
  final Widget chat;

  ResponsiveLayout({
    required this.defaultChat,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 730) {
        return defaultChat;
      } else {
        return chat;
      }
    });
  }
}
