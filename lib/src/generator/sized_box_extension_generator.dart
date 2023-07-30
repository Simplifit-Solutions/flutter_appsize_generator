import 'dart:io';
import 'package:flutter_appsize_generator/src/util/extension_builder.dart';
import 'package:path/path.dart' as path;

class SizedBoxExtensionGenerator {
  SizedBoxExtensionGenerator();

  Future<void> build() async {
    final extensionBuilder = ExtensionBuilderFactory(
        className: 'SizedBox', extendsFlutterClass: true);
    extensionBuilder.addOperator(
      "operator +(SizedBox other) => SizedBox(height: (height??0) + (other.height??0), width: (width??0) + (other.width??0));",
    );
    extensionBuilder.addOperator(
      "operator -(SizedBox other) => SizedBox(height: max((height??0) - (other.height??0), 0), width: max((width??0) - (other.width??0), 0));",
      includesMathLib: true,
    );
    extensionBuilder.addOperator(
      "operator *(num other) => SizedBox(height: (height??0) * other, width: (width??0) * other);",
    );
    extensionBuilder.addOperator(
      "operator /(num other) => SizedBox(height: (height??0) / other, width: (width??0) / other);",
    );
    final filepath =
        path.join(path.current, 'lib', 'generated', 'sized_box_extension.dart');
    final file = File(filepath);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    await file.writeAsString(extensionBuilder.build());
  }
}
