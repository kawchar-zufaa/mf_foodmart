
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProfileDatabase{

  ProfileDatabase._privateConstructor();
  static final ProfileDatabase instance = ProfileDatabase._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'profile_db.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: createTable,
    );
  }
  static const String tableProfile = 'profile';
  static const String columnId = 'id';
  static const String columnImagePath = 'imagePath';

  void createTable(Database db, int version) async {
    await db.execute('''
       CREATE TABLE profile(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            imagePath TEXT NOT NULL
          )
      ''');
  }

  Future<void> insertProfileImage(String imagePath) async {
    final db = await database;
    await db.insert(
      'profile',
      {'imagePath': imagePath},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getProfileImagePath() async {
    final db = await database;
    final maps = await db.query('profile');
    if (maps.isNotEmpty) {
      return maps.first['imagePath'] as String?;
    } else {
      return null;
    }
  }

  Future<void> updateProfileImagePath(String imagePath) async {
    final db = await database;
    await db.update(
      'profile',
      {'imagePath': imagePath},
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}

