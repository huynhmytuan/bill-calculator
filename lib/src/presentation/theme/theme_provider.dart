import 'package:bill_calculator/src/presentation/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);
