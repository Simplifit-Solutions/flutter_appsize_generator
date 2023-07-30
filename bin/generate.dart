import 'package:flutter_appsize_generator/src/constants.dart';
import 'package:flutter_appsize_generator/src/generator/app_size_generator.dart';
import 'package:flutter_appsize_generator/src/generator/edge_insets_extension_generator.dart';
import 'package:flutter_appsize_generator/src/generator/export_generator.dart';
import 'package:flutter_appsize_generator/src/generator/margin_generator.dart';
import 'package:flutter_appsize_generator/src/generator/padding_generator.dart';
import 'package:flutter_appsize_generator/src/generator/sized_box_extension_generator.dart';
import 'package:flutter_appsize_generator/src/util/yaml_parser.dart';

Future<void> main(List<String> arguments) async {
  final yamlParser = YamlParser();
  await yamlParser.init();
  final rasterSize = yamlParser.rasterSize ?? defaultRasterSize;
  final maxSize = yamlParser.maxSize ?? defaultMaxSize;

  final appSizeGenerator = AppSizeGenerator(rasterSize, maxSize);
  await appSizeGenerator.build();
  final marginGenerator = MarginGenerator(rasterSize, maxSize);
  await marginGenerator.build();
  final sizedBoxExtensionGenerator = SizedBoxExtensionGenerator();
  await sizedBoxExtensionGenerator.build();
  final paddingGenerator = PaddingGenerator(rasterSize, maxSize);
  await paddingGenerator.build();
  final edgeInsetsExtensionGenerator = EdgeInsetsExtensionGenerator();
  await edgeInsetsExtensionGenerator.build();
  final exportGenerator = ExportGenerator();
  await exportGenerator.build();
}
