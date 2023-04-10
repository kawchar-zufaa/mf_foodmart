import 'dart:io';
import 'package:mf_foodmart/models/order_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class OrderDatabase {
  OrderDatabase._privateConstructor();
  static final OrderDatabase instance = OrderDatabase._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'order_items.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: createTable,
    );
  }

  void createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE order_items(
        id INTEGER PRIMARY KEY,
        productId INTEGER,
        productImage TEXT,
        productName TEXT,
        productPrice TEXT,
        productQuantity INTEGER,
        date TEXT  
      )
      ''');
  }
  Future<void> insertOrders(List<OrderModel> orders) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var order in orders) {
        await txn.insert(
          'order_items',
          order.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<OrderModel>> getOrders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('order_items',orderBy: 'id DESC');

    return List.generate(maps.length, (i) {
      return OrderModel.fromMap(maps[i]);
    });
  }

  Future<int> deleteAllOrders() async {
    var db = await database;
    int res = await db.delete('order_items');
    return res;
  }


}