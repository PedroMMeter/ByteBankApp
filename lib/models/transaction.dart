import './contact.dart';

class TransactionData {
  final double value;
  final Contact contact;

  TransactionData(this.value, this.contact);

  @override
  String toString() {
    return 'Transação{valor: $value, contato: $contact}';
  }
}
