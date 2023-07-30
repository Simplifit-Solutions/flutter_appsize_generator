import 'dart:io';
import 'package:path/path.dart' as path;

class MarginGenerator {
  final buf = StringBuffer();
  final int rasterSize;
  final int maxSize;

  MarginGenerator(this.rasterSize, this.maxSize);

  Future<void> build() async {
    _addExports();
    buf.writeln();

    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addHorizontalMargin(step);
    }
    buf.writeln();

    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addVerticalMargin(step);
    }

    final filepath =
        path.join(path.current, 'lib', 'generated', 'app_margin.dart');
    final file = File(filepath);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    await file.writeAsString(buf.toString());
  }

  void _addExports() {
    buf.writeln("import 'app_size.dart';");
    buf.writeln("import 'package:flutter/material.dart';");
  }

  void _addHorizontalMargin(int step) {
    buf.writeln(
        "const SizedBox horizontalMargin$step = SizedBox(width: AppSize.appSize$step);");
  }

  void _addVerticalMargin(int step) {
    buf.writeln(
        "const SizedBox verticalMargin$step = SizedBox(height: AppSize.appSize$step);");
  }
}
