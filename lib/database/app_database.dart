import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//função criar banco dbPath => nome da variavel
void createDatabase(){
  getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebonk.db'); //nesse caso, é uma função que junta as tabelas
    openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contatos( '
          'id INTEGER PRIMARY KEY, '
          'nome TEXT,'
          'numero_contato INTEGER)');
    }, version: 1);
  });
}