import './contact.dart';

class TransactionData {
  final String id;
  final double? value;
  final Contact contact;

  TransactionData(this.id, this.value, this.contact);

  TransactionData.fromJson(Map<String, dynamic> json) :
      id =json['id'],
      value = json['value'],
      contact = Contact.fromJson(json['contact']);
  Map<String, dynamic> toJson() =>
  {
    'id' : id,
    'value' : value,
    'contact' : contact.toJson(),
  };

  @override
  String toString() {
    return 'Transação{valor: $value, contato: $contact}';
  }
}
