import 'package:bill_calculator/src/presentation/widgets/time_input_field/date_time_editting_controller.dart';
import 'package:bill_calculator/src/presentation/widgets/time_input_field/date_time_input_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeInputFormField extends FormField<DateTime> {
  DateTimeInputFormField({
    this.focusNode,
    this.style,
    this.readOnly = false,
    this.type = DateTimeInputType.all,
    this.decoration,
    this.canRequestFocus = true,
    this.mouseCursor,
    this.statesController,
    super.key,
    this.controller,
    super.initialValue,
    super.onSaved,
    super.validator,
    this.onChanged,
    this.format,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
  }) : super(
          builder: (FormFieldState<DateTime> field) {
            final _DateTimeInputFormFieldState state =
                field as _DateTimeInputFormFieldState;
            void onChangedHandler(DateTime? value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            final InputDecoration effectiveDecoration = (decoration ??
                    const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);

            return DateTimeInputField(
              controller: state._effectiveController,
              onChanged: onChangedHandler,
              decoration: effectiveDecoration,
              focusNode: focusNode,
              format: format,
              statesController: statesController,
              style: style,
              canRequestFocus: canRequestFocus,
              enabled: enabled,
              mouseCursor: mouseCursor,
              key: key,
              readOnly: readOnly,
              type: type,
            );
          },
        );

  final FocusNode? focusNode;
  final TextStyle? style;
  final bool readOnly;
  final DateFormat? format;
  final DateTimeEditingController? controller;
  final void Function(DateTime?)? onChanged;
  final DateTimeInputType type;
  final InputDecoration? decoration;
  final bool canRequestFocus;
  final MouseCursor? mouseCursor;
  final MaterialStatesController? statesController;

  @override
  FormFieldState<DateTime> createState() => _DateTimeInputFormFieldState();
}

class _DateTimeInputFormFieldState extends FormFieldState<DateTime> {
  DateTimeEditingController? _controller;
  DateTimeEditingController get _effectiveController =>
      _inputField.controller ?? _controller!;
  DateTimeInputFormField get _inputField =>
      super.widget as DateTimeInputFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.value);
  }

  void _registerController() {
    assert(_controller != null);
  }

  void _createLocalController([DateTime? value]) {
    assert(_controller == null);
    _controller = DateTimeEditingController(initialValue: value);
  }

  @override
  void initState() {
    super.initState();
    _controller ??= DateTimeEditingController(
      initialValue: widget.initialValue,
    );
  }

  @override
  void didUpdateWidget(DateTimeInputFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_inputField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _inputField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _inputField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_inputField.controller != null) {
        setValue(_inputField.controller!.value);
        if (oldWidget.controller == null) {
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(DateTime? value) {
    super.didChange(value);

    if (_effectiveController.value != value) {
      _effectiveController.value = value ?? DateTime.now();
    }
  }

  @override
  void reset() {
    // Set the controller value before calling super.reset() to let
    // _handleControllerChanged suppress the change.
    _effectiveController.value = widget.initialValue ?? DateTime.now();
    super.reset();
    _inputField.onChanged?.call(_effectiveController.value);
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.value != value) {
      didChange(_effectiveController.value);
    }
  }
}
