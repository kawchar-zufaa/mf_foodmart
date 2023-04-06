import 'dart:async';
import 'dart:io';

import 'package:mf_foodmart/models/address_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DeliveryAddressDatabase {
  DeliveryAddressDatabase._privateConstructor();
  static final DeliveryAddressDatabase instance =
      DeliveryAddressDatabase._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'address.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }



  Future<void> _createTable(Database db, int version) async {
    await db.execute('''CREATE TABLE delivery_address(
      id INTEGER PRIMARY KEY,
      firstName TEXT,
      lastName TEXT,
      company TEXT,
      address1 TEXT,
      address2 TEXT,
      city TEXT,
      state TEXT,
      postCode TEXT,
      Country TEXT,
      email TEXT,
      phone TEXT
      )''');
  }

  Future<int> insertAddress(AddressModel addressModel) async {
    final db = await instance.database;
    final int result = await db.insert(
      'delivery_address',
      addressModel.toMap(),
    );
    return result;
  }

  Future<List<AddressModel>> getAddresses() async {
    final db = await instance.database;
    final res = await db.query('delivery_address');
    return res.isNotEmpty
        ? res.map((address) => AddressModel.fromMap(address)).toList()
        : [];
  }


  Future<void> updateAddress(AddressModel addressModel) async {
    final db = await instance.database;
    await db.update(
      'delivery_address',
      addressModel.toMap(),
      where: 'id = ?',
      whereArgs: [addressModel.id],
    );
  }

}
