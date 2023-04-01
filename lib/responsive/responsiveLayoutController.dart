import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ResponsiveLayoutController {
  final double _WIDTH = 450;
  final double _HEIGHT = 600;
  ResponsiveLayoutController();

  double get getWidth => _WIDTH;
  double get getHeigth => _HEIGHT;

  void initAppWindow() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
        fullScreen: false,
        size: Size(_WIDTH, _HEIGHT),
        center: true,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        minimumSize: Size(_WIDTH, _HEIGHT),
        titleBarStyle: TitleBarStyle.hidden);

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
