import 'package:ai_desktop_chat/mainWindow.dart';
import 'package:ai_desktop_chat/constants/const.dart' as constants;
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: constants.SIZE,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      backgroundColor: Colors.transparent,
      alwaysOnTop: true);
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setPosition(Offset(1600 / 2 - 100, 3));
    await windowManager.setResizable(false);
    await windowManager.setMaximizable(false);
    await windowManager.setMinimizable(false);
    await windowManager.setAsFrameless();
    await windowManager.setOpacity(0.9);
  });

  runApp(MainWindow());
}
