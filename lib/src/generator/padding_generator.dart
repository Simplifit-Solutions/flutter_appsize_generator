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

    buf.writeln("const EdgeInsets allPadding0 = EdgeInsets.zero;");
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addAllPadding(step);
    }

    buf.writeln();
    buf.writeln(
        "const EdgeInsets horizontalPadding0 = EdgeInsets.symmetric(horizontal: AppSize.s0);");
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addHorizontalPadding(step);
    }
    buf.writeln();

    buf.writeln(
        "const EdgeInsets verticalPadding0 = EdgeInsets.symmetric(vertical: AppSize.s0);");
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addVerticalPadding(step);
    }
    buf.writeln();

    buf.writeln(
        "const EdgeInsets leftPadding0 = EdgeInsets.only(left: AppSize.s0);");
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addLeftPadding(step);
    }
    buf.writeln();
    buf.writeln(
        "const EdgeInsets topPadding0 = EdgeInsets.only(top: AppSize.s0);");
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addTopPadding(step);
    }
    buf.writeln();
    buf.writeln(
        "const EdgeInsets rightPadding0 = EdgeInsets.only(right: AppSize.s0);");
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      _addRightPadding(step);
    }
    buf.writeln();
    buf.writeln(
        "const EdgeInsets bottomPadding0 = EdgeInsets.only(bottom: AppSize.s0);");
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
        "const EdgeInsets allPadding$step = EdgeInsets.all(AppSize.s$step);");
  }

  void _addHorizontalPadding(int step) {
    buf.writeln(
        "const EdgeInsets horizontalPadding$step = EdgeInsets.symmetric(horizontal: AppSize.s$step);");
  }

  void _addVerticalPadding(int step) {
    buf.writeln(
        "const EdgeInsets verticalPadding$step = EdgeInsets.symmetric(vertical: AppSize.s$step);");
  }

  void _addLeftPadding(int step) {
    buf.writeln(
        "const EdgeInsets leftPadding$step = EdgeInsets.only(left: AppSize.s$step);");
  }

  void _addTopPadding(int step) {
    buf.writeln(
        "const EdgeInsets topPadding$step = EdgeInsets.only(top: AppSize.s$step);");
  }

  void _addRightPadding(int step) {
    buf.writeln(
        "const EdgeInsets rightPadding$step = EdgeInsets.only(right: AppSize.s$step);");
  }

  void _addBottomPadding(int step) {
    buf.writeln(
        "const EdgeInsets bottomPadding$step = EdgeInsets.only(bottom: AppSize.s$step);");
  }
}
