# Flutter AppSize Generator
This package is a simple provider for some IU components inspired by Simon Lightfoot.

In general This package generates 6 files into your `lib/generated/`folder.
- app_size.dart
Here all App Sizes are defined as const static variables
- app_margin.dart
Here we provide const SizedBoxes which use the defined AppSizes to provide easy to use margin variables
- app_padding.dart
Here we provide const EdgeInsets which use the defined AppSizes to provide easy to use padding variables
- sized_box_extension.dart
This extension provides operator extensions for the SizedBoxes class, now you can easily stack SizedBoxes with each other or multipy their sizes
- edge_insets_extension.dart
This extension provides operator extensions for the edge insets class, now you can easily stack edge insets with each other or multipy their sizes
- export.dart
This file is a barrel file for all greated files. so you only need to insert one import to use all functionalities.

# Get Started
Install `flutter_appsize_generator` as `dev_dependency` in your `pubspec.yaml`.

```Yaml
dev_dependendies:
  flutter_appsize_generator:
    url: https://github.com/Simplifit-Solutions/flutter_appsize_generator
```

Run `flutter pub run flutter_appsize_generator:generate` to generate the files.

# Configuration
Config in your pubspec.yaml
```Yaml
flutter_appsize_generator:
  #defines which step size should be used
  raster_size: 8 #default
  #defines which step is the max step to generate
  max_size: 120 #default
```