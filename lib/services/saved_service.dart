import 'package:path/path.dart';
import 'package:slangary/models/urban_dict.dart';
import 'package:sqflite/sqflite.dart';

class SavedService {
  static SavedService? _instance;
  static Database? _database;
  int? dbVersion;

  SavedService._internal(this.dbVersion);

  factory SavedService({required int dbVersion}) {
    _instance ??= SavedService._internal(dbVersion);
    return _instance!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await _getDBPath();
    return await openDatabase(
      dbPath,
      version: dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE saved (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            term TEXT NOT NULL,
            definition TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<String> _getDBPath() async {
    final databasesPath = await getDatabasesPath();
    return join(databasesPath, 'saved.db');
  }

  Future<void> closeDB() async {
    final db = await database;
    await db.close();
  }

  Future<void> addSaved(Definition definition) async {
    final db = await database;
    await db.insert('saved', definition.toMap());
  }

  Future<List<Definition>> getSaved() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('saved');
    return Definition.fromJsonList(maps);
  }
}
