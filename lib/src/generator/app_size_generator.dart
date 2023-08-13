import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:flutter_appsize_generator/src/util/class_builder.dart';

class AppSizeGenerator {
  final int rasterSize;
  final int maxSize;

  AppSizeGenerator(this.rasterSize, this.maxSize);

  Future<void> build() async {
    final appSizeClass = ClassBuilderFactory(
      className: 'AppSize',
      isStatic: true,
    );
    
    appSizeClass.addConstFields<double>('s0', 0);
    for (int step = rasterSize; step <= maxSize; step += rasterSize) {
      appSizeClass.addConstFields<double>('s$step', step);
    }

    final filepath =
        path.join(path.current, 'lib', 'generated', 'app_size.dart');
    final file = File(filepath);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    await file.writeAsString(appSizeClass.build());
  }
}
