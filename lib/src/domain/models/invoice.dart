import 'package:bill_calculator/src/domain/models/destruction.dart';
import 'package:bill_calculator/src/domain/models/expense.dart';
import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';

@freezed
class Invoice with _$Invoice {
  factory Invoice({
    required String id,
    required String title,
    required String? description,
    required DateTime date,
    required Person paidBy,
    @Default([]) List<Expense> expenses,
    @Default([]) List<Destruction> destructions,
    @Default([]) List<Person> participants,
  }) = _Invoice;
}
