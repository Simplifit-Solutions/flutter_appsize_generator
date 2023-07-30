import 'dart:io';

import 'package:flutter_appsize_generator/src/constants.dart';
import 'package:yaml/yaml.dart';

/// inspired by vlazdra's github repository flutter_native_splash
/// https://github.com/jonbhanson/flutter_native_splash/blob/master/lib/cli_commands.dart
class YamlParser {
  final String _dataKey = 'flutter_appsize_generator';

  Map<String, dynamic>? _yamlMap;

  int get rasterSize => _yamlMap?['raster_size'] ?? defaultRasterSize;
  int get maxSize => _yamlMap?['max_size'] ?? defaultMaxSize;

  Future<void> init() async {
    final filePath = 'pubspec.yaml';
    final fileContent = await File(filePath).readAsString();

    final data = loadYaml(fileContent);
    final relevantData = data[_dataKey];
    if (relevantData == null) return;
    _yamlMap = _yamlToMap(relevantData);
  }

  Map<String, dynamic> _yamlToMap(YamlMap yamlMap) {
    final Map<String, dynamic> map = <String, dynamic>{};
    for (final MapEntry<dynamic, dynamic> entry in yamlMap.entries) {
      if (entry.value is YamlList) {
        final list = <String>[];
        for (final value in entry.value as YamlList) {
          if (value is String) {
            list.add(value);
          }
        }
        map[entry.key as String] = list;
      } else if (entry.value is YamlMap) {
        map[entry.key as String] = _yamlToMap(entry.value as YamlMap);
      } else {
        map[entry.key as String] = entry.value;
      }
    }
    return map;
  }
}
