class Contact {
  final String name;
  final int account;

  Contact(this.name, this.account);

  @override
  String toString() {
    return 'Contato{Nome: $name, Contato: $account}';
  }
}
