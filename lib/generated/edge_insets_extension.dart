import 'dart:math';
import 'package:flutter/material.dart';

extension EdgeInsetsExtension on EdgeInsets {
  operator +(EdgeInsets other) => EdgeInsets.only(
        left: left + other.left,
        top: top + (other.top),
        right: right + other.right,
        bottom: bottom + other.bottom,
      );

  operator -(EdgeInsets other) => EdgeInsets.only(
        left: max(left - other.left, 0),
        top: max(top - other.top, 0),
        right: max(right - other.right, 0),
        bottom: max(bottom - other.bottom, 0),
      );

  operator *(num other) => EdgeInsets.only(
        left: left * other,
        top: top * other,
        right: right * other,
        bottom: bottom * other,
      );

  operator /(num other) => EdgeInsets.only(
        left: left / other,
        top: top / other,
        right: right / other,
        bottom: bottom / other,
      );
}
