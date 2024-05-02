part of '../invoice_detail_page.dart';

class _InvoiceInformation extends HookWidget {
  const _InvoiceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final hasDescription = useState(false);
    final descriptionFocusNode = useFocusNode();
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _invoiceTitle(titleController, theme),
        _invoiceDescription(hasDescription, descriptionFocusNode, theme),
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

  Widget _invoiceDescription(ValueNotifier<bool> hasDescription,
      FocusNode descriptionFocusNode, ThemeData theme) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 310),
      layoutBuilder: (currentChild, previousChildren) => Align(
        alignment: Alignment.topLeft,
        child: currentChild,
      ),
      child: (!hasDescription.value)
          ? TextButton.icon(
              onPressed: () {
                hasDescription.value = true;
                if (descriptionFocusNode.canRequestFocus) {
                  descriptionFocusNode.requestFocus();
                }
              },
              style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
              icon: const Icon(Icons.add),
              label: Text('Add description'.hardCode),
            )
          : TextField(
              controller: TextEditingController(),
              focusNode: descriptionFocusNode,
              style: theme.textTheme.bodyMedium,
              enabled: true,
              decoration: const InputDecoration(
                isDense: true,
                filled: false,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Tap to add a description...',
              ),
            ),
    );
  }

  Widget _invoiceTitle(TextEditingController titleController, ThemeData theme) {
    return TextField(
      controller: titleController,
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
