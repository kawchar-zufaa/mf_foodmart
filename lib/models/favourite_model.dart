import 'dart:convert';

class FavouriteModel {
  final int productId;
  final List productImage;
  final String productName;
  final String productPrice;
  final String description;
  bool isFavourite=false;
  final int cid;
  final String categoryName;
  final String shortDescription;
  int count;

  FavouriteModel({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.description,
    required this.isFavourite,
    required this.cid,
    required this.categoryName,
    required this.shortDescription,
    this.count = 0,
  });

  // Convert Product object to map for storing in SQLite database
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productImage': jsonEncode(productImage),
      'productName': productName,
      'productPrice': productPrice,
      'description':description,
      'isFavourite':isFavourite,
      'cid':cid,
      'categoryName':categoryName,
      'shortDescription':shortDescription,
      'count': count,
    };
  }

  // Create Product object from map retrieved from SQLite database
  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      productId: map['productId'],
      productImage: jsonDecode(map['productImage']),
      productName: map['productName'],
      productPrice: map['productPrice'],
      description: map['description'],
      isFavourite: map['isFavourite'],
      cid: map['cid'],
      categoryName: map['categoryName'],
      shortDescription: map['shortDescription'],
      count: map['count'],
    );
  }



}
