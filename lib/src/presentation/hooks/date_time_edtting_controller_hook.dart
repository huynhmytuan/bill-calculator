import 'package:bill_calculator/src/presentation/widgets/time_input_field/date_time_editting_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _DateTimeEditingControllerHookCreator {
  const _DateTimeEditingControllerHookCreator();

  /// Creates a [TextEditingController] that will be disposed automatically.
  ///
  /// The [dateTime] parameter can be used to set the initial value of the
  /// controller.
  DateTimeEditingController call({DateTime? dateTime, List<Object?>? keys}) {
    return use(_DateTimeEditingControllerHook(dateTime, keys));
  }

  /// Creates a [TextEditingController] from the initial [value] that will
  /// be disposed automatically.
  DateTimeEditingController fromValue(
    DateTime value, [
    List<Object?>? keys,
  ]) {
    return use(_DateTimeEditingControllerHook.fromValue(value, keys));
  }
}

const useDateTimeEditingController = _DateTimeEditingControllerHookCreator();

class _DateTimeEditingControllerHook extends Hook<DateTimeEditingController> {
  const _DateTimeEditingControllerHook(
    this.initialDateTime, [
    List<Object?>? keys,
  ])  : initialValue = null,
        super(keys: keys);

  const _DateTimeEditingControllerHook.fromValue(
    DateTime this.initialValue, [
    List<Object?>? keys,
  ])  : initialDateTime = null,
        super(keys: keys);

  final DateTime? initialDateTime;
  final DateTime? initialValue;

  @override
  _DateTimeEditingControllerHookState createState() {
    return _DateTimeEditingControllerHookState();
  }
}

class _DateTimeEditingControllerHookState extends HookState<
    DateTimeEditingController, _DateTimeEditingControllerHook> {
  late final _controller =
      DateTimeEditingController(initialValue: hook.initialDateTime);

  @override
  DateTimeEditingController build(BuildContext context) => _controller;

  @override
  void dispose() => _controller.dispose();

  @override
  String get debugLabel => 'useDateTimeEditingController';
}
