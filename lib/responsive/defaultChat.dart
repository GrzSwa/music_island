import 'package:ai_desktop_chat/components/topBar.dart';
import 'package:ai_desktop_chat/responsive/responsiveLayoutController.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class DefaultChat extends StatefulWidget {
  const DefaultChat({Key? key}) : super(key: key);

  @override
  _DefaultChatState createState() => _DefaultChatState();
}

const borderColor = Color.fromRGBO(52, 53, 65, 1);
final GlobalKey<ScaffoldState> _key = GlobalKey();

class _DefaultChatState extends State<DefaultChat> {
  final ResponsiveLayoutController _responsiveLayoutController =
      ResponsiveLayoutController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _key,
          drawer: Container(width: 200, color: Color.fromRGBO(52, 53, 65, 1)),
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
                    padding: EdgeInsets.all(10),
                    color: Color.fromRGBO(52, 53, 65, 1),
                    child: const TextField(),
                  )
                ],
              )),
        ));
  }
}
