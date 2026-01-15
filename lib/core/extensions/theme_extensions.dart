import 'package:flutter/material.dart';

extension ThemeExtension on ThemeData {
  EdgeInsets get screenPadding => EdgeInsets.all(16.0);
  double get screenPaddingDouble => 8.0;

  BorderRadius get containerRadius => BorderRadius.circular(8.0);
}
