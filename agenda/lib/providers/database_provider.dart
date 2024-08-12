import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Nome dos campos na tabela do banco de dados, por isso são constantes
const String contactTable = "contactTable";
const String idColumn = "idColumn";
const String nameColumn = "nameColumn";
const String emailColumn = "emailColumn";
const String phoneColumn = "phoneColumn";

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();

  factory DatabaseProvider() => _instance;

  DatabaseProvider._internal();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await _initDb();
      return _db!;
    }
  }

  Future<Database> _initDb() async {
    // Obtenha o caminho do banco de dados
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contactsnew.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT)"
        );
      },
    );
  }

  Future<Contact?> saveContact(Contact contact) async {
    final dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

  Future<Contact?> getContact(int id) async {
    final dbContact = await db;
    final List<Map<String, dynamic>> maps = await dbContact.query(
      contactTable,
      columns: [idColumn, nameColumn, emailColumn, phoneColumn],
      where: "$idColumn = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int? id) async {
    final dbContact = await db;
    if (id == null) {
      throw ArgumentError("ID cannot be null");
    }
    return await dbContact.delete(
      contactTable,
      where: "$idColumn = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateContact(Contact contact) async {
    final dbContact = await db;
    if (contact.id == null) {
      throw ArgumentError("Contact ID cannot be null");
    }
    return await dbContact.update(
      contactTable,
      contact.toMap(),
      where: "$idColumn = ?",
      whereArgs: [contact.id!],
    );
  }

  Future<List<Contact>> getAllContacts() async {
    final dbContact = await db;
    final List<Map<String, dynamic>> listMap = await dbContact.rawQuery("SELECT * FROM $contactTable");
    return listMap.map((map) => Contact.fromMap(map)).toList();
  }
}

class Contact {
  int? id;
  String name;
  String email;
  String phone;

  Contact({
    this.id,
    this.name = '',
    this.email = '',
    this.phone = '',
  });

  // Construtor que converte os dados de mapa (JSON) para objeto do contato
  Contact.fromMap(Map<String, dynamic> map)
      : id = map[idColumn],
        name = map[nameColumn],
        email = map[emailColumn],
        phone = map[phoneColumn];

  // Método que transforma o objeto do contato em Mapa (JSON) para armazenar no banco de dados
  Map<String, dynamic> toMap() {
    final map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
    };

    if (id != null) {
      map[idColumn] = id as String;
    }
    return map;
  }
}
