class ClassBuilderFactory {
  final StringBuffer _buf;
  final String _className;
  final bool _isStatic;
  final List<String> _constFields = [];

  ClassBuilderFactory({required String className, bool isStatic = false})
      : _buf = StringBuffer(),
        _isStatic = isStatic,
        _className = className;

  void addConstFields(String name, String type, dynamic value) {
    _constFields.add('  static const $type $name = $value;');
  }

  String build() {
    _buf.writeln('class $_className {');
    _buildConstructor();
    _buf.writeln();
    _buildConstFields();
    _buf.writeln('}');
    return _buf.toString();
  }

  void _buildConstFields() {
    for (var field in _constFields) {
      _buf.writeln(field);
    }
  }

  void _buildConstructor() {
    if (_isStatic) {
      _buf.writeln('  $_className._();');
    }
  }
}
