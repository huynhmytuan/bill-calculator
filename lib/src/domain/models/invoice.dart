import 'package:bill_calculator/src/domain/models/person.dart';
import 'package:bill_calculator/src/domain/models/transaction.dart';

class Invoice {
  Invoice({
    required this.id,
    required this.title,
    required this.description,
    required this.transactions,
    required this.date,
    required this.payer,
  });

  final String id;
  final String title;
  final String description;
  final List<Transaction> transactions;
  final DateTime date;
  final Person payer;
}
