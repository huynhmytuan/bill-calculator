part of '../invoice_detail_page.dart';

class _InvoiceItems extends StatelessWidget {
  const _InvoiceItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Items', style: Theme.of(context).textTheme.titleSmall),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add item'),
            ),
          ],
        ),
        const Gap(20),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (_, __) => const Gap(12),
          itemBuilder: (_, __) {
            return InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: const Icon(Icons.shopping_bag_sharp),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        'Item name' * 5,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const Row(
                      children: [
                        Gap(12),
                        Text('\$135.123'),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: theme.hintColor,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
