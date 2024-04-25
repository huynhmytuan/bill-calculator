part of '../invoice_detail_page.dart';

class _InvoiceInformation extends StatelessWidget {
  const _InvoiceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InvoiceTitle(theme: theme),
        const _InvoiceDescription(),
        const Gap(24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Invoice Date',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ),
                  const Gap(8),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        DateFormat.yMMMEd().format(DateTime.now()),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Paid By',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ),
                  const Gap(8),
                  FilterChip(
                    onSelected: (_) {},
                    avatar: const CircleAvatar(),
                    label: const Text('Huynh Tuan'),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _InvoiceDescription extends StatelessWidget {
  const _InvoiceDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
      icon: const Icon(Icons.add),
      label: Text('Add description'.hardCode),
    );
    // TextField(
    //   controller: TextEditingController(),
    //   style: theme.textTheme.bodyMedium,
    //   enabled: true,
    //   decoration: const InputDecoration(
    //     isDense: true,
    //     filled: false,
    //     disabledBorder: InputBorder.none,
    //     border: InputBorder.none,
    //     enabledBorder: InputBorder.none,
    //     focusedBorder: InputBorder.none,
    //     hintText: 'Tap to add a description...',
    //   ),
    // ),
  }
}

class _InvoiceTitle extends StatelessWidget {
  const _InvoiceTitle({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      style: theme.textTheme.titleLarge,
      enabled: true,
      decoration: const InputDecoration(
        isDense: true,
        filled: false,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: 'Enter invoice title here...',
      ),
    );
  }
}
