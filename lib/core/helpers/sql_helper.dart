import 'package:ntgtask/core/helpers/app_const.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  Database? _db;

  // Initialize database
  Future<Database> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppConstants.appDataBase);

    final db = await openDatabase(path, version: 1, onCreate: _onCreate);

    _db = db;
    return db;
  }

  // Getter for db instance
  Future<Database> get database async {
    if (_db != null) return _db!;
    return await init();
  }

  // Delete database (for development)
  Future<void> freshDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, AppConstants.appDataBase);
    await deleteDatabase(path);
    _db = null;
  }

  // Create tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY,
        title TEXT,
        price REAL,
        description TEXT,
        category TEXT,
        image TEXT,
        rating TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');
    await db.execute('''
    CREATE TABLE cart(
      id INTEGER PRIMARY KEY,
      title TEXT,
      price REAL,
      description TEXT,
      category TEXT,
      image TEXT,
      itemCount INTEGER
    )
  ''');
    await db.execute('''
  CREATE TABLE favorites(
    id INTEGER PRIMARY KEY,
    title TEXT,
    price REAL,
    description TEXT,
    category TEXT,
    image TEXT
  )
''');
  }

  Future<int> create({
    required Map<String, dynamic> map,
    required String tableName,
  }) async {
    final myDb = await database;
    return await myDb.insert(
      tableName,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Read all rows
  Future<List<Map<String, dynamic>>> read({
    required String tableName,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final myDb = await database;

    final result = await myDb.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );

    return result.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  Future<int> update({
    required String tableName,
    required Map<String, dynamic> map,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final myDb = await database;
    return await myDb.update(
      tableName,
      map,
      where: where,
      whereArgs: whereArgs,
    );
  }

  // Delete all rows
  Future<int> deleteAll(String tableName) async {
    final myDb = await database;
    return await myDb.delete(tableName);
  }

  // Delete by id
  Future<int> delete(String tableName, int id) async {
    final myDb = await database;
    return await myDb.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
