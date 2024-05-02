part of '../invoice_detail_page.dart';

class _InvoiceItems extends StatelessWidget {
  const _InvoiceItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const Gap(20),
        Section(
          label: const Text('Items'),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (_, __) => const Gap(12),
            itemBuilder: (_, __) {
              return CustomInkWell(
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
        ),
      ],
    );
  }
}
