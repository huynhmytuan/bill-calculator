import 'package:bill_calculator/src/presentation/home/providers/persons_provider.dart';
import 'package:bill_calculator/src/presentation/home/widgets/add_edit_person_dialog.dart';
import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/src/presentation/widgets/action_bottom_sheet.dart';
import 'package:bill_calculator/utils/color_ext.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class PersonsList extends ConsumerWidget {
  const PersonsList({super.key});

  Future<void> _showAddUpdatePersonDialog(
    BuildContext context,
    WidgetRef ref, {
    Person? person,
  }) async {
    final newPersonName = await showDialog<String?>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return AddUpdatePersonDialog(
          person: person,
        );
      },
    );
    if (newPersonName != null) {
      final personsNotifier = ref.read(personsProvider.notifier);
      if (person != null) {
        personsNotifier.updatePerson(person.copyWith(name: newPersonName));
      } else {
        personsNotifier.addPerson(
          Person(
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
    final chosen = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (_) => ActionBottomSheet(
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
                    // padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemCount: persons.length,
                    separatorBuilder: (context, index) => const Gap(8),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: height,
                        child: _PersonWidget(
                          onTap: () => _showOptions(
                            context,
                            ref,
                            persons[index],
                          ),
                          person: persons[index],
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

class _PersonWidget extends StatelessWidget {
  const _PersonWidget({
    super.key,
    this.onTap,
    required this.person,
  });
  final VoidCallback? onTap;
  final Person person;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
