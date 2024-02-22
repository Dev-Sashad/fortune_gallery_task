import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension ViewStateExtension on LoadingState {
  bool get isLoading => this == LoadingState.loading;
  bool get isIdle => this == LoadingState.idle;
  bool get isError => this == LoadingState.error;
}

extension ThemeModeExtension on ThemeMode {
  bool get isLight => this == ThemeMode.light;
  bool get isDark => this == ThemeMode.dark;
  bool get isSytem => this == ThemeMode.system;
}
