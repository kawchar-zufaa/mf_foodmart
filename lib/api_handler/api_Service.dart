import 'dart:convert';

import 'package:mf_foodmart/models/cat_wise_product_model.dart';
import 'package:mf_foodmart/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:mf_foodmart/models/product_model.dart';
import 'package:mf_foodmart/utility/constants.dart';

class ApiService {
  static String username = "ck_389df1912d9d0be0541ee41dc1e3fcbfb367bbf9";
  static String password = "cs_643aea4269872c4005d4a106676bcd07e96af983";


  ///  All Categories method here.................................
  static Future<List<CategoriesModel>> fetchCategory() async {
    final response = await http.get(
      Uri.parse(MyConstants.categoriesApi),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body) as List;
      var jsonData =
          data.map((json) => CategoriesModel.fromJson(json)).toList();
      return jsonData;
    } else {
      throw Exception("failed to load data");
    }
  }



  /// Category wise product method here.................................
  static Future<List<CatWiseProductModel>> fetchCatWaysProduct(
      {required int cid}) async {
    final response = await http.get(
      Uri.parse(MyConstants.categoriesWaysProduct(cid)),
      headers: {
        'Authorization':
        'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic>? data = json.decode(response.body) as List<dynamic>?;
      if (data != null) {
        var jsonData = data.map((e) => CatWiseProductModel.fromJson(e)).toList();
        return jsonData;
      }
      return []; // If data is null, return an empty list
    } else {
      throw Exception('Failed to load data');
    }
  }




  /// All product method here.................................
  static Future<List<ProductModel>> fetchProduct({int page=1,perPage=10})async{
    final response = await http.get(Uri.parse(MyConstants.allProduct(page,perPage)),headers: {
      'Authorization':
      'Basic ${base64Encode(utf8.encode('$username:$password'))}',
    },);
    if(response.statusCode==200){
     List<dynamic> data=json.decode(response.body) as List;

     var jsonData=data.map((json) => ProductModel.fromJson(json)).toList();
     return jsonData;
    }else{
      throw Exception("No found Product");
    }

  }
}
