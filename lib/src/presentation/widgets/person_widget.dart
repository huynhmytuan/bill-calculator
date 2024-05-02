import 'package:bill_calculator/src/presentation/widgets/custom_inkwell.dart';
import 'package:bill_calculator/utils/color_ext.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({
    super.key,
    required this.name,
    this.color,
    this.onTap,
    this.isSelected = false,
  });

  final Color? color;
  final String name;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomInkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isSelected
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: theme.colorScheme.primary,
                      ),
                    )
                  : null,
              padding: EdgeInsets.all(isSelected ? 6 : 4),
              child: CircleAvatar(
                backgroundColor: color,
                foregroundColor: color?.contrastColor,
                radius: isSelected ? 20 : 24,
                child: Text(
                  name.wordsInitials(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Gap(4),
            Text(
              name,
              style: TextStyle(
                color: isSelected ? theme.colorScheme.primary : null,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
