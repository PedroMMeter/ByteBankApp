class Contact {
  final int id;
  final String name;
  final int account;

  Contact(this.id, this.name, this.account);

  @override
  String toString() {
    return 'Contato{ID: $id, Nome: $name, Contato: $account}';
  }

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'],
        account = json['accountNumber'];
  Map<String, dynamic> toJson() =>
  {
    'id' : id,
    'name' : name,
    'accountNumber' : account,
  };
}
