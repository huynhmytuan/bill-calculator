import 'package:bill_calculator/src/presentation/home/providers/persons_provider.dart';
import 'package:bill_calculator/src/presentation/home/widgets/add_person_dialog.dart';
import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/utils/color_ext.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class PersonsList extends ConsumerWidget {
  const PersonsList({super.key});

  Future<void> _showAddPersonDialog(BuildContext context, WidgetRef ref) async {
    final newPerson = await showDialog<String?>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return const AddPersonDialog();
      },
    );
    if (newPerson != null) {
      final person = Person(
        name: newPerson,
        color: Colors.primaries[Colors.primaries.length - 1],
      );
      ref.read(personsProvider.notifier).addPerson(person);
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
              onTap: () => _showAddPersonDialog(context, ref),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: persons.length,
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) {
                  return _PersonWidget(
                    person: Person(
                      name: persons[index].name,
                      color: persons[index].color,
                    ),
                  );
                },
              ),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            const Text('Add'),
          ],
        ),
      ),
    );
  }
}

class _PersonWidget extends StatelessWidget {
  const _PersonWidget({
    super.key,
    required this.person,
  });
  final Person person;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: person.color,
            child: Text(
              person.name.wordsInitials(),
              style: TextStyle(
                color: person.color.contrastColor,
                fontSize: 20,
              ),
            ),
          ),
          const Gap(4),
          Text(person.name),
        ],
      ),
    );
  }
}
