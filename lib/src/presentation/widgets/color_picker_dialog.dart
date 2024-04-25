import 'package:bill_calculator/src/presentation/widgets/color_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ColorPickerDialog extends HookConsumerWidget {
  const ColorPickerDialog({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedColor = useState<Color?>(color);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Select a color',
                    style: theme.textTheme.titleMedium,
                  ),
                  const Gap(24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      for (final color in Colors.primaries)
                        ColorCircle(
                          selected: selectedColor.value == color,
                          color: color,
                          onTap: () => selectedColor.value = color,
                        ),
                    ],
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pop(
                        selectedColor.value,
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('Cancel'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
