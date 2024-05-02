import 'package:bill_calculator/src/domain/models/invoice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final invoicesProvider = StateNotifierProvider<InvoicesNotifier, List<Invoice>>(
  (ref) => InvoicesNotifier(),
);

class InvoicesNotifier extends StateNotifier<List<Invoice>> {
  InvoicesNotifier() : super([]);

  void addInvoice(Invoice invoice) {
    state = [...state, invoice];
  }

  void updateInvoice(Invoice invoice) {
    final index = state.indexWhere((i) => i.id == invoice.id);
    if (index != -1) {
      final newListOfInvoices = List<Invoice>.from(state);
      newListOfInvoices[index] = invoice;
      state = newListOfInvoices;
    }
  }

  void deleteInvoice(Invoice invoice) {
    state = state.where((i) => i != invoice).toList();
  }
}
