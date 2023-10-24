import 'dart:io';
import 'package:path/path.dart' as path;

class ExportGenerator {
  ExportGenerator();

  Future<void> build() async {
    final buf = StringBuffer();
    final folderPath = path.join(path.current, 'lib', 'generated');
    final dir = Directory(folderPath);
    await for (final file in dir.list()) {
      if(file.path.contains('export.dart')) continue;
      buf.writeln('export \'${path.basename(file.path)}\';');
    }
    final filepath = path.join(path.current, 'lib', 'generated', 'export.dart');
    final file = File(filepath);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    await file.writeAsString(buf.toString());
  }
}
