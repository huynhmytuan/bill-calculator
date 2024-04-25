import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/src/presentation/widgets/person_widget.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

part 'widgets/invoice_information.dart';
part 'widgets/invoice_items.dart';
part 'widgets/person_list.dart';

class InvoiceDetailPage extends StatelessWidget {
  const InvoiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _InvoiceInformation(),
              _PersonList(),
              Divider(height: 34, indent: 12, endIndent: 12),
              _InvoiceItems(),
            ],
          ),
        ),
      ),
    );
  }
}
