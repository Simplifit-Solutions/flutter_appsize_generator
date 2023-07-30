import 'dart:math';
import 'package:flutter/material.dart';

extension SizedBoxExtension on SizedBox {
  operator +(SizedBox other) => SizedBox(
        height: (height ?? 0) + (other.height ?? 0),
        width: (width ?? 0) + (other.width ?? 0),
      );

  operator -(SizedBox other) => SizedBox(
        height: max((height ?? 0) - (other.height ?? 0), 0),
        width: max((width ?? 0) - (other.width ?? 0), 0),
      );

  operator *(num other) => SizedBox(
        height: (height ?? 0) * other,
        width: (width ?? 0) * other,
      );

  operator /(num other) => SizedBox(
        height: (height ?? 0) / other,
        width: (width ?? 0) / other,
      );
}
