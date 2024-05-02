import 'package:bill_calculator/utils/color_ext.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:bill_calculator/utils/time_of_day_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Future<T?> showDateTimePicker<T>({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  assert(firstDate.isBefore(lastDate), 'firstDate must be before lastDate');
  assert(
    initialDate.isAfter(firstDate) && initialDate.isBefore(lastDate),
    'initialDate must be between firstDate and lastDate',
  );
  return showDialog<T?>(
    context: context,
    builder: (_) => _DateTimePickerDialog(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ),
  );
}

class _DateTimePickerDialog extends HookWidget {
  const _DateTimePickerDialog({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  Widget build(BuildContext context) {
    final selectedDateTime = useState<DateTime>(initialDate);
    final theme = Theme.of(context);
    final calendarStyle = CalendarStyle(
      weekendTextStyle: TextStyle(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      selectedTextStyle: TextStyle(
        color: theme.colorScheme.onPrimary,
      ),
      todayTextStyle: TextStyle(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      selectedDecoration: BoxDecoration(
        color: theme.colorScheme.primary,
        shape: BoxShape.circle,
      ),
      todayDecoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
        shape: BoxShape.circle,
      ),
    );
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 24, 20, 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select date time'.hardCode,
                style: theme.textTheme.bodyLarge,
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: _SelectedTime(
                      onChanged: (timeOfDay) {
                        final newDateTime = DateTime(
                          selectedDateTime.value.year,
                          selectedDateTime.value.month,
                          selectedDateTime.value.day,
                          timeOfDay.hour,
                          timeOfDay.minute,
                        );
                        selectedDateTime.value = newDateTime;
                      },
                      value: selectedDateTime.value,
                    ),
                  )
                ],
              ),
              const Gap(20),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.surfaceVariant,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarFormat: CalendarFormat.month,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month'
                    },
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: theme.hintColor),
                    ),
                    calendarStyle: calendarStyle,
                    selectedDayPredicate: (day) => isSameDay(
                      day,
                      selectedDateTime.value,
                    ),
                    firstDay: firstDate,
                    lastDay: lastDate,
                    focusedDay: selectedDateTime.value,
                    onDaySelected: (selectedDay, focusedDay) => selectedDateTime
                        .value = selectedDateTime.value.copyWith(
                      year: selectedDay.year,
                      month: selectedDay.month,
                      day: selectedDay.day,
                    ),
                  ),
                ),
              ),
              const Gap(12),
              _QuickSelections(onChanged: (date) {
                selectedDateTime.value = date;
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'.hardCode),
                  ),
                  const Gap(12),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(selectedDateTime.value);
                    },
                    child: Text('OK'.hardCode),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickSelections extends StatelessWidget {
  const _QuickSelections({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: [
        FilledButton(
          onPressed: () {
            final now = DateTime.now();
            onChanged(now);
          },
          child: Text('Now'.hardCode),
        ),
        FilledButton(
          onPressed: () {
            final now = DateTime.now();
            final tomorrow = now.add(const Duration(days: 1));
            onChanged(tomorrow);
          },
          child: Text('Tomorrow'.hardCode),
        ),
      ],
    );
  }
}

class _SelectedTime extends StatelessWidget {
  const _SelectedTime({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final DateTime value;
  final ValueChanged<TimeOfDay> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeOfDay = TimeOfDay.fromDateTime(value);

    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            showTimePicker(
              context: context,
              initialTime: timeOfDay,
            ).then((TimeOfDay? time) {
              if (time != null) {
                onChanged(time);
              }
            });
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                DateFormat('hh:mm').format(value),
                style: theme.textTheme.headlineMedium,
              ),
            ),
          ),
        ),
        const Gap(12),
        SegmentedButton(
          showSelectedIcon: false,
          style: SegmentedButton.styleFrom(
            selectedBackgroundColor: theme.colorScheme.tertiaryContainer,
            selectedForegroundColor: theme.colorScheme.onTertiaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onSelectionChanged: (dayPeriod) {
            if (dayPeriod.isEmpty) return;
            final selectedDayPeriod = dayPeriod.first;
            if (selectedDayPeriod != timeOfDay.period) {
              final newTimeOfDay = timeOfDay.replaceDayPeriod(
                selectedDayPeriod,
              );
              onChanged(newTimeOfDay);
            }
          },
          segments: [
            ButtonSegment(
              value: DayPeriod.am,
              label: Text('AM'.hardCode),
            ),
            ButtonSegment(
              value: DayPeriod.pm,
              label: Text('PM'.hardCode),
            ),
          ],
          selected: {timeOfDay.period},
        ),
      ],
    );
  }
}
