import 'package:bill_calculator/src/presentation/widgets/dragger.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CreateInvoiceBottomSheet extends HookWidget {
  const CreateInvoiceBottomSheet({super.key});

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    void onSubmitted() {
      if (!(_formKey.currentState?.validate() ?? false)) {
        return;
      }
    }

    return KeyboardDismisser(
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: mediaQuery.viewInsets.bottom + 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Dragger(),
            Text(
              'New Invoice'.hardCode,
              style: theme.textTheme.titleLarge,
            ),
            const Gap(16),
            Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: mediaQuery.size.height * 0.4,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Title'.hardCode,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      const Gap(4),
                      TextFormField(
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Enter invoice title'.hardCode,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is required'.hardCode;
                          }
                          if (value.length < 6) {
                            return 'Title must be at least 6 characters'
                                .hardCode;
                          }
                          return null;
                        },
                      ),
                      const Gap(12),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Description'.hardCode,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      const Gap(4),
                      TextFormField(
                        autofocus: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(maxHeight: 150),
                          hintText:
                              'Enter invoice description (optional)'.hardCode,
                        ),
                        validator: (value) {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onSubmitted,
                child: Text('Create'.hardCode),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
