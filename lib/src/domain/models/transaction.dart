// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bill_calculator/src/domain/models/person.dart';

class Transaction {
  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.belongsTo,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;

  /// The person who this transaction belongs to.
  ///
  /// If null, this transaction is a general transaction. (shared by all persons)
  final Person? belongsTo;
}
