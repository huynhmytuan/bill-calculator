part of '../home_page.dart';

class _PersonsList extends ConsumerWidget {
  const _PersonsList({super.key});

  Future<void> _showAddUpdatePersonDialog(
    BuildContext context,
    WidgetRef ref, {
    Person? person,
  }) async {
    final newPersonName = await showMaterialModalBottomSheet<String?>(
      context: context,
      useRootNavigator: true,
      isDismissible: true,
      builder: (context) {
        return AddUpdatePersonBottomSheet(person: person);
      },
    );
    if (newPersonName != null) {
      final personsNotifier = ref.read(personsProvider.notifier);
      if (person != null) {
        personsNotifier.updatePerson(person.copyWith(name: newPersonName));
      } else {
        personsNotifier.addPerson(
          Person.raw(
            name: newPersonName,
            color: Colors.primaries[Colors.primaries.length - 1],
          ),
        );
      }
    }
  }

  Future<void> _showOptions(
    BuildContext context,
    WidgetRef ref,
    Person person,
  ) async {
    // Show options
    final chosen = await showMaterialModalBottomSheet(
      context: context,
      // isDismissible: true,
      useRootNavigator: true,
      // expand: false,
      builder: (_) => ActionBottomSheet(
        title: 'Options'.hardCode,
        items: [
          ActionSheetItem(
            value: 0,
            icon: Icons.edit,
            label: 'Edit'.hardCode,
          ),
          ActionSheetItem(
            value: 1,
            icon: Icons.delete_forever,
            label: 'Delete'.hardCode,
            color: Colors.red.shade700,
          ),
        ],
      ),
    );

    if (chosen == null) return;

    switch (chosen) {
      case 0:
        // ignore: use_build_context_synchronously
        _showAddUpdatePersonDialog(context, ref, person: person);
        break;
      case 1:
        ref.read(personsProvider.notifier).removePerson(person);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persons = ref.watch(personsProvider);
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _AddIcon(
              onTap: () => _showAddUpdatePersonDialog(context, ref),
            ),
            const Gap(12),
            if (persons.isNotEmpty)
              Expanded(
                child: LayoutBuilder(builder: (context, constrains) {
                  final height = constrains.maxHeight;
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: persons.length,
                    separatorBuilder: (context, index) => const Gap(8),
                    itemBuilder: (context, index) {
                      final person = persons[index];
                      return SizedBox(
                        height: height,
                        child: PersonWidget(
                          onTap: () => _showOptions(
                            context,
                            ref,
                            persons[index],
                          ),
                          color: person.color,
                          name: person.name,
                        ),
                      );
                    },
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }
}

class _AddIcon extends StatelessWidget {
  const _AddIcon({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DottedBorder(
              padding: EdgeInsets.zero,
              dashPattern: const [4, 6],
              borderType: BorderType.Circle,
              color: Theme.of(context).hintColor,
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            const Gap(4),
            Text('Add'.hardCode),
          ],
        ),
      ),
    );
  }
}
