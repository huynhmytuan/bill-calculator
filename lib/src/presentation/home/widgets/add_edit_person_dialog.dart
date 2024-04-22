import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddUpdatePersonDialog extends StatefulWidget {
  const AddUpdatePersonDialog({super.key, this.person});

  final Person? person;

  @override
  State<AddUpdatePersonDialog> createState() => _AddUpdatePersonDialogState();
}

class _AddUpdatePersonDialogState extends State<AddUpdatePersonDialog> {
  String? _errorText;
  late final TextEditingController _nameController;
  @override
  void initState() {
    _nameController = TextEditingController();
    if (widget.person != null) {
      _nameController.text = widget.person!.name;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onDone() {
    final value = _nameController.text;
    if (value.isEmpty) {
      safeSetState(() {
        _errorText = 'Name cannot be empty';
      });
      return;
    }
    Navigator.of(context).pop(value);
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }

  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.person != null
                      ? 'Edit Person'.hardCode
                      : 'Add Person'.hardCode,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(24),
                TextField(
                  controller: _nameController,
                  autofocus: true,
                  onEditingComplete: _onDone,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    errorText: _errorText,
                  ),
                ),
                const Gap(24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _onDone,
                    child: Text(
                      widget.person != null ? 'Save'.hardCode : 'Add'.hardCode,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _onCancel,
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
