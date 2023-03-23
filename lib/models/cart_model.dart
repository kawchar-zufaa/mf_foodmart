class CartModel {
  int? id;
  final int productId;
  final String productImage;
  final String productName;
  final String productPrice;
  final int count;

  CartModel({
    this.id,
   required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.count,
  });


  factory CartModel.fromMap(Map<String,dynamic> map){

    return CartModel(
       id: map['id'],
        productId: map['productId'],
        productImage: map['productImage'],
        productName: map['productName'],
        productPrice: map['productPrice'],
        count: map['count']
    );
  }


  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'productId':productId,
      'productImage':productImage,
      'productName':productName,
      'productPrice':productPrice,
      'count':count,

    };
  }
}
