import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ColorCircle extends HookWidget {
  const ColorCircle({
    super.key,
    required this.color,
    this.selected = false,
    this.onTap,
  });
  final Color color;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isFocus = useState<bool>(false);
    final theme = Theme.of(context);
    return Transform.scale(
      scale: isFocus.value ? 1.2 : 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: selected ? (theme.colorScheme.primary) : Colors.transparent,
          ),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onFocusChange: (value) {
            isFocus.value = value;
          },
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(2),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
