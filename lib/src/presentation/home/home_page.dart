import 'package:animations/animations.dart';
import 'package:bill_calculator/src/presentation/invoice_detail/invoice_detail_page.dart';
import 'package:bill_calculator/src/presentation/theme/theme_provider.dart';
import 'package:bill_calculator/src/presentation/widgets/invoice_card.dart';
import 'package:bill_calculator/utils/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:bill_calculator/src/presentation/home/providers/persons_provider.dart';
import 'package:bill_calculator/src/presentation/add_update_person/add_update_person_bottom_sheet.dart';
import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/src/presentation/widgets/action_bottom_sheet.dart';
import 'package:bill_calculator/src/presentation/widgets/person_widget.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

part 'widgets/person_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Splitter'),
        scrolledUnderElevation: 0,
        actions: [
          IconButton.filled(
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).iconTheme.color?.contrastColor,
            ),
            onPressed: themeNotifier.toggleTheme,
          ),
        ],
      ),
      floatingActionButton: const _AddInvoiceFAB(),
      body: const Column(
        children: [
          _PersonsList(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 12, bottom: 8),
              child: Text('Invoices'),
            ),
          ),
          Expanded(child: _InvoiceList()),
        ],
      ),
    );
  }
}

class _AddInvoiceFAB extends StatelessWidget {
  const _AddInvoiceFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final closedColor = floatingActionButtonTheme.backgroundColor ??
        theme.colorScheme.primaryContainer;
    final closedShape = floatingActionButtonTheme.shape ??
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        );
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      transitionType: ContainerTransitionType.fade,
      closedColor: closedColor,
      closedShape: closedShape,
      closedElevation: 4,
      openBuilder: (context, action) => const InvoiceDetailPage(),
      closedBuilder: (context, action) => InkWell(
        onTap: action,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _InvoiceList extends StatelessWidget {
  const _InvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.all(12),
      separatorBuilder: (_, __) => const Gap(12),
      itemBuilder: (_, __) => const InvoiceCard(),
    );
  }
}
