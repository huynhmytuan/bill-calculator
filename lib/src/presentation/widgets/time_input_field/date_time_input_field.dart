import 'package:bill_calculator/src/presentation/widgets/pick_date_time.dart';
import 'package:bill_calculator/src/presentation/widgets/time_input_field/date_time_editting_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

enum DateTimeInputType {
  /// Only date picker will be shown
  date,

  /// Only time picker will be shown
  time,

  /// Both date and time picker will be shown
  all,
}

class DateTimeInputField extends StatefulWidget {
  const DateTimeInputField({
    super.key,
    this.controller,
    this.enabled,
    this.format,
    this.onChanged,
    this.style,
    this.focusNode,
    this.textAlign,
    this.textAlignVertical,
    this.readOnly = false,
    this.type = DateTimeInputType.date,
    this.decoration,
    this.canRequestFocus = true,
    this.statesController,
    this.mouseCursor,
  });

  final bool? enabled;
  final FocusNode? focusNode;
  final TextStyle? style;
  final bool readOnly;
  final DateFormat? format;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final DateTimeEditingController? controller;
  final void Function(DateTime?)? onChanged;
  final DateTimeInputType type;
  final InputDecoration? decoration;
  final bool canRequestFocus;
  final MouseCursor? mouseCursor;
  final MaterialStatesController? statesController;

  @override
  State<DateTimeInputField> createState() => _DateTimeInputFieldState();
}

class _DateTimeInputFieldState extends State<DateTimeInputField> {
  DateTimeEditingController? _controller;
  DateTimeEditingController get _effectiveController =>
      widget.controller ?? _controller!;
  final _statesController = MaterialStatesController();
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  bool _isHovering = false;

  bool get _isEnabled => widget.enabled ?? widget.decoration?.enabled ?? true;

  bool get _hasError =>
      widget.decoration?.errorText != null || widget.decoration?.error != null;

  @override
  void initState() {
    if (widget.controller == null) {
      _createLocalController();
    }
    _effectiveFocusNode.canRequestFocus = widget.canRequestFocus && _isEnabled;
    _effectiveFocusNode.addListener(_handleFocusChanged);
    _initStatesController();
    super.initState();
  }

  bool get _canRequestFocus {
    final NavigationMode mode =
        MediaQuery.maybeNavigationModeOf(context) ?? NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return widget.canRequestFocus && _isEnabled;
      case NavigationMode.directional:
        return true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _effectiveFocusNode.canRequestFocus = _canRequestFocus;
  }

  @override
  void didUpdateWidget(covariant DateTimeInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && oldWidget.controller != null) {
      _createLocalController(oldWidget.controller!.value);
    } else if (widget.controller != null && oldWidget.controller == null) {
      _controller!.dispose();
      _controller = null;
    }

    if (widget.focusNode != oldWidget.focusNode) {
      (oldWidget.focusNode ?? _focusNode)?.removeListener(_handleFocusChanged);
      (widget.focusNode ?? _focusNode)?.addListener(_handleFocusChanged);
    }

    _effectiveFocusNode.canRequestFocus = _canRequestFocus;

    if (widget.statesController == oldWidget.statesController) {
      _statesController.update(MaterialState.disabled, !_isEnabled);
      _statesController.update(MaterialState.hovered, _isHovering);
      _statesController.update(
          MaterialState.focused, _effectiveFocusNode.hasFocus);
      _statesController.update(MaterialState.error, _hasError);
    } else {
      oldWidget.statesController?.removeListener(_handleStatesControllerChange);
      if (widget.statesController != null) {
        _internalStatesController?.dispose();
        _internalStatesController = null;
      }
      _initStatesController();
    }
  }

  void _createLocalController([DateTime? value]) {
    _controller =
        widget.controller ?? DateTimeEditingController(initialValue: value);
  }

  InputDecoration _getEffectiveDecoration() {
    final theme = Theme.of(context);
    final effectiveDecoration = (widget.decoration ?? const InputDecoration())
        .applyDefaults(theme.inputDecorationTheme);

    return effectiveDecoration.copyWith(
      enabled: _isEnabled,
    );
  }

  void _handleFocusChanged() {
    setState(() {
      // Rebuild the widget on focus change to show/hide the text selection
      // highlight.
    });
    _statesController.update(
      MaterialState.focused,
      _effectiveFocusNode.hasFocus,
    );
  }

  // Material states controller.
  MaterialStatesController? _internalStatesController;

  void _handleStatesControllerChange() {
    // Force a rebuild to resolve MaterialStateProperty properties.
    setState(() {});
  }

  void _initStatesController() {
    if (widget.statesController == null) {
      _internalStatesController = MaterialStatesController();
    }
    _statesController.update(MaterialState.disabled, !_isEnabled);
    _statesController.update(MaterialState.hovered, _isHovering);
    _statesController.update(
        MaterialState.focused, _effectiveFocusNode.hasFocus);
    _statesController.update(MaterialState.error, _hasError);
    _statesController.addListener(_handleStatesControllerChange);
  }

  void _handleHover(bool hovering) {
    if (hovering != _isHovering) {
      setState(() {
        _isHovering = hovering;
      });
      _statesController.update(MaterialState.hovered, _isHovering);
    }
  }

  Future<void> _showPicker() async {
    DateTime? result;
    switch (widget.type) {
      case DateTimeInputType.date:
        result = await showDatePicker(
          context: context,
          initialDate: _effectiveController.value ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        break;
      case DateTimeInputType.time:
        await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
              _effectiveController.value ?? DateTime.now()),
        ).then((value) {
          if (value != null) {
            result = DateTime(
              value.hour,
              value.minute,
            );
          }
        });
        break;
      case DateTimeInputType.all:
        result = await showDateTimePicker(
          context: context,
          initialDate: _effectiveController.value ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        break;
    }

    if (result != null) {
      _effectiveController.value = result;
      widget.onChanged?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(debugCheckHasDirectionality(context));
    assert(
      !(widget.style != null &&
          !widget.style!.inherit &&
          (widget.style!.fontSize == null ||
              widget.style!.textBaseline == null)),
      'inherit false style must supply fontSize and textBaseline',
    );

    final ThemeData theme = Theme.of(context);
    final TextStyle? providedStyle =
        MaterialStateProperty.resolveAs(widget.style, _statesController.value);
    final TextStyle style = _getInputStyleForState(theme.useMaterial3
            ? _m3InputStyle(context)
            : theme.textTheme.titleMedium!)
        .merge(providedStyle);
    final DateFormat format = _getDateTimeFormat();
    final DateTimeEditingController controller = _effectiveController;
    final FocusNode focusNode = _effectiveFocusNode;
    VoidCallback? handleDidGainAccessibilityFocus;
    VoidCallback? handleDidLoseAccessibilityFocus;

    switch (theme.platform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        handleDidGainAccessibilityFocus = () {
          // Automatically activate the TextField when it receives accessibility focus.
          if (!_effectiveFocusNode.hasFocus &&
              _effectiveFocusNode.canRequestFocus) {
            _effectiveFocusNode.requestFocus();
          }
        };
        handleDidLoseAccessibilityFocus = () {
          _effectiveFocusNode.unfocus();
        };
      case TargetPlatform.iOS:
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        break;
    }

    Widget child = RepaintBoundary(
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value == null) return const SizedBox.shrink();
          return Text(
            format.format(controller.value!),
            style: style,
            textAlign: widget.textAlign,
          );
        },
      ),
    );

    child = Focus(
      canRequestFocus: _canRequestFocus,
      focusNode: focusNode,
      onFocusChange: (value) => _handleFocusChanged(),
      child: child,
    );

    child = AnimatedBuilder(
      animation: Listenable.merge(<Listenable>[focusNode, controller]),
      builder: (BuildContext context, Widget? child) {
        return InputDecorator(
          decoration: _getEffectiveDecoration(),
          baseStyle: widget.style,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          isHovering: _isHovering,
          isFocused: focusNode.hasFocus,
          isEmpty: controller.value == null,
          child: child,
        );
      },
      child: child,
    );
    final MouseCursor effectiveMouseCursor =
        MaterialStateProperty.resolveAs<MouseCursor>(
      widget.mouseCursor ?? MaterialStateMouseCursor.clickable,
      _statesController.value,
    );

    return MouseRegion(
      cursor: effectiveMouseCursor,
      onEnter: (PointerEnterEvent event) => _handleHover(true),
      onExit: (PointerExitEvent event) => _handleHover(false),
      child: IgnorePointer(
        ignoring: !_isEnabled,
        child: AnimatedBuilder(
          animation: controller, // changes the _currentLength
          builder: (BuildContext context, Widget? child) {
            return Semantics(
              onDidGainAccessibilityFocus: handleDidGainAccessibilityFocus,
              onDidLoseAccessibilityFocus: handleDidLoseAccessibilityFocus,
              child: child,
            );
          },
          child: RawGestureDetector(
            gestures: <Type, GestureRecognizerFactory>{
              TapGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                () => TapGestureRecognizer(),
                (TapGestureRecognizer instance) {
                  instance.onTap = _showPicker;
                },
              ),
            },
            child: child,
          ),
        ),
      ),
    );
  }

  TextStyle? _m2StateInputStyle(BuildContext context) =>
      MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        final ThemeData theme = Theme.of(context);
        if (states.contains(MaterialState.disabled)) {
          return TextStyle(color: theme.disabledColor);
        }
        return TextStyle(color: theme.textTheme.titleMedium?.color);
      });

  TextStyle? _m3StateInputStyle(BuildContext context) =>
      MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color
                  ?.withOpacity(0.38));
        }
        return TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color);
      });

  TextStyle _getInputStyleForState(TextStyle style) {
    final ThemeData theme = Theme.of(context);
    final TextStyle stateStyle = MaterialStateProperty.resolveAs(
        theme.useMaterial3
            ? _m3StateInputStyle(context)!
            : _m2StateInputStyle(context)!,
        _statesController.value);
    final TextStyle providedStyle =
        MaterialStateProperty.resolveAs(style, _statesController.value);
    return providedStyle.merge(stateStyle);
  }

  TextStyle _m3InputStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!;

  DateFormat _getDateTimeFormat() {
    return widget.format ??
        switch (widget.type) {
          DateTimeInputType.date => DateFormat.yMd(),
          DateTimeInputType.time => DateFormat.Hm(),
          DateTimeInputType.all => DateFormat.yMMMd().addPattern('- hh:mm a'),
        };
  }
}
