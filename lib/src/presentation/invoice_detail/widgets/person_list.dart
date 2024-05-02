part of '../invoice_detail_page.dart';

class _PersonList extends ConsumerWidget {
  const _PersonList({super.key});

  void _filterPerson(BuildContext context, WidgetRef ref, Person person) {
    // final persons = ref.watch(personsProvider);
    // final filteredPersons = persons.where((p) => p != person).toList();
    // ref.read(personsProvider.notifier).state = filteredPersons;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persons = [
      Person.raw(name: 'Person 1'),
      Person.raw(name: 'Person 2'),
      Person.raw(name: 'Person 3'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Section(
          label: const Text('Person'),
          child: SizedBox(
            height: 110,
            child: LayoutBuilder(builder: (context, constrains) {
              final height = constrains.maxHeight;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: height,
                    child: PersonWidget(
                      isSelected: index == 1,
                      onTap: () => _filterPerson(context, ref, persons[index]),
                      name: persons[index].name,
                    ),
                  );
                },
              );
            }),
          ),
        )
      ],
    );
  }
}
