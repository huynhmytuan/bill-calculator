import 'package:flutter/material.dart';

class DateTimeEditingController extends ValueNotifier<DateTime?> {
  DateTimeEditingController({
    DateTime? initialValue,
  }) : super(initialValue);

  set dateTime(DateTime? value) {
    value = value;
    notifyListeners();
  }
}
