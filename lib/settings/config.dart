import "dart:io";
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';
import 'package:flutter/material.dart';

class ApplicationConfiguration {
  late Size _SIZE;
  late Offset _POSITION;
  late double _OPACITY;
  late Color _BACKGROUND;
  late LinearGradient _LINEAR_GRADIENT;
  late bool _GRADIENT;

  ApplicationConfiguration() {
    Map yamlMap = read();

    _SIZE = Size(yamlMap["position"]['width'].toDouble(),
        yamlMap["position"]['height'].toDouble());

    _POSITION = Offset(yamlMap["position"]['positionX'].toDouble(),
        yamlMap["position"]['positionY'].toDouble());

    _OPACITY = yamlMap["position"]['opacity'].toDouble();

    _BACKGROUND = Color.fromRGBO(
        yamlMap["theme"]['background']['r'],
        yamlMap["theme"]['background']['g'],
        yamlMap["theme"]['background']['b'],
        yamlMap["theme"]['background']['o']);

    _GRADIENT = yamlMap["theme"]['gradient'];

    _LINEAR_GRADIENT = LinearGradient(colors: [
      Color.fromRGBO(
          yamlMap["theme"]['gradientColor']['color1']['r'],
          yamlMap["theme"]['gradientColor']['color1']['g'],
          yamlMap["theme"]['gradientColor']['color1']['b'],
          yamlMap["theme"]['gradientColor']['color1']['o']),
      Color.fromRGBO(
          yamlMap["theme"]['gradientColor']['color2']['r'],
          yamlMap["theme"]['gradientColor']['color2']['g'],
          yamlMap["theme"]['gradientColor']['color2']['b'],
          yamlMap["theme"]['gradientColor']['color2']['o']),
    ]);
  }

  Size get getSize => _SIZE;
  Offset get getPosition => _POSITION;
  double get getOpacity => _OPACITY;
  Color get getBackgroundColor => _BACKGROUND;
  LinearGradient get getLinearGradient => _LINEAR_GRADIENT;
  bool get getGradientVisible => _GRADIENT;

  set setSize(Size size) {
    update();
    _SIZE = size;
  }

  set setPosition(Offset position) {
    update();
    _POSITION = position;
  }

  set setOpacity(double opacity) {
    update();
    _OPACITY = opacity;
  }

  set setBackgroundColor(Color background) {
    update();
    _BACKGROUND = background;
  }

  set setLinearGradient(LinearGradient linearGradient) {
    update();
    _LINEAR_GRADIENT = linearGradient;
  }

  set setGradientVisible(bool gradientVisible) {
    update();
    _GRADIENT = gradientVisible;
  }

  Map read() {
    File file = File('lib/settings/config.yaml');
    String text = file.readAsStringSync();
    Map yamlMap = loadYaml(text);
    return yamlMap;
  }

  void update() {
    File file = File('lib/settings/config.yaml');
    var yamlWriter = YAMLWriter();

    var yaml = yamlWriter.write({
      'position': {
        'width': _SIZE.width,
        'height': _SIZE.height,
        'positionX': _POSITION.dx,
        'positionY': _POSITION.dy,
        'opacity': _BACKGROUND.opacity
      },
      'theme': {
        'background': {
          'r': _BACKGROUND.red,
          'g': _BACKGROUND.green,
          'b': _BACKGROUND.blue,
          'o': _BACKGROUND.opacity
        },
        'gradient': _GRADIENT,
        'gradientColor': {
          'color1': {
            'r': _LINEAR_GRADIENT.colors[0].red,
            'g': _LINEAR_GRADIENT.colors[0].green,
            'b': _LINEAR_GRADIENT.colors[0].blue,
            'o': _LINEAR_GRADIENT.colors[0].opacity
          },
          'color2': {
            'r': _LINEAR_GRADIENT.colors[1].red,
            'g': _LINEAR_GRADIENT.colors[1].green,
            'b': _LINEAR_GRADIENT.colors[1].blue,
            'o': _LINEAR_GRADIENT.colors[1].opacity
          }
        }
      }
    });

    file.createSync();
    file.writeAsStringSync(yaml);
  }
}
