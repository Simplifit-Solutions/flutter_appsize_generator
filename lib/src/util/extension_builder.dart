class ExtensionBuilderFactory {
  final StringBuffer _buf;
  final String _className;
  final bool _extendsFlutterClass;
  final Set<String> _imports = {};
  final List<String> _extensionStr = [];

  ExtensionBuilderFactory(
      {required String className, bool extendsFlutterClass = false})
      : _buf = StringBuffer(),
        _className = className,
        _extendsFlutterClass = extendsFlutterClass;

  String build() {
    if (_extendsFlutterClass) {
      _imports.add("import 'package:flutter/material.dart';");
    }

    for (final import in _imports) {
      _buf.writeln(import);
    }
    if (_imports.isNotEmpty) {
      _buf.writeln();
    }

    _buf.writeln('extension ${_className}Extension on $_className {');
    for (final ex in _extensionStr) {
      _buf.writeln(ex);
      if (_extensionStr.last != ex) _buf.writeln();
    }
    _buf.writeln('}');
    return _buf.toString();
  }

  void addOperator(String op, {bool includesMathLib = false}) {
    if (includesMathLib) {
      _imports.add("import 'dart:math';");
    }
    _extensionStr.add('  $op');
  }
}
