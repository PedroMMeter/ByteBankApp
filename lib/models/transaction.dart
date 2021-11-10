import './contact.dart';

class TransactionData {
  final double? value;
  final Contact contact;

  TransactionData(this.value, this.contact);

  TransactionData.fromJson(Map<String, dynamic> json) :
      value = json['value'],
      contact = Contact.fromJson(json['contact']);
  Map<String, dynamic> toJson() =>
  {
    'value' : value,
    'contact' : contact.toJson(),
  };

  @override
  String toString() {
    return 'Transação{valor: $value, contato: $contact}';
  }
}
