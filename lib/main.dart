import 'package:ai_desktop_chat/init_app_window/splash.dart';
import 'package:ai_desktop_chat/init_app_window/splashController.dart';
import 'package:ai_desktop_chat/responsive/Chat.dart';
import 'package:ai_desktop_chat/responsive/defaultChat.dart';
import 'package:ai_desktop_chat/responsive/responsiveLayoutController.dart';
import 'package:ai_desktop_chat/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  //SplashController _splashController = SplashController();
  ResponsiveLayoutController _responsiveLayoutController =
      ResponsiveLayoutController();

  //_splashController.initAppWindow();
  //runApp(const Splash());

  _responsiveLayoutController.initAppWindow();
  runApp(ResponsiveLayout(
    chat: const Chat(),
    defaultChat: const DefaultChat(),
  ));
}
