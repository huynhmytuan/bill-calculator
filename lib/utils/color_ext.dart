import 'package:flutter/material.dart';

extension ColorX on Color {
  Color get contractColor =>
      computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
