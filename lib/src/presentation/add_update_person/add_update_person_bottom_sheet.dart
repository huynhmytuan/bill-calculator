import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/src/presentation/home/providers/persons_provider.dart';
import 'package:bill_calculator/src/presentation/widgets/color_circle.dart';
import 'package:bill_calculator/src/presentation/widgets/color_picker_dialog.dart';
import 'package:bill_calculator/src/presentation/widgets/dragger.dart';
import 'package:bill_calculator/utils/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddUpdatePersonBottomSheet extends HookConsumerWidget {
  const AddUpdatePersonBottomSheet({super.key, this.person});

  final Person? person;
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final isEditMode = person != null;
    final colorPreset = Colors.primaries.take(5).toList();

    final colors = useState<List<Color>>([
      if (person?.color != null && !colorPreset.contains(person!.color))
        person!.color,
      ...colorPreset,
    ]);
    final pickedColor = useState<Color?>(
      person?.color ?? Colors.primaries.first,
    );
    final nameEditingController = useTextEditingController(text: person?.name);

    void showMoreColors() async {
      final color = await showDialog(
        context: context,
        builder: (_) {
          return ColorPickerDialog(color: pickedColor.value);
        },
      );

      if (color == null || color is! Color) {
        return;
      }
      pickedColor.value = color;
      if (!colors.value.contains(color)) {
        colors.value = [color, ...colorPreset];
      }
    }

    void onSubmitted() {
      if (!(_formKey.currentState?.validate() ?? false)) {
        return;
      }
      FocusManager.instance.primaryFocus?.unfocus();
      final data = Person(
        id: person?.id,
        name: nameEditingController.text,
        color: pickedColor.value ?? Colors.primaries.first,
      );

      if (isEditMode) {
        ref.read(personsProvider.notifier).updatePerson(data);
      } else {
        ref.read(personsProvider.notifier).addPerson(data);
      }
      Navigator.of(context).pop();
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: mediaQuery.viewInsets.bottom,
      ),
      child: KeyboardDismisser(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Dragger(),
              Text(
                isEditMode ? 'Edit Person'.hardCode : 'Add Person'.hardCode,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(12),
              if (!isEditMode) ...[
                Text('Add a person to the list for better tracking'.hardCode),
                const Gap(24),
              ],
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name'.hardCode,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Gap(4),
                      TextFormField(
                        controller: nameEditingController,
                        autofocus: true,
                        onEditingComplete: onSubmitted,
                        validator: (value) =>
                            value!.isEmpty ? 'Name is required'.hardCode : null,
                      ),
                      const Gap(12),
                      Text(
                        'Chose a color'.hardCode,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Gap(4),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) => const Gap(8),
                          itemCount: colors.value.length + 1,
                          itemBuilder: (context, index) {
                            if (colors.value.length == index) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: showMoreColors,
                                child: Container(
                                  width: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: theme.hintColor,
                                    ),
                                  ),
                                  child: const Icon(Icons.more_horiz),
                                ),
                              );
                            }
                            final currentIndexColor = colors.value[index];
                            return ColorCircle(
                              selected: pickedColor.value == currentIndexColor,
                              onTap: () {
                                pickedColor.value = currentIndexColor;
                              },
                              color: currentIndexColor,
                            );
                          },
                        ),
                      ),
                      const Gap(24),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onSubmitted,
                  child: Text(
                    isEditMode ? 'Save'.hardCode : 'Add'.hardCode,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
