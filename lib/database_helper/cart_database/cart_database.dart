import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mf_foodmart/models/cart_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  CartDatabase._privateConstructor();
  static final CartDatabase instance = CartDatabase._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart_items.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: createTable,
    );
  }

  void createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart_items(
        id INTEGER PRIMARY KEY,
        productId INTEGER,
        productImage TEXT,
        productName TEXT,
        productPrice TEXT,
        insertionTime TEXT,
        count INTEGER  
      )
      ''');
  }

  Future<void> insertCartItem(CartModel cartItem) async {
    final db = await database;
       final List<Map<String,dynamic>> cartList= await db.query(

           'cart_items',
         where: 'productId = ?',
         whereArgs: [cartItem.productId],
         orderBy: 'insertionTime DESC',

       );

       if(cartList.isNotEmpty){
         Fluttertoast.showToast(msg: 'Product is Already added to cart');
       }else{

         final currentTime=DateTime.now().toString();
          await db.insert(
           'cart_items',
           cartItem.toMap()..['insertionTime']=currentTime,
           conflictAlgorithm: ConflictAlgorithm.replace,
         );

          Fluttertoast.showToast(msg: 'Product added to cart');
       }

  }


  Future<void> updateCartItem(CartModel cartItem)async{
    final db=await database;
    await db.update('cart_items',
        cartItem.toMap(),
      where: 'productId = ?',
      whereArgs: [cartItem.productId]
    );
  }

  Future<List<CartModel>> getCartItems() async {
    final db = await instance.database;
     var product=await db.query(
         'cart_items',
         orderBy: 'insertionTime DESC',
     );

     List<CartModel> _product = product.isNotEmpty?product.map((json) => CartModel.fromMap(json)).toList():[];
      return _product;
  }
}
