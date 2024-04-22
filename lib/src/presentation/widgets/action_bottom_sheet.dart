import 'package:bill_calculator/utils/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActionSheetItem<T> {
  const ActionSheetItem({
    required this.value,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final T value;
  final IconData icon;
  final String label;

  /// The callback that is called when the item is tapped.
  ///
  /// Defaults to null. It will automatically close the bottom sheet and pop the
  /// <T> value.
  final VoidCallback? onPressed;
}

class ActionBottomSheet<T> extends StatelessWidget {
  const ActionBottomSheet({super.key, required this.items});

  final List<ActionSheetItem<T>> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final paddingBottom = MediaQuery.of(context).viewInsets.bottom;
    return DraggableScrollableSheet(
      initialChildSize: 0.275,
      minChildSize: 0.25,
      maxChildSize: 0.75,
      snap: true,
      expand: false,
      builder: (context, scrollController) => Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 8.0 + paddingBottom),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 120,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.dividerColor.lighten(.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const SizedBox(
                    width: 100,
                    height: 4,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        tileColor:
                            theme.colorScheme.surfaceTint.withOpacity(.2),
                        titleTextStyle: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                        leading: DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.tertiary.withOpacity(.3),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              item.icon,
                              size: 20,
                              color: theme.colorScheme.tertiary,
                            ),
                          ),
                        ),
                        title: Text(item.label),
                        onTap: () {
                          if (item.onPressed == null) {
                            Navigator.of(context).pop(item.value);
                          } else {
                            item.onPressed!();
                          }
                        },
                      );
                    },
                    separatorBuilder: (_, __) => const Gap(8),
                    itemCount: items.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
