class OrderModel {
  int? id;
  int productId;
  String productImage;
  String productName;
  String productPrice;
  int productQuantity;
  String date;

  OrderModel({
    this.id,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.date,

  });


  Map<String,dynamic> toMap(){
    return {
      'id':id,
       'productId':productId,
      'productImage':productImage,
      'productName':productName,
      'productPrice':productPrice,
      'productQuantity':productQuantity,
      'date':date,
    };
  }

  factory OrderModel.fromMap(Map<String,dynamic> map){

    return OrderModel(
        id: map['id'],
        productId: map['productId'],
        productImage: map['productImage'],
        productName: map['productName'],
        productPrice: map['productPrice'],
        productQuantity:map['productQuantity'],
        date:map['date'],

    );
  }




}
