import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class SplashController {
  final double _WIDTH = 400;
  final double _HEIGHT = 500;

  SplashController();

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
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
