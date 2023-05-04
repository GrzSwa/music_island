import 'package:ai_desktop_chat/mainWindow.dart';
import 'package:ai_desktop_chat/settings/config.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  ApplicationConfiguration config = ApplicationConfiguration();
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
      size: config.getSize,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      backgroundColor: Colors.transparent,
      alwaysOnTop: true);
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setPosition(config.getPosition);
    await windowManager.setResizable(false);
    await windowManager.setMaximizable(false);
    await windowManager.setMinimizable(false);
    await windowManager.setAsFrameless();
    await windowManager.setOpacity(config.getOpacity);
  });

  runApp(MainWindow());
}
