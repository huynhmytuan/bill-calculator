import 'package:bill_calculator/src/presentation/home/widgets/person_list.dart';
import 'package:bill_calculator/src/presentation/theme/theme_provider.dart';
import 'package:bill_calculator/utils/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Splitter'),
        actions: [
          IconButton.filled(
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).iconTheme.color?.contractColor,
            ),
            onPressed: themeNotifier.toggleTheme,
          ),
        ],
      ),
      body: const Column(
        children: [
          PersonsList(),
        ],
      ),
    );
  }
}
