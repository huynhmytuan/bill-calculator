import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    required this.label,
    this.description,
    this.actions = const [],
  });
  final Widget label;
  final Widget? description;
  final Widget child;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTitleStyle = theme.textTheme.titleMedium!;
    final defaultDescriptionStyle = theme.textTheme.bodyMedium!.copyWith(
      color: theme.hintColor,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DefaultTextStyle(
                    style: defaultTitleStyle,
                    child: label,
                  ),
                ),
                if (actions.isNotEmpty) ...[
                  const Gap(8),
                  ...actions,
                ],
              ],
            ),
            if (description != null)
              DefaultTextStyle(
                style: defaultDescriptionStyle,
                child: description!,
              ),
          ],
        ),
        const Gap(4),
        child,
      ],
    );
  }
}
