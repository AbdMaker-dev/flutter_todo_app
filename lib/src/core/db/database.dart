import 'package:sqflite/sqflite.dart';
import 'package:todo_app/src/core/models/categorie.dart';
import 'package:todo_app/src/core/models/tache.dart';
import 'package:todo_app/src/core/models/user.dart';

class DatabaseHelper {
  static Future<void> createTables(Database database) async {
    await database.execute("""
    CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nom TEXT,
      prenom TEXT,
      username TEXT,
      password TEXT
    )
    """);

    await database.execute("""
      CREATE TABLE categorie(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        libelle TEXT,
        idUser INTEGER
      )
    """);

    await database.execute("""
    CREATE TABLE tache(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      libelle TEXT,
      description TEXT,
      date TIMESTAMP,
      idCategorie INTEGER
    )
    """);
  }

  static Future<Database> createDatabase() async {
    return await openDatabase('todoApp', version: 1,
        onCreate: (Database database, version) {
      createTables(database);
    });
  }

  Future<int> sinIng(User user) async {
    var db = await createDatabase();
    var result = await db.insert('user', user.toMap());
    return result;
  }

  Future<int> inserCategorie(Categorie category) async {
    var db = await createDatabase();
    var result = await db.insert('categorie', category.toMap());
    return result;
  }

  Future<int> inserTache(Tache tache) async {
    var db = await createDatabase();
    var result = await db.insert('tache', tache.toMap());
    return result;
  }

  Future<List<Categorie>> getCategorieByIdUser(int idUser) async {
    List<Categorie> categories = [];
    var db = await createDatabase();
    List<Map> maps = await db.query('categorie',
        columns: ['id', 'libelle', 'idUser'],
        where: 'idUser=?',
        whereArgs: [idUser]);
    if (maps.length > 0) {
      for (var map in maps) {
        categories.add(Categorie.fromMap(map));
      }
    }
    return categories;
  }

  Future<List<Tache>> getTacheByIdCategorie(int idCategorie) async {
    List<Tache> taches = [];

    return taches;
  }
}
