import 'dart:io';
import 'package:flutter_appsize_generator/src/util/extension_builder.dart';
import 'package:path/path.dart' as path;

class EdgeInsetsExtensionGenerator {
  EdgeInsetsExtensionGenerator();

  Future<void> build() async {
    final extensionBuilder = ExtensionBuilderFactory(
        className: 'EdgeInsets', extendsFlutterClass: true);

    extensionBuilder.addOperator(
      "operator +(EdgeInsets other) => EdgeInsets.only(top: top + (other.top), bottom: bottom + other.bottom, left: left + other.left, right: right + other.right);",
    );
    extensionBuilder.addOperator(
      "operator -(EdgeInsets other) => EdgeInsets.only(top: max(top - other.top, 0), left: max(left - other.left, 0), right: max(right - other.right, 0), bottom: max(bottom - other.bottom, 0));",
      includesMathLib: true,
    );
    extensionBuilder.addOperator(
      "operator *(num other) => EdgeInsets.only(top: top * other, left: left * other, right: right * other, bottom: bottom * other);",
    );
    extensionBuilder.addOperator(
      "operator /(num other) => EdgeInsets.only(top: top / other, left: left / other, bottom: bottom / other, right: right / other);",
    );
    final filepath = path.join(
        path.current, 'lib', 'generated', 'edge_insets_extension.dart');
    final file = File(filepath);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    await file.writeAsString(extensionBuilder.build());
  }
}
