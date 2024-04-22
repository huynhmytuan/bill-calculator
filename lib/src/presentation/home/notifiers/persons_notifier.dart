import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonsNotifier extends Notifier<List<Person>> {
  void addPerson(Person person) {
    state = [...state, person];
  }

  void removePerson(Person person) {
    state = state.where((p) => p != person).toList();
  }

  @override
  List<Person> build() {
    return [];
  }
}
