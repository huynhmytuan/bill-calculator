import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/src/presentation/home/notifiers/persons_notifier.dart';
import 'package:riverpod/riverpod.dart';

final personsProvider = NotifierProvider<PersonsNotifier, List<Person>>(
  PersonsNotifier.new,
);
