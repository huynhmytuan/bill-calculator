import 'package:bill_calculator/src/presentation/widgets/dragger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActionSheetItem<T> {
  const ActionSheetItem({
    required this.value,
    required this.icon,
    required this.label,
    this.color,
    this.onPressed,
  });

  final T value;
  final IconData icon;
  final String label;
  final Color? color;

  /// The callback that is called when the item is tapped.
  ///
  /// Defaults to null. It will automatically close the bottom sheet and pop the
  /// <T> value.
  final VoidCallback? onPressed;
}

class ActionBottomSheet<T> extends StatelessWidget {
  const ActionBottomSheet({
    super.key,
    required this.items,
    required this.title,
  });
  final String title;
  final List<ActionSheetItem<T>> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0 + paddingBottom),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Dragger(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    title,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              const Gap(12),
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: item.onPressed ??
                        () => Navigator.of(context).pop(item.value),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item.icon,
                            color: item.color ?? theme.hintColor,
                          ),
                          const Gap(12),
                          Expanded(
                            child: Text(
                              item.label,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: item.color,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Divider(height: 0),
                itemCount: items.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
