import 'dart:io';
import 'package:path/path.dart' as path;

class PaddingGenerator {
  final buf = StringBuffer();
  final int rasterSize;
  final int maxSize;

  PaddingGenerator(this.rasterSize, this.maxSize);

  Future<void> build() async {
    _addExports();
    buf.writeln();

    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addAllPadding(step);
    }

    buf.writeln();
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addHorizontalPadding(step);
    }
    buf.writeln();

    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addVerticalPadding(step);
    }
    buf.writeln();

    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addLeftPadding(step);
    }
    buf.writeln();
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addTopPadding(step);
    }
    buf.writeln();
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addRightPadding(step);
    }
    buf.writeln();
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addBottomPadding(step);
    }

    final filepath =
        path.join(path.current, 'lib', 'generated', 'app_padding.dart');
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

  void _addAllPadding(int step) {
    buf.writeln(
        "const EdgeInsets allPadding$step = EdgeInsets.all(AppSize.appSize$step);");
  }

  void _addHorizontalPadding(int step) {
    buf.writeln(
        "const EdgeInsets horizontalPadding$step = EdgeInsets.symmetric(horizontal: AppSize.appSize$step);");
  }

  void _addVerticalPadding(int step) {
    buf.writeln(
        "const EdgeInsets verticalPadding$step = EdgeInsets.symmetric(vertical: AppSize.appSize$step);");
  }

  void _addLeftPadding(int step) {
    buf.writeln(
        "const EdgeInsets leftPadding$step = EdgeInsets.only(left: AppSize.appSize$step);");
  }

  void _addTopPadding(int step) {
    buf.writeln(
        "const EdgeInsets topPadding$step = EdgeInsets.only(top: AppSize.appSize$step);");
  }

  void _addRightPadding(int step) {
    buf.writeln(
        "const EdgeInsets rightPadding$step = EdgeInsets.only(right: AppSize.appSize$step);");
  }

  void _addBottomPadding(int step) {
    buf.writeln(
        "const EdgeInsets bottomPadding$step = EdgeInsets.only(bottom: AppSize.appSize$step);");
  }
}
