import 'package:flutter/material.dart';

extension TimeOfDayExt on TimeOfDay {
  TimeOfDay replaceDayPeriod(DayPeriod period) {
    if (period == this.period) {
      return this;
    } else {
      return TimeOfDay(
        hour: hourOfPeriod + (period == DayPeriod.pm ? 12 : 0),
        minute: minute,
      );
    }
  }
}
