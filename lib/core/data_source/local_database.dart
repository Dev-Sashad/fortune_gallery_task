import 'package:fortune_gallery/_lib.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._internal();

  static Database? _database;

  LocalDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/${AppInfo.databaseName}';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

//Create Tables
  Future<void> _createDatabase(Database db, _) async {
    return await db.execute('''
        CREATE TABLE ${FortuneModel.tableName} (
          ${FortuneModel.idKey} ${FortuneModel.idType},
          ${FortuneModel.messageKey} ${FortuneModel.textType},
          ${FortuneModel.dateCreatedKey} ${FortuneModel.textType},
        )
      ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
