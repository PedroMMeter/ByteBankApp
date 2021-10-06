import 'package:bytebonk/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContactDao {
  static const String _nomeTabela = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numero_conta = 'numero_conta';

  static final String tableSQL = 'CREATE TABLE $_nomeTabela( '
      'id INTEGER PRIMARY KEY, '
      'nome TEXT,'
      'numero_conta INTEGER)';

  Future<int> salvar(Contact contato) async {
    final Database db = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contato);

    return db.insert(_nomeTabela, contactMap);
  }

  Future<List<Contact>> buscar() async {
    final Database db = await getDatabase();
    List<Contact> listContacts = await _toList(db);
    return listContacts;
  }

  Future<int> alterar(Contact contato) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = _toMap(contato);

    return await db.update(
      _nomeTabela,
      contactMap,
      where: 'id = ?',
      whereArgs: [contato.id],
    );
  }

  Future<int> deletar(int id) async {
    final Database db = await getDatabase();

    return await db.delete(
      _nomeTabela,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Map<String, dynamic> _toMap(Contact contato) {
    final Map<String, dynamic> contactMap = Map();
    //contactMap[_id] = contato.id;
    contactMap[_nome] = contato.name;
    contactMap[_numero_conta] = contato.account;
    return contactMap;
  }

  Future<List<Contact>> _toList(Database db) async {
    final List<Contact> listContacts = [];

    for (Map<String, dynamic> linha in await db.query(_nomeTabela)) {
      final contato = Contact(
        linha[_id],
        linha[_nome],
        linha[_numero_conta],
      );
      listContacts.add(contato);
    }
    return listContacts;
  }
}
