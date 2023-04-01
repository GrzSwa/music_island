import 'package:ai_desktop_chat/init_app_window/splash.dart';
import 'package:ai_desktop_chat/init_app_window/splashController.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  SplashController _splashController = SplashController();
  _splashController.initAppWindow();

  runApp(const Splash());
}
