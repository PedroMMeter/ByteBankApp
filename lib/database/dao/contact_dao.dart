import 'package:bytebonk/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContactDao {

  static final String tableSQL = 'CREATE TABLE contatos( '
      'id INTEGER PRIMARY KEY, '
      'nome TEXT,'
      'numero_conta INTEGER)';

  Future<int> salvar(Contact contato) async {
    final Database db = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contato);

    return db.insert('contatos', contactMap);
  }

  Map<String, dynamic> _toMap(Contact contato) {
    final Map<String, dynamic> contactMap = Map();
    //contactMap['id'] = contato.id;
    contactMap['nome'] = contato.name;
    contactMap['numero_conta'] = contato.account;
    return contactMap;
  }

  Future<List<Contact>> buscar() async{
    final Database db = await getDatabase();
    List<Contact> listContacts = await _toList(db);
    return listContacts;
  }

  Future<List<Contact>> _toList(Database db) async {
    final List<Contact> listContacts = [];

    for (Map<String, dynamic> linha in await db.query('contatos')) {
      final contato = Contact(
        linha['id'],
        linha['nome'],
        linha['numero_conta'],
      );
      listContacts.add(contato);
    }
    return listContacts;
  }
}