import 'package:bill_calculator/add_person_dialog.dart';
import 'package:bill_calculator/models/person.dart';
import 'package:bill_calculator/utils/color_ext.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const _AddIcon(),
            const Gap(8),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) {
                  return _PersonWidget(
                    person: Person(
                      name: 'Person $index',
                      color: Colors.primaries[index % Colors.primaries.length],
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
  const _AddIcon({super.key});

  void _showAddPersonDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return const AddPersonDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () => _showAddPersonDialog(context),
      icon: const Icon(Icons.add),
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
            radius: 28,
            backgroundColor: person.color,
            child: Text(
              person.name.wordsInitials(),
              style: TextStyle(
                color: person.color.contractColor,
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
